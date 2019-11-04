
//FUNCION DE CONSULTAS A MYSQL
function sqlQuery(callback, queryString){
// console.log(queryString);
  var mysql = require('mysql');
  var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : null,
    database : 'bicisoft'
  });

  connection.connect(function(err) {
    if(err){
      console.log(err.code);
      console.log(err.fatal);
    }
  });
  console.log("performing query ");
  // Perform a query

  connection.query(queryString, function(err, rows, fields) {
    if(err){

      if(err.code == 'ER_DUP_ENTRY' || err.errno == 1062){
        console.log('REGISTRO DUPLICADO');
      }
      else{
        console.log("OCURRIO UN ERROR SQL.");
        console.log(err);
      }

      return;
    }
    callback(err, rows);
  });
  // Close the connection
  connection.end(function(){
    // The connection has been closed
  });
}

/*var mysql = require('mysql');

// Add the credentials to access your database
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : null, // or the original password : 'apaswword'
    database : 'sample_data'
});

// connect to mysql
connection.connect(function(err) {
    // in case of error
    if(err){
        console.log(err.code);
        console.log(err.fatal);
    }
});

// Perform a query
$query = 'SELECT * FROM `myTableName` LIMIT 10';

connection.query($query, function(err, rows, fields) {
    if(err){
        console.log("An error ocurred performing the query.");
        console.log(err);
        return;
    }

    console.log("Query succesfully executed", rows);
});

// Close the connection
connection.end(function(){
    // The connection has been closed
});
*/
