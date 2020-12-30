var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.post('/search_movie/:page_number', function(req, res){
	var param	= req.body;
	var search_by_matrix = ['movies.title','movies.description','artists.name','genres.name'];
	var search_by = search_by_matrix[param.search_by]; //0:title 1:description 2:artists 3:genres
	var phrase	  = param.phrase;
	
	var page_number		= req.params.page_number;
	var Request 		= new sql.Request();
	var movie_per_page 	= 5;
	var end_data 		= page_number * movie_per_page;
	var start_data		= end_data - 4;
	
	var command = `
	WITH Results_CTE AS
	(
		SELECT
			movies.title,
			ROW_NUMBER() OVER (ORDER BY movies.id) AS RowNum
		FROM movies
		JOIN genres ON genres.id = movies.genre_id AND genres.status=1
		JOIN movie_artists ON movie_artists.movie_id = movies.id AND movie_artists.status=1
        JOIN artists ON artists.id = movie_artists.artist_id AND artists.status=1
		WHERE 1=1
		and movies.status=1
		and ${search_by} like '%${phrase}%'
	)
	SELECT distinct *
	FROM Results_CTE
	WHERE
	1=1
	and RowNum >= ${start_data}
	AND RowNum < ${start_data} + ${end_data}
	`
	
	Request.query(command,function(err,data){
		console.log(command);
		res.send(JSON.stringify(data.recordset));
	})
	
});

module.exports = router;