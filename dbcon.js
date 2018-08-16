var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs361_redmonb',
  password        : '2120',
  database        : 'cs361_redmonb'
});

module.exports.pool = pool;
