module.exports = function () {

  var express       = require('express'),
      router        = express.Router(),
      session       = require("express-session"),
      passportLocal = require('passport-local').Strategy,
      passportHttp  = require('passport-http').BasicStrategy,
      passport      = require('passport'),
      mysql         = require('./dbcon.js');
      //bcrypt        = require('bcrypt');

  passport.use(new passportLocal(verifyCredentials));
  passport.use(new passportHttp(verifyCredentials));



  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // FUNCTIONS
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  //Get all issues for user
  function getUserIssues (res, context, complete, user_id) {
      mysql.pool.query('SELECT iss.issue_id, iss.description, iss.district FROM issue_summary iss INNER JOIN user_data ud on ud.zip = iss.district WHERE ud.user_id ='+user_id+'', function (error, results, fields) {
          if (error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          context.userIssues = results;
          context.district = results[0].district;
          console.log("Results: ", results[0], "  District: ", results[0].district);
          console.log("getUserIssues: ", results);
          complete();
      });
  }

  function getUserVote (res, context, complete, issue_id, user_id) {
    mysql.pool.query("select dt.description from vote_details vd inner join issue_data dt on dt.issue_id = vd.issue_id and dt.choice = vd.vote_choice where vd.issue_id='"+issue_id+"'and vd.voter_id='"+user_id+"'", function (error, results) {
      if (error) {
        res.write(JSON.stringify(error));
        res.end();
      }

      if (results[0] != undefined) {
        context.choiceDesc = results[0].description;
      }
      complete();
    });
  }

  //Get all issues for user
  function getIssueDesc (res, context, complete, issue_id) {
      mysql.pool.query('SELECT iss.description FROM issue_summary iss WHERE iss.issue_id ="'+issue_id+'"', function (error, results, fields) {
          if (error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          context.desc = results[0].description;
          complete();
      });
  }

  //Get issue data
  function getIssue (res, context, issue_id, complete) {
    mysql.pool.query('SELECT dt.issue_id, dt.description, dt.choice FROM issue_data dt WHERE dt.issue_id ="'+issue_id+'"', function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.issue = results;
        context.issue_id = issue_id;
        complete();
    });
}

  // middleware function to only allow certain access when logged in
  function isLoggedIn(req, res, next) {
    if(req.isAuthenticated()) {
      return next();
    }
    res.redirect('/');
  }

  // verify credentials
  // SOURCE: http://blog.arpitdubey.com/login-and-http-authentication-in-nodejs-using-passportjs-mysql/
  function verifyCredentials(username, password, done) {
    console.log("HERE: verifyCredentials")
    mysql.pool.query('SELECT * FROM user_data WHERE username="'+username+'"', function(err, rows) {

      console.log("HERE: verifyCredentials - query")
      if(err) {
        done(null, null);
      }

      if(typeof rows[0] != 'undefined')
      {
          if(password == rows[0].password) {
            console.log("HERE: verifyCredentials - true")
            done(null, rows[0]);
          }
          else {
            console.log("HERE: verifyCredentials - false")
            done(null, null);
          }
        }
      else {
        done(null, null);
      }
    });
  }

  // passport authentication: serialize user
  passport.serializeUser(function (user, done) {
    console.log("HERE: serializeUser")
    done(null, user.user_id);
  });

  // passport authentication: deserialize user
  passport.deserializeUser(function(user_id, done) {
    console.log("HERE: deserializeUser")
    mysql.pool.query('SELECT user_id, username FROM user_data WHERE user_id="'+user_id+'"', function(err, rows) {
      if(err) {
        throw err;
      }
      else {
        done(null, rows[0]);
      }
    });
  });

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // GETS
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // show registration page
  router.get('/register', function(req, res) {
      res.render('register');
  })

  // show login page
  router.get('/', function(req, res) {
    console.log("HERE: show login page")
    res.render('user_login', {
      isAuthenticated: req.isAuthenticated(),
      user: req.username
    })
  });

  // show lobby after logged in
  router.get('/lobby', isLoggedIn, function(req, res) {
    console.log("HERE: show lobby page");
    console.log("USER: ", req.user);
    res.render('lobby', {first_name: req.user.first_name,
                         last_name: req.user.last_name });
  });

  // log out of the session
  router.get('/logout', function(req, res) {
    req.logout();
    res.redirect('/');
  })

  // show issues list page
  router.get('/userIssues', isLoggedIn, function (req, res) {
      var callbackCount = 0;
      var context = {};
      var mysql = req.app.get('mysql');
      getUserIssues(res, context, complete, req.user.user_id);
      function complete() {
          callbackCount++;
          if (callbackCount >= 1) {
              res.render('issuesList', context);
          }
      }
  });

  router.get('/userIssues/:issue_id', isLoggedIn, function(req, res){
    callbackCount = 0;
    var context = {};
    var mysql = req.app.get('mysql');
    getIssue(res, context, req.params.issue_id, complete);
    getIssueDesc(res, context, complete, req.params.issue_id)
    getUserVote(res, context, complete, req.params.issue_id, req.user.user_id);
    function complete() {
      callbackCount++;
      if(callbackCount >= 3){
        if (context.choiceDesc) {
          console.log ("You did it!");
          res.render('updateVote', context);
        }
        else {
          res.render('issuePage', context);
        }
      }
    }
  });

  // show forgot password page
  router.get('/forgot', function(req, res) {
      res.render('forgot');
  })

  // show budget page
  router.get('/userBudget', isLoggedIn, function(req, res) {
      res.render('budgetPage');
  })

  // show vote page
  router.get('/vote', isLoggedIn, function(req, res) {
      res.render('votePage');
  })


  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // POSTS
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  //User Registration
  router.post('/register', function (req, res, next) {
      var mysql = req.app.get('mysql');
      //mysql.pool.query("INSERT INTO user_data (username, password, userFname, userLname, userDOB, address, city, state, zipCode, email, stateID, userSSN, gender, race) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      mysql.pool.query("INSERT INTO user_data (username, password, first_name, last_name, dob, address, city, state, zip, email, state_id, ssn, race, sex) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
          [req.body.username, req.body.password, req.body.userFname, req.body.userLname, req.body.userDOB, req.body.address, req.body.city, req.body.state, req.body.zipCode, req.body.email, req.body.stateID, req.body.userSSN, req.body.race, req.body.gender], function (err, results) {
              if (err) {
                  res.write(JSON.stringify(err));
                  res.end();
              }

              else {
                  res.redirect('/');
              }
          });
  });

  // authenticate login and redirect to login (fail) or lobby (success)
  router.post('/', passport.authenticate('local', {
    failureRedirect: '/',
    successRedirect: '/lobby'
  }), function(req, res) {
      console.log("HERE: post authenticate")
  });


  // Used for resetting password
  router.post('/validateIdentity', function (req, res, next)
  {
	var mysql = req.app.get('mysql');
	mysql.pool.query("SELECT username FROM user_data WHERE first_name=? AND last_name=? AND dob=? AND ssn=?",
			 [req.body.userFname, req.body.userLname, req.body.userDOB, req.body.userSSN],
		function(err, results, fields)
		{
      console.log("Validate Identity: ", results[0].username);
      console.log(req.body.userFname, req.body.userLname, req.body.userDOB, req.body.userSSN);
			if (err)
			{
				res.write(JSON.stringify(err));
				res.end();
			}
			else if (results.length == 1)
			{
				res.render('reset', results[0]);
			}
			else
			{
				res.render('invalid');
			}
		});
  });

  // Used for resetting password
  router.post('/reset', function (req, res, next)
  {
	var mysql = req.app.get('mysql');
	mysql.pool.query("UPDATE user_data SET password=? WHERE username=?", [req.body.password, req.body.username],
		function(err, results, fields)
		{
			if (err)
			{
				res.write(JSON.stringify(err));
				res.end();
			}
			else
			{
				res.render('user_login');
			}
		});
  });


  //Vote on an issue
  router.post('/vote', function (req, res, next) {
      console.log("VOTE: ", req.user.user_id, req.body.issue_id, req.body.choice)
      var mysql = req.app.get('mysql');
      mysql.pool.query("INSERT INTO vote_details (voter_id, issue_id, vote_choice) VALUES (?, ?, ?)",
          [req.user.user_id, req.body.issue_id, req.body.choice], function (err, results) {
              if (err) {
                  res.write(JSON.stringify(err));
                  res.end();
              }
              else {
                  res.redirect('/userIssues');
              }
          });
  });







//Vote Update
  router.put('/vote', function(req, res){
    var mysql = req.app.get('mysql');
    mysql.pool.query("UPDATE vote_details SET vote_choice='"+req.body.choice+"' WHERE voter_id='"+req.user.user_id+"' AND issue_id='"+req.body.issue_id+"'", function (error) {
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }
        else{
            res.redirect('/userIssues');
        }
    });
  });

  return router;
}();