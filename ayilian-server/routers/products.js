const express=require("express");
const router=express.Router();
const pool=require('../pool');

router.get("/",(req,res)=>{
  
  var kwords=decodeURIComponent(req.query.kwords);
  // console.log(kwords);
  var output={
    pno:0,
    pageSize:9,
    count:0,
    pageCount:0,
    products:[]
  }
  if(req.query.pno!==undefined){
    output.pno=parseInt(req.query.pno);
  }  
  if(req.query.kwords!==undefined){
    // console.log(kwords);
    kwords=kwords.split(" ");
    kwords.forEach(function(elem,i,arr){
      arr[i]=`%${elem}%`;
    })
    var arr=[];
    for(var kw of kwords){
      arr.push(` title like ?`)
    }
    var where=" where "+arr.join(" and ");
    var sql="select * from ayl_product_details"+where;
    console.log(sql);
    pool.query(sql,kwords,(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        var count=result.length
        output.count=count;
        output.pageCount=Math.ceil(count/output.pageSize);
        var starti=output.pno*output.pageSize;
        output.products=result.slice(starti,starti+output.pageSize);
        res.send(output);
      }else{
        res.send({code:404,msg:"该商品暂未上线，敬请期待"});
      }
      
    })
  }else{
    console.log(kwords);
    pool.query("select *  from ayl_product_details",(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        var count=result.length
        output.count=count;
        output.pageCount=Math.ceil(count/output.pageSize);
        var starti=output.pno*output.pageSize;
        output.products=result.slice(starti,starti+output.pageSize);
        res.send(output);
      }
    })
  }
    
})
router.get("/lookbook",(req,res)=>{
  var family_id=req.query.fid;
  pool.query("SELECT * FROM  ayl_lookbook_details WHERE family_id=?",family_id,(err,result)=>{
    if(err)throw err;
    res.send(result);
  })

});
/******购物车******/
//添加购物车
router.get("/addCart",(req,res)=>{
  //1:获取3个参数
  var uid = req.query.uid;
  var pid = req.query.pid;
  var c = req.query.count;
  var s = req.query.size;
  // cid INT PRIMARY KEY AUTO_INCREMENT,
	// uid INT,
	// pid INT,
	// size VARCHAR(2),
	// count INT
  //2:创建sql语句
  var sql="SELECT  cid FROM ayl_shopping_cart WHERE uid=? AND pid=? AND size=?";
  pool.query(sql,[uid,pid,s],(err,result)=>{
    if(err)throw err;
    if(result.length==0){

      pool.query(" INSERT INTO  ayl_shopping_cart  VALUES (null,?,?,?,?)",[uid,pid,s,c],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"成功添加进购物车"});
        });
    }else{
        pool.query("UPDATE ayl_shopping_cart SET count=? WHERE pid=? AND uid=? AND size=? ",[c,pid,uid,s],(err,result)=>{
        if(err)throw err;
        // console.log(result);
        if(result.affectedRows>0){
             res.send({code:1,msg:"成功添加进购物车"})
        }else{
            res.send({code:-1,msg:`失败`});
        }
       
    })

    }
});

  
  //3:返回添加结果
})
//得到购物车
router.get("/getCarts",(req,res)=>{
  var uid =req.query.uid;
  var sql="SELECT c.pid,c.uid,c.count,c.size,p.price,p.title,p.color,p.img,c.size FROM ayl_product_details p,ayl_shopping_cart c WHERE p.pid=c.pid AND c.uid=?";
  uid=parseInt(uid);
  pool.query(sql,uid,(err,result)=>{
      if(err)throw err;
      // console.log(result);
      if(result.length>0){
           res.send({code:1,msg:"查询成功",data:result})
      }else{
          res.send({code:-1,msg:`您还没有购买任何商品!点我<a href="products.html">去购物</a>`});
      }
     
  })
})
//更新购物车
router.get("/updateCart",(req,res)=>{
  var pid=req.query.pid;
  var count=req.query.count;
  var size=req.query.size;
  
  var sql="UPDATE ayl_shopping_cart SET count=?,size=? WHERE pid=?"
  // 3.json
  pid=parseInt(pid);
  pool.query(sql,[count,size,pid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
          res.send({code:1,msg:"修改成功"});
      }else{
          res.send({code:-1,msg:"更新失败"});
      }
  })
})
//删除购物车
router.get("/deleteCart",(req,res)=>{
  var pid=req.query.pid;
  var uid=req.query.uid;
  var size=req.query.size;
  var sql="DELETE FROM ayl_shopping_cart  WHERE pid=? AND uid=? AND size=?";
  // 3.json
  pid=parseInt(pid);
  uid=parseInt(uid);
  pool.query(sql,[pid,uid,size],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
          res.send({code:1,msg:"删除成功"});
      }else{
          res.send({code:-1,msg:"删除失败"});
      }
  })
})
router.get("/deleteCarts",(req,res)=>{
  var pid=req.query.pid;
  var uid=req.query.uid;
   uid=parseInt(uid);
  console.log(pid);
    for(var i=0;i<pid.length;i++){
        var id=parseInt(pid[i]);
        var sql="DELETE FROM ayl_shopping_cart  WHERE pid=? AND uid=? ";
        pool.query(sql,[id,uid],(err,result)=>{
          if(err)throw err;
          if(i==pid.length-1){
            res.send({code:1,msg:"删除成功"});
        }
      })
    } 
})

/****我的收藏 */
 //取
 router.get("/getCollect",(req,res)=>{
  var uid=parseInt(req.query.uid);
  console.log(uid);
  pool.query("SELECT p.pid,p.title,p.img FROM ayl_product_details p,ayl_collect c WHERE p.pid=c.pid AND c.uid=?",uid,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result});
    }else{
      res.send({code:-1,msg:"您的收藏夹还未添加任何商品哦^_^"});
    }
  })
})
//存
router.get("/addCollect",(req,res)=>{
  var uid=parseInt(req.query.uid);
  var pid=parseInt(req.query.pid);
  pool.query("SELECT * FROM ayl_collect WHERE uid=?  AND pid=?",[uid,pid],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      pool.query("INSERT INTO ayl_collect VALUES(NULL,?,?)",[uid,pid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"成功添加至收藏夹"});
      })
    }else{
        res.send({code:-1,msg:"您已经收藏该商品"});
    }
    
  })
})
//删
router.get("/deleteCollect",(req,res)=>{
  var uid=parseInt(req.query.uid);
  var pid=parseInt(req.query.pid);
  pool.query("DELETE  FROM ayl_collect WHERE uid=?  AND pid=?",[uid,pid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
        res.send({code:1,msg:"已删除"});
    }else{
        res.send({code:-1,msg:"服务器出错了"});
    }
    
  })
})
module.exports=router;