var express		= require('express');
var sql			= require('mssql');
var multer 		= require('multer');
var path        = require('path');
var fs			= require('fs');

var router		= express.Router();

var uploaded_file = "";

const storage = multer.diskStorage({
    destination : './public/videos/',
    filename: function(req, file, cb){
		uploaded_file = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
		cb(null,uploaded_file);
    }
});
var upload = multer({
	storage: storage,
	fileFilter: (req, file, cb) => {
		if (file.mimetype == "video/mp4" ) {
			cb(null, true);
		} else {
			cb(null, false);
			return cb('Only .mp4 format allowed!');
		}
	}
}).any();

router.post('/create_movie', function(req, res){

	upload(req, res, err => {
       if (err){
		   res.send({'status':'err','error_message':err,'data':[]});
	   }else{
		   
		   var param		= req.body;
		   var title		= param.title;
		   var description	= param.description;
		   var duration		= param.duration;
		   var genre_id		= param.genre_id;
		   var artists		= param.artists.split(',');
		   
		   var Request 		= new sql.Request();
		   var command = `
		   insert into movies
		   (title,description,duration,watchURL,status,genre_id)
		   values
		   ('${title}','${description}',${duration},'${uploaded_file}',1,${genre_id})
		   SELECT SCOPE_IDENTITY() AS 'insert_id'
		   `
		   
			Request.query(command,function(err,data){
				if(err){
					res.send({'status':'err','error_message':'insert movie error','data':[]});
				}else{
					var movie_id = data.recordset[0].insert_id;
					var str = ``
					for(x=0;x<artists.length;x++){
						var artist_id = artists[x];
						str = str + '('+artist_id+','+movie_id+',1),';
					}
					str = str.substring(0,str.length-1);

					var command2 = `
					insert into movie_artists
					(artist_id,movie_id,status)
					values
					${str}
					`
					Request.query(command2,function(err,data){
						if(err){
							res.send({'status':'err','error_message':'insert movie artists error','data':[]});
						}else{
							var data = [];
							data[0]				= {};
							data[0].id			= movie_id;
							data[0].title		= title;
							data[0].description	= description;
							data[0].duration	= duration;
							data[0].genre_id	= genre_id;
							data[0].artists		= artists;
							data[0].watchURL	= uploaded_file;
							res.send({'status':'success','data':data});
						}
					});
					
				}
			})
			
	   }
    });
		
});

module.exports = router;