var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.post('/api/v1/search_movie/:page_number', function(req, res){
	
	var param			 	= req.body;
	var phrase	  		 	= param.phrase;
	var page_number			= req.params.page_number;
	var movie_per_page 		= 5;
	var end_data 			= page_number * movie_per_page;
	var start_data			= end_data - 4;
	var search_by_matrix 	= ['m.title','m.description','a.name','g.name'];
	
	var Request 			= new sql.Request();
	var prom1 = new Promise(function(resolve,reject){
		if(search_by_matrix[param.search_by]!="a.name"){
			search_by1			= search_by_matrix[param.search_by];
			var command = `
			WITH Results_CTE AS
			(
				SELECT
					m.id,
					m.title,
					m.description,
					m.duration,
					m.watchurl,
					g.name AS 'genre',
					ROW_NUMBER() OVER (ORDER BY m.id) AS RowNum
				FROM movies m
				JOIN genres g ON g.id = m.genre_id and g.status=1
				WHERE 1=1
				AND m."status" = 1
				AND ${search_by1} like '%${phrase}%'
			)
			SELECT *
			FROM Results_CTE
			WHERE RowNum >= ${start_data}
			AND RowNum < ${start_data} + ${end_data}
			`
		}else if(search_by_matrix[param.search_by]=="a.name"){
			
			var command = `
			WITH Results_CTE AS
			(
						SELECT
							m.id,
							m.title,
							m.description,
							m.duration,
							m.watchurl,
							g.name AS 'genre',
							ROW_NUMBER() OVER (ORDER BY m.id) AS RowNum
						FROM movies m
						JOIN genres g ON g.id = m.genre_id and g.status=1
						
						inner JOIN (
							SELECT
							ma.movie_id
							FROM artists a
							JOIN movie_artists ma ON ma.artist_id = a.id and ma.status=1
							WHERE a.name LIKE '%${phrase}%'
							and a.status=1
							GROUP BY ma.movie_id
						) o
						ON o.movie_id = m.id
						
						WHERE 1=1
						AND m."status" = 1
			)
					SELECT *
					FROM Results_CTE
					WHERE RowNum >= ${start_data}
					AND RowNum < ${start_data} + ${end_data}
			`
			
		}
		
	
		Request.query(command,function(err,data){
			if(err){
				resolve('err');
			}else{
				resolve(data.recordset);
			}
		})
	});
	
	var prom2 = new Promise(function(resolve,reject){
		var command = `
		SELECT
		a.name,
		m.id
		FROM artists a
		JOIN movie_artists ma ON ma.artist_id = a.id AND ma."status"=1
		JOIN movies m ON m.id = ma.movie_id AND m."status"=1
		WHERE
		a."status"=1
		`

		Request.query(command,function(err,data){
			if(err){
				resolve('err');
			}else{
				resolve(data.recordset);
			}
		})
	});
	
	Promise.all([prom1,prom2]).then(function(values) {
		if(values[0]!="err"&&values[1]!="err"){
			values[0].forEach(function(a,b){
				a.artists=[];
				values[1].forEach(function(c,d){
					if(a.id==c.id){
						a.artists.push(c.name);
					}
				});
			})
			res.send({'status':'success','data':values[0]});
		}else{
			res.send({'status':'err','data':[]});
		}
	});
	
});

module.exports = router;