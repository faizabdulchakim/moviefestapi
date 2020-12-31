var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.post('/most_view', function(req, res){
	var param				= req.body;
	var most_view_matrix	= ['movies','genres'];
	var most_view_type		= most_view_matrix[param.most_view_type];//0:movies, 1:genres

	var command= ``;
	if(most_view_type=="movies"){
		command = `
		SELECT
			COUNT(views.movie_id) 'count_view',
			movies.title
			
		FROM
			movies
		JOIN views ON views.movie_id = movies.id
		GROUP BY views.movie_id,movies.title
		ORDER BY count_view DESC
		`
	}else if(most_view_type=="genres"){
		command=`
		SELECT
			COUNT(genres.name) AS 'count_view',
			genres.name
		FROM
			genres
		JOIN movies ON movies.genre_id = genres.id
		JOIN views ON views.movie_id = movies.id
		GROUP BY genres.name
		`
	}
	
	var Request 			= new sql.Request();
	Request.query(command,function(err,data){
		res.send(JSON.stringify(data.recordset));
	})
	
});

module.exports = router;