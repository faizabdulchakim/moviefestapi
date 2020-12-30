var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.get('/list_movie/:page_number', function(req, res){
	var page_number = req.params.page_number;
	var Request = new sql.Request();
	Request.query('select * from user_account',function(err,data){
		console.log(data.recordset);
		res.send("LIST MOVIE PAGE:"+page_number);
	})
	
});

module.exports = router;