var express         = require('express'),
    handlebars      = require('express-handlebars').create({ defaultLayout: 'main' }),
    session         = require('express-session'),
    mysql           = require('./dbcon.js'),
    bodyParser      = require('body-parser'),
    cookieParser    = require('cookie-parser'),
    passportLocal   = require('passport-local').Strategy,
    passportHttp    = require('passport-http').Strategy,
    passport        = require('passport');

var app = express();

app.use('/static', express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(session(
  {secret: 'SuperSecretPassword',
   saveUninitialized: false,
   resave: false
  }));
app.use(passport.initialize());
app.use(passport.session());

passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
  passport.deserializeUser(function(user, done) {
    done(null, user);
  });

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);

app.use('/', require('./voteOrg.js'));

app.use(function (req, res) {
    res.status(404);
    res.render('404');
});

app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.status(500);
    res.render('500');
});

app.listen(app.get('port'), function () {
    console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
