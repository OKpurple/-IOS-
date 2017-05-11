var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  port     : 3306,
  database : 'mydb'
});
module.exports = function(app, fs)
{
  //회원가입
  app.post('/addUser', function(req, res){
    let test=req.body;
    console.log(test["user_id"]);
    let data=[test["user_id"],test["user_password"],test["user_name"],test["user_sex"],test["user_age"]]
    connection.query('insert into user values(?,?,?,?,?)',data,function(error, result){
        if(!error){
                 console.log(result);
            }
    		})
     res.end();
  });
  //동행글 올리기
  app.post('/addBull', function(req, res){
    let test=req.body;
    console.log(test["num"]);
    let data=[test["user_id"],test["title"],test["content"],test["latitude"],test["longitude"],test["date"]]
    connection.query('insert into bulletin(user_id,title,content,latitude,longitude,date)  values(?,?,?,?,?,?)',data,function(error, result){
        if(!error){
                 console.log(result);
            }else{
              console.log(error);
            }
        })
     res.end();
  });
  //자기가 올린 동행정보 보기
  app.get('/myUser/:user_id', function(req, res){
    connection.query('SELECT * from user where user_id='+"'"+req.params.user_id+"'", function(err, rows, fields) {
      if (!err){
        console.log(rows);
      }
      else{
        console.log('Error while performing Query.');
      }
      res.json(rows);
    });
  });
  //위치에 따른 동행 정보넘겨주기
    app.get('/bullUser/:lat&:lon', function(req, res){
      var lat =new Number(req.params.lat);
      var lon =new Number(req.params.lon);
      connection.query('SELECT * FROM bulletin WHERE latitude >='+"'"+ (lat-0.01)+"'" + ' AND latitude <='+"'"+ (lat+0.01)+"'" +' AND longitude >= '+"'" +(lon-0.01)+"'"+' AND longitude <= '+"'"+(lon+0.01)+"'", function(err, rows, fields) {
        if (!err){
          console.log(rows);
        }
        else{
          console.log('Error while performing Query.');
        }
        res.json(rows);
      });
            });
//비번바꾸기 아직안함
    app.put('/updateUser/:username', function(req, res){
      connection.query('insert into board values(?)','a',function(error, result){
           if(!error){
                     console.log(result);
                 }
      });
    });
//board_num으로 자신 게시물 삭제
    app.delete('/deleteBull/:board_num', function(req, res){
          connection.query('delete from bulletin where num='+req.params.board_num,[1],function(error, result){
               if(!error){
                         console.log(result);
                         res.end();
                     }
          });
})
}
