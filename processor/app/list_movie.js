var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.get('/list_movie/:page_number', function(req, res){
	var page_number		= req.params.page_number;
	var Request 		= new sql.Request();
	var movie_per_page 	= 5;
	var end_data 		= page_number * movie_per_page;
	var start_data		= end_data - 4;
	
	var command = `
	WITH Results_CTE AS
	(
		SELECT
			title,
			ROW_NUMBER() OVER (ORDER BY id) AS RowNum
		FROM movies
		WHERE 1=1
	)
	SELECT *
	FROM Results_CTE
	WHERE RowNum >= ${start_data}
	AND RowNum < ${start_data} + ${end_data}
	`
	
	Request.query(command,function(err,data){
		res.send(JSON.stringify(data.recordset));
	})
	
});

module.exports = router;