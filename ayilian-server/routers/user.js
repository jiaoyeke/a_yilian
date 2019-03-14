const express=require('express');
var router=express.Router();
const pool=require('../pool.js');
//登录路由
router.post('/login',function(req,res){
	var $account=req.body.account;
	// console.log($account);
	var $upwd=req.body.upwd;
	if(isNaN(Number($account))){
		pool.query('SELECT * FROM ayl_user WHERE email=? AND upwd=?',[$account,$upwd],function(err,result){
			if(err)throw err;
			if(result.length>0){
				// console.log(result)
				var uid=result[0].uid;
				// console.log(uid);
				req.session.email=$account;
				req.session.uid=uid;
				// console.log(req.session.email);
				res.send({code:1,msg:"登陆成功",uid:uid,email:$account})
			}else{
				res.send({code:-1,msg:"用户名或密码错误"});	
			}
		});  
	}else{
		pool.query('SELECT * FROM ayl_user WHERE phone=? AND upwd=?',[$account,$upwd],function(err,result){
			if(err)throw err;
			if(result.length>0){
				console.log(result)
				var uid=result[0].uid;
				res.send({code:1,msg:"登陆成功",uid:uid})
			}else{
				res.send({code:-1,msg:"用户名或密码错误"});	
			}
		}); 
	}
	
});
//检测邮箱是否存在
router.get('/check_email',function(req,res){
	var $email=req.query.account;
	// console.log($email);
	pool.query('SELECT * FROM ayl_user WHERE email=?',$email,function(err,result){
		if(err)throw err;
		if(result.length==0){
			res.send({code:1,msg:"通过"});
		}else{
			res.send({code:-1,msg:"该邮箱已经被占用"});
		}
	});
});

//检测电话号码是否存在
router.get('/check_phone',function(req,res){
	var $phone=req.query.phone;
	pool.query('SELECT * FROM ayl_user WHERE phone=?',$phone,function(err,result){
		if(err) throw err;
		if(result.length==0){
			res.send({code:-1,msg:"通过"});
		}else{
			res.send({code:1,msg:"该手机号已经被占用"});
		}
	});
});

//注册路由
router.post('/reg',function(req,res){
	// console.log(123456);
	var $email=req.body.email;
	var $upwd=req.body.upwd;
	pool.query('INSERT INTO ayl_user(uid,email,upwd) VALUES(NULL,?,?)',[$email,$upwd],function(err,result){
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:'注册成功'});
		}else{
			res.send({code:-1,msg:'注册失败'});
		}
	});
});
//检测用户是否是登录状态
router.get("/islogin",(req,res)=>{
	if(!req.session.email)
	  res.send({ok:0});
	else
	 console.log(req.session.email);
	//   res.send({ok:1,email:req.session.email});
  })
  router.get("/signout",(req,res)=>{
	req.session.uid=undefined;
	req.session.email=undefined;
	res.end();
  })




































































/*
//更改信息
//1.先查找到当前用户的信息
router.get('/sel',function(req,res){
	var $uid=req.query.uid;
	pool.query('SELECT * FROM vancl_user WHERE uid=?',$uid,function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send(result[0]);
		}else{
			res.send('1');
		}
	});
});*/
/*
//注销某个用户的信息
router.get('/delete',function(req,res){
	var obj=req.query;
	var $uid=obj.uid;
	pool.query('DELETE FROM vancl_user WHERE uid=?',$uid,function(err,result){
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});
*/
module.exports=router;