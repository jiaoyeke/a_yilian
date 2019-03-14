const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var pid=req.query.pid;
  var output={
    product:{/*详细信息*/},
    specs:[/*{规格},{规格},{规格}*/],
    pics:[/*{图片},{图片},{图片}*/],
    model:[/*{图片},{图片},{图片}*/],
    recoment:[/*{商品},{商品},{商品}*/]
  };
  //查询商品对象
  var sql="select * from ayl_product_details where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) console.log(err);
    output.product=result[0];
    //查询规格列表
    var fid=output.product.fid;
    var sql="select pid,color,size from ayl_product_details where fid=?";
    pool.query(sql,[fid],(err,result)=>{
      if(err) console.log(err);
      output.specs=result;
      //查询图片列表
      var sql="select * from ayl_product_pic where lid=?";
      pool.query(sql,[fid],(err,result)=>{
        if(err) console.log(err);
        output.pics=result;
        pool.query("SELECT * FROM ayl_detail_model WHERE pid=?",[fid],(err,result)=>{
          if(err) console.log(err);
          output.model=result;
          // res.send(output);
          pool.query("select * from ayl_product_details limit 8",(err,result)=>{
            if(err) console.log(err);
            output.recomment=result;
            res.send(output);
          })

        })
      })
    });
  });
})
module.exports=router;