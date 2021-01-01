var express		= require('express');
var sql			= require('mssql');
var router		= express.Router();

router.get('/api/v1/viewership', function(req, res){
	
	var Request 			= new sql.Request();
	var prom1 = new Promise(function(resolve,reject){
		var command = `
		SELECT
		id,
		title
		FROM
		movies
		WHERE
		status=1
		`
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
		ua.name,
		v.movie_id
		FROM
		views v
		JOIN user_account ua ON ua.id = v.user_account_id
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
				a.viewership = [];
				values[1].forEach(function(c,d){
					if(c.movie_id == a.id){
						a.viewership.push(c.name);
					}
				})
			})
			res.send({'status':'success','data':values[0]});
		}else{
			res.send({'status':'err','data':[]});
		}
	});
	
});

module.exports = router;