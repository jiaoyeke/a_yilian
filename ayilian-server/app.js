const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./routers/user.js');
const indexRouter=require('./routers/index.js');
const productsRouter=require("./routers/products.js");
const detailsRouter=require("./routers/details");
const session=require("express-session");
const cors=require("cors");
var app=express();
app.listen(3000,function(){
	console.log('服务器创建成功');
});

app.use(bodyParser.urlencoded({
	extended:false
}));
app.use(cors({
	origin:"http://127.0.0.1:5500",
	credentials:true
}))
app.use(session({
	secret:"128位随机字符",
  	resave:false,
	saveUninitialized:true,
	cookie:{
		maxAge:1000*60*60*24
	}
}))

app.use(express.static('public'));
app.use('/user',userRouter);
app.use("/index",indexRouter);
app.use("/products",productsRouter);
app.use("/details",detailsRouter);
