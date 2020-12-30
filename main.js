var express						= require('express');
var axios						= require('axios');
var sql							= require('mssql');
var cors 						= require('cors');
var bodyParser					= require('body-parser');

var app	= express();

var corsOptions = {
	origin: function(origin, callback){
		callback(null, true);
	}
}

var db_config = {
	server   : 'localhost',
	user     : 'zunaira',
	password : 'khaizura',
	database : 'cms',
      "options": {
        "encrypt": true,
        "enableArithAbort": true
        }
};

sql.connect(db_config, function (err) {
	if (err) console.log(err);
});

var list_movie			= require('./processor/app/list_movie.js');
var search_movie			= require('./processor/app/search_movie.js');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set('axios',axios);
app.use(list_movie);
app.use(search_movie);

app.get('/*', function(req, res) {
  res.send("WELCOME TO API");
});

app.listen(80,function(){console.log("API SERVER START!")});
//app.listen(process.env.PORT,function(){console.log("API SERVER START!")});
