const express=require("express");
const router=express.Router();
const pool=require("../pool");
router.get("/",(req,res)=>{
    var output={
        carousel:[],
        pics:[],
        foot_nav:[]
    };
    var flag=0;
    var sql="SELECT * FROM ayl_index_carousel";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        // res.send(result);
        output.carousel=result;
        //pool.query是异步函数
        flag+=50;
        if(flag==150)res.send(output);
    });
    pool.query('SELECT * FROM ayl_index_product',(err,result)=>{
        if(err)throw err;
        // res.send(result);
        output.pics=result;
        flag+=50;
        if(flag==150)res.send(output);
    });
    pool.query('SELECT * FROM ayl_index_foot_nav',(err,result)=>{
        if(err)throw err;
        // res.send(result);
        output.foot_nav=result;
        flag+=50;
        if(flag==150)res.send(output);
    });
    
});
module.exports=router;