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
var upload = multer({storage: storage}).any();//.single('videoFile');

router.post('/create_movie', function(req, res){


	upload(req, res, err => {
       if (err){
		   res.send({'status':'err','data':[]});
	   }else{
		   //console.log(req.body.title);
		   
		   var param		= req.body;
		   var title		= param.title;
		   var description	= param.description;
		   var duration		= param.duration;
		   var genre_id		= param.genre_id;
		   var artists		= param.artists;
		   
		   var Request 		= new sql.Request();
		   var command = `
		   insert into movies
		   (title,description,duration,watchURL,status,genre_id)
		   values
		   ('${title}','${description}',${duration},'${uploaded_file}',1,${genre_id})
		   `
		   console.log(command);
			Request.query(command,function(err,data){
				
				if(err){
					res.send({'status':'err','data':[]});
				}else{
					res.send({'status':'success','data':'ok'});
				}
			})
			
	   }
    });
		
});

module.exports = router;