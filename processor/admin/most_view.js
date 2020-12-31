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
			COUNT(v.movie_id) 'count_view',
			m.title
			
		FROM
			movies m
		JOIN views v ON v.movie_id = m.id
		GROUP BY v.movie_id,m.title
		ORDER BY count_view DESC
		`
	}else if(most_view_type=="genres"){
		command=`
		SELECT
			COUNT(g.name) AS 'count_view',
			g.name
		FROM
			genres g
		JOIN movies m ON m.genre_id = g.id and m.status=1
		JOIN views v ON v.movie_id = m.id
		GROUP BY g.name
		`
	}
	
	var Request 			= new sql.Request();
	Request.query(command,function(err,data){
		if(err){
			res.send({'status':'err','data':[]});
		}else{
			res.send({'status':'success','data':data.recordset});
		}
	})
	
});

module.exports = router;