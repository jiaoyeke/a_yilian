SET NAMES UTF8;
DROP DATABASE IF EXISTS ayl;
CREATE DATABASE  ayl CHARSET=UTF8;
USE ayl;
#用户信息表
CREATE TABLE ayl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
 	avatar VARCHAR(128),
	gender TINYINT DEFAULT 1
);

INSERT INTO ayl_user VALUES(NULL,'zhangmanman','123456','zhangmanman@qq.com','13843284925',null,'0');
INSERT INTO ayl_user VALUES(NULL,'lianliuchao','123456','lianliuchao@qq.com','13843284925',null,'1');
INSERT INTO ayl_user VALUES(NULL,'ningco','123456','ningco@qq.com','13843284925',null,'1');

/**收货地址表**/
CREATE TABLE ayl_receiver_address(
	aid INT PRIMARY KEY,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	fixedphone VARCHAR(16),
	postcode CHAR(6),
	tag VARCHAR(16),
	is_default TINYINT 
);

/*购物车条目**/
CREATE TABLE ayl_shopping_cart(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	pid INT,
	size VARCHAR(2),
	count INT
);
INSERT INTO ayl_shopping_cart VALUES(NULL,1,1,"L",2);
INSERT INTO ayl_shopping_cart VALUES(NULL,1,2,"L",3);
INSERT INTO ayl_shopping_cart VALUES(NULL,1,3,"L",9);
/***用户订单列表详情****/
CREATE TABLE ayl_order_detail(
	did INT,
	order_id INT,
	product_id INT,
	count INT
);

/*******用户收藏表********/
CREATE TABLE ayl_collect(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	pid INT
);
INSERT INTO ayl_collect VALUES(NULL,1,12);
INSERT INTO ayl_collect VALUES(NULL,1,24);
INSERT INTO ayl_collect VALUES(NULL,1,16);
INSERT INTO ayl_collect VALUES(NULL,1,8);
INSERT INTO ayl_collect VALUES(NULL,1,3);
INSERT INTO ayl_collect VALUES(NULL,1,2);
INSERT INTO ayl_collect VALUES(NULL,1,4);
INSERT INTO ayl_collect VALUES(NULL,1,9);
/****首页轮播广告商品****/

CREATE TABLE ayl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)#点击图片要跳转
);
INSERT INTO ayl_index_carousel VALUES(NULL,'img/index/index/carousel/banner1.jpg','轮播商品1','product_details.html?lid=2'),
(NULL,'img/index/index/carousel/banner2.jpg','轮播商品1','product_details.html?lid=2'),
(NULL,'img/index/index/carousel/banner3.jpg','轮播商品1','product_details.html?lid=2'),
(NULL,'img/index/index/carousel/banner4.jpg','轮播商品1','product_details.html?lid=2');

/**********首页底部连接*****************/
CREATE TABLE ayl_index_foot_nav(
	nid INT PRIMARY KEY AUTO_INCREMENT,
	c_title VARCHAR(24),
	e_title VARCHAR(24),
	href VARCHAR(124)
);
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Current","品牌关注","current.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"About a.Yilian","品牌关注","index.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Campaigns","形象大片","current.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Fashion Trends","潮流汇报","fashion_news.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Promotion","品牌活动","fashion_news.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Video","宣传视频","video.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Fashion News","时尚新闻","fashion_news.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Update News ","最新消息","index.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Lookbook","时尚搭配","lookbook.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Winter Collection","冬季系列","index.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Stores","店铺信息","index.html");
INSERT INTO ayl_index_foot_nav VALUES(NULL,"Contact Us","联系我们","contact.html");


/**************导航栏****************/
/*
CREATE TABLE ayl_index_nav(
	name VARCHAR(16),
	url VARCHAR(64),
	title	VARCHAR(32)
);
INSERT INTO ayl_index_nav VALUES('商品首页','/index.html','商品首页'),
	('T恤',"/index.html",'多种多样的T恤'),
	('衬衫',"/index.html",'多种多样的衬衫'),
	('C9',"/index.html","多种多样的C9"),
	('麻',"/index.html","多种多样的麻"),
	('鞋',"/index.html","多种多样的鞋"),
	('水柔棉',"/index.html","多种多样的水柔棉"),
	('裤装',"/index.html","多种多样的裤子"),
	('外套',"/index.html","多种多样的外套"),
	('私人订制',"/index.html","私人订制");*/
/*************首页商品列表******************/
CREATE TABLE ayl_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    pic VARCHAR(128),
    href VARCHAR(128)
);
INSERT INTO ayl_index_product VALUES(NULL,"关于我们","img/index/index/product/pic_img_1.jpg","current.html"),
                                    (NULL,"时尚新闻","img/index/index/product/pic_img_2.jpg","fashion_news.html"),
                                    (NULL,"时尚搭配","img/index/index/product/pic_img_3.jpg","lookbook-sweet.html?fid=2");

/***************时尚搭配lookbook****************/ 

/*************商品列表-图片-***************/
CREATE TABLE ayl_product_pic(
	pic_id INT PRIMARY KEY AUTO_INCREMENT,
	lid INT,
	sm VARCHAR(128),
	md VARCHAR(128),
	lg VARCHAR(128)
);  
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_1.jpg","img/product_details/md/01/20181130_lid1_1.jpg","img/product_details/lg/01/20181130_lid1_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_2.jpg","img/product_details/md/01/20181130_lid1_2.jpg","img/product_details/lg/01/20181130_lid1_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_3.jpg","img/product_details/md/01/20181130_lid1_3.jpg","img/product_details/lg/01/20181130_lid1_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_4.jpg","img/product_details/md/01/20181130_lid1_4.jpg","img/product_details/lg/01/20181130_lid1_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_5.jpg","img/product_details/md/01/20181130_lid1_5.jpg","img/product_details/lg/01/20181130_lid1_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_2.jpg","img/product_details/md/01/20181130_lid1_2.jpg","img/product_details/lg/01/20181130_lid1_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,1,"img/product_details/sm/01/20181130_lid1_1.jpg","img/product_details/md/01/20181130_lid1_1.jpg","img/product_details/lg/01/20181130_lid1_1.jpg");

INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_1.jpg","img/product_details/md/02/20181130_lid2_1.jpg","img/product_details/lg/02/20181130_lid2_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_2.jpg","img/product_details/md/02/20181130_lid2_2.jpg","img/product_details/lg/02/20181130_lid2_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_3.jpg","img/product_details/md/02/20181130_lid2_3.jpg","img/product_details/lg/02/20181130_lid2_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_4.jpg","img/product_details/md/02/20181130_lid2_4.jpg","img/product_details/lg/02/20181130_lid2_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_5.jpg","img/product_details/md/02/20181130_lid2_5.jpg","img/product_details/lg/02/20181130_lid2_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,2,"img/product_details/sm/02/20181130_lid2_2.jpg","img/product_details/md/02/20181130_lid2_2.jpg","img/product_details/lg/02/20181130_lid2_2.jpg");


INSERT INTO ayl_product_pic VALUES(NULL,3,"img/product_details/sm/03/20181130_lid3_1.jpg","img/product_details/md/03/20181130_lid3_1.jpg","img/product_details/lg/03/20181130_lid3_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,3,"img/product_details/sm/03/20181130_lid3_2.jpg","img/product_details/md/03/20181130_lid3_2.jpg","img/product_details/lg/03/20181130_lid3_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,3,"img/product_details/sm/03/20181130_lid3_3.jpg","img/product_details/md/03/20181130_lid3_3.jpg","img/product_details/lg/03/20181130_lid3_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,3,"img/product_details/sm/03/20181130_lid3_4.jpg","img/product_details/md/03/20181130_lid3_4.jpg","img/product_details/lg/03/20181130_lid3_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,3,"img/product_details/sm/03/20181130_lid3_5.jpg","img/product_details/md/03/20181130_lid3_5.jpg","img/product_details/lg/03/20181130_lid3_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,4,"img/product_details/sm/04/20181130_lid4_1.jpg","img/product_details/md/04/20181130_lid4_1.jpg","img/product_details/lg/04/20181130_lid4_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,4,"img/product_details/sm/04/20181130_lid4_2.jpg","img/product_details/md/04/20181130_lid4_2.jpg","img/product_details/lg/04/20181130_lid4_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,4,"img/product_details/sm/04/20181130_lid4_3.jpg","img/product_details/md/04/20181130_lid4_3.jpg","img/product_details/lg/04/20181130_lid4_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,4,"img/product_details/sm/04/20181130_lid4_4.jpg","img/product_details/md/04/20181130_lid4_4.jpg","img/product_details/lg/04/20181130_lid4_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,4,"img/product_details/sm/04/20181130_lid4_5.jpg","img/product_details/md/04/20181130_lid4_5.jpg","img/product_details/lg/04/20181130_lid4_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,5,"img/product_details/sm/05/20181130_lid5_1.jpg","img/product_details/md/05/20181130_lid5_1.jpg","img/product_details/lg/05/20181130_lid5_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,5,"img/product_details/sm/05/20181130_lid5_2.jpg","img/product_details/md/05/20181130_lid5_2.jpg","img/product_details/lg/05/20181130_lid5_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,5,"img/product_details/sm/05/20181130_lid5_3.jpg","img/product_details/md/05/20181130_lid5_3.jpg","img/product_details/lg/05/20181130_lid5_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,5,"img/product_details/sm/05/20181130_lid5_4.jpg","img/product_details/md/05/20181130_lid5_4.jpg","img/product_details/lg/05/20181130_lid5_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,5,"img/product_details/sm/05/20181130_lid5_5.jpg","img/product_details/md/05/20181130_lid5_5.jpg","img/product_details/lg/05/20181130_lid5_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,6,"img/product_details/sm/06/20181130_lid6_1.jpg","img/product_details/md/06/20181130_lid6_1.jpg","img/product_details/lg/06/20181130_lid6_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,6,"img/product_details/sm/06/20181130_lid6_2.jpg","img/product_details/md/06/20181130_lid6_2.jpg","img/product_details/lg/06/20181130_lid6_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,6,"img/product_details/sm/06/20181130_lid6_3.jpg","img/product_details/md/06/20181130_lid6_3.jpg","img/product_details/lg/06/20181130_lid6_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,6,"img/product_details/sm/06/20181130_lid6_4.jpg","img/product_details/md/06/20181130_lid6_4.jpg","img/product_details/lg/06/20181130_lid6_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,6,"img/product_details/sm/06/20181130_lid6_5.jpg","img/product_details/md/06/20181130_lid6_5.jpg","img/product_details/lg/06/20181130_lid6_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,7,"img/product_details/sm/07/20181130_lid7_1.jpg","img/product_details/md/07/20181130_lid7_1.jpg","img/product_details/lg/07/20181130_lid7_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,7,"img/product_details/sm/07/20181130_lid7_2.jpg","img/product_details/md/07/20181130_lid7_2.jpg","img/product_details/lg/07/20181130_lid7_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,7,"img/product_details/sm/07/20181130_lid7_3.jpg","img/product_details/md/07/20181130_lid7_3.jpg","img/product_details/lg/07/20181130_lid7_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,7,"img/product_details/sm/07/20181130_lid7_4.jpg","img/product_details/md/07/20181130_lid7_4.jpg","img/product_details/lg/07/20181130_lid7_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,7,"img/product_details/sm/07/20181130_lid7_5.jpg","img/product_details/md/07/20181130_lid7_5.jpg","img/product_details/lg/07/20181130_lid7_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,8,"img/product_details/sm/08/20181130_lid8_1.jpg","img/product_details/md/08/20181130_lid8_1.jpg","img/product_details/lg/08/20181130_lid8_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,8,"img/product_details/sm/08/20181130_lid8_2.jpg","img/product_details/md/08/20181130_lid8_2.jpg","img/product_details/lg/08/20181130_lid8_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,8,"img/product_details/sm/08/20181130_lid8_3.jpg","img/product_details/md/08/20181130_lid8_3.jpg","img/product_details/lg/08/20181130_lid8_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,8,"img/product_details/sm/08/20181130_lid8_4.jpg","img/product_details/md/08/20181130_lid8_4.jpg","img/product_details/lg/08/20181130_lid8_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,8,"img/product_details/sm/08/20181130_lid8_5.jpg","img/product_details/md/08/20181130_lid8_5.jpg","img/product_details/lg/08/20181130_lid8_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,9,"img/product_details/sm/09/20181130_lid9_1.jpg","img/product_details/md/09/20181130_lid9_1.jpg","img/product_details/lg/09/20181130_lid9_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,9,"img/product_details/sm/09/20181130_lid9_2.jpg","img/product_details/md/09/20181130_lid9_2.jpg","img/product_details/lg/09/20181130_lid9_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,9,"img/product_details/sm/09/20181130_lid9_3.jpg","img/product_details/md/09/20181130_lid9_3.jpg","img/product_details/lg/09/20181130_lid9_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,9,"img/product_details/sm/09/20181130_lid9_4.jpg","img/product_details/md/09/20181130_lid9_4.jpg","img/product_details/lg/09/20181130_lid9_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,9,"img/product_details/sm/09/20181130_lid9_5.jpg","img/product_details/md/09/20181130_lid9_5.jpg","img/product_details/lg/09/20181130_lid9_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,10,"img/product_details/sm/10/20181130_lid10_1.jpg","img/product_details/md/10/20181130_lid10_1.jpg","img/product_details/lg/10/20181130_lid10_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,10,"img/product_details/sm/10/20181130_lid10_2.jpg","img/product_details/md/10/20181130_lid10_2.jpg","img/product_details/lg/10/20181130_lid10_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,10,"img/product_details/sm/10/20181130_lid10_3.jpg","img/product_details/md/10/20181130_lid10_3.jpg","img/product_details/lg/10/20181130_lid10_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,10,"img/product_details/sm/10/20181130_lid10_4.jpg","img/product_details/md/10/20181130_lid10_4.jpg","img/product_details/lg/10/20181130_lid10_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,10,"img/product_details/sm/10/20181130_lid10_5.jpg","img/product_details/md/10/20181130_lid10_5.jpg","img/product_details/lg/10/20181130_lid10_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,11,"img/product_details/sm/11/20181130_lid11_1.jpg","img/product_details/md/11/20181130_lid11_1.jpg","img/product_details/lg/11/20181130_lid11_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,11,"img/product_details/sm/11/20181130_lid11_2.jpg","img/product_details/md/11/20181130_lid11_2.jpg","img/product_details/lg/11/20181130_lid11_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,11,"img/product_details/sm/11/20181130_lid11_3.jpg","img/product_details/md/11/20181130_lid11_3.jpg","img/product_details/lg/11/20181130_lid11_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,11,"img/product_details/sm/11/20181130_lid11_4.jpg","img/product_details/md/11/20181130_lid11_4.jpg","img/product_details/lg/11/20181130_lid11_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,11,"img/product_details/sm/11/20181130_lid11_5.jpg","img/product_details/md/11/20181130_lid11_5.jpg","img/product_details/lg/11/20181130_lid11_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,12,"img/product_details/sm/12/20181130_lid12_1.jpg","img/product_details/md/12/20181130_lid12_1.jpg","img/product_details/lg/12/20181130_lid12_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,12,"img/product_details/sm/12/20181130_lid12_2.jpg","img/product_details/md/12/20181130_lid12_2.jpg","img/product_details/lg/12/20181130_lid12_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,12,"img/product_details/sm/12/20181130_lid12_3.jpg","img/product_details/md/12/20181130_lid12_3.jpg","img/product_details/lg/12/20181130_lid12_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,12,"img/product_details/sm/12/20181130_lid12_4.jpg","img/product_details/md/12/20181130_lid12_4.jpg","img/product_details/lg/12/20181130_lid12_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,12,"img/product_details/sm/12/20181130_lid12_5.jpg","img/product_details/md/12/20181130_lid12_5.jpg","img/product_details/lg/12/20181130_lid12_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,13,"img/product_details/sm/13/20181130_lid13_1.jpg","img/product_details/md/13/20181130_lid13_1.jpg","img/product_details/lg/13/20181130_lid13_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,13,"img/product_details/sm/13/20181130_lid13_2.jpg","img/product_details/md/13/20181130_lid13_2.jpg","img/product_details/lg/13/20181130_lid13_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,13,"img/product_details/sm/13/20181130_lid13_3.jpg","img/product_details/md/13/20181130_lid13_3.jpg","img/product_details/lg/13/20181130_lid13_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,13,"img/product_details/sm/13/20181130_lid13_4.jpg","img/product_details/md/13/20181130_lid13_4.jpg","img/product_details/lg/13/20181130_lid13_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,13,"img/product_details/sm/13/20181130_lid13_5.jpg","img/product_details/md/13/20181130_lid13_5.jpg","img/product_details/lg/13/20181130_lid13_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,14,"img/product_details/sm/14/20181130_lid14_1.jpg","img/product_details/md/14/20181130_lid14_1.jpg","img/product_details/lg/14/20181130_lid14_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,14,"img/product_details/sm/14/20181130_lid14_2.jpg","img/product_details/md/14/20181130_lid14_2.jpg","img/product_details/lg/14/20181130_lid14_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,14,"img/product_details/sm/14/20181130_lid14_3.jpg","img/product_details/md/14/20181130_lid14_3.jpg","img/product_details/lg/14/20181130_lid14_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,14,"img/product_details/sm/14/20181130_lid14_4.jpg","img/product_details/md/14/20181130_lid14_4.jpg","img/product_details/lg/14/20181130_lid14_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,14,"img/product_details/sm/14/20181130_lid14_5.jpg","img/product_details/md/14/20181130_lid14_5.jpg","img/product_details/lg/14/20181130_lid14_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,15,"img/product_details/sm/15/20181130_lid15_1.jpg","img/product_details/md/15/20181130_lid15_1.jpg","img/product_details/lg/15/20181130_lid15_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,15,"img/product_details/sm/15/20181130_lid15_2.jpg","img/product_details/md/15/20181130_lid15_2.jpg","img/product_details/lg/15/20181130_lid15_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,15,"img/product_details/sm/15/20181130_lid15_3.jpg","img/product_details/md/15/20181130_lid15_3.jpg","img/product_details/lg/15/20181130_lid15_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,15,"img/product_details/sm/15/20181130_lid15_4.jpg","img/product_details/md/15/20181130_lid15_4.jpg","img/product_details/lg/15/20181130_lid15_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,15,"img/product_details/sm/15/20181130_lid15_5.jpg","img/product_details/md/15/20181130_lid15_5.jpg","img/product_details/lg/15/20181130_lid15_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,16,"img/product_details/sm/16/20181130_lid16_1.jpg","img/product_details/md/16/20181130_lid16_1.jpg","img/product_details/lg/16/20181130_lid16_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,16,"img/product_details/sm/16/20181130_lid16_2.jpg","img/product_details/md/16/20181130_lid16_2.jpg","img/product_details/lg/16/20181130_lid16_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,16,"img/product_details/sm/16/20181130_lid16_3.jpg","img/product_details/md/16/20181130_lid16_3.jpg","img/product_details/lg/16/20181130_lid16_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,16,"img/product_details/sm/16/20181130_lid16_4.jpg","img/product_details/md/16/20181130_lid16_4.jpg","img/product_details/lg/16/20181130_lid16_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,16,"img/product_details/sm/16/20181130_lid16_5.jpg","img/product_details/md/16/20181130_lid16_5.jpg","img/product_details/lg/16/20181130_lid16_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,17,"img/product_details/sm/17/20181130_lid17_1.jpg","img/product_details/md/17/20181130_lid17_1.jpg","img/product_details/lg/17/20181130_lid17_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,17,"img/product_details/sm/17/20181130_lid17_2.jpg","img/product_details/md/17/20181130_lid17_2.jpg","img/product_details/lg/17/20181130_lid17_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,17,"img/product_details/sm/17/20181130_lid17_3.jpg","img/product_details/md/17/20181130_lid17_3.jpg","img/product_details/lg/17/20181130_lid17_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,17,"img/product_details/sm/17/20181130_lid17_4.jpg","img/product_details/md/17/20181130_lid17_4.jpg","img/product_details/lg/17/20181130_lid17_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,17,"img/product_details/sm/17/20181130_lid17_5.jpg","img/product_details/md/17/20181130_lid17_5.jpg","img/product_details/lg/17/20181130_lid17_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,18,"img/product_details/sm/18/20181130_lid18_1.jpg","img/product_details/md/18/20181130_lid18_1.jpg","img/product_details/lg/18/20181130_lid18_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,18,"img/product_details/sm/18/20181130_lid18_2.jpg","img/product_details/md/18/20181130_lid18_2.jpg","img/product_details/lg/18/20181130_lid18_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,18,"img/product_details/sm/18/20181130_lid18_3.jpg","img/product_details/md/18/20181130_lid18_3.jpg","img/product_details/lg/18/20181130_lid18_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,18,"img/product_details/sm/18/20181130_lid18_4.jpg","img/product_details/md/18/20181130_lid18_4.jpg","img/product_details/lg/18/20181130_lid18_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,18,"img/product_details/sm/18/20181130_lid18_5.jpg","img/product_details/md/18/20181130_lid18_5.jpg","img/product_details/lg/18/20181130_lid18_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,19,"img/product_details/sm/19/20181130_lid19_1.jpg","img/product_details/md/19/20181130_lid19_1.jpg","img/product_details/lg/19/20181130_lid19_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,19,"img/product_details/sm/19/20181130_lid19_2.jpg","img/product_details/md/19/20181130_lid19_2.jpg","img/product_details/lg/19/20181130_lid19_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,19,"img/product_details/sm/19/20181130_lid19_3.jpg","img/product_details/md/19/20181130_lid19_3.jpg","img/product_details/lg/19/20181130_lid19_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,19,"img/product_details/sm/19/20181130_lid19_4.jpg","img/product_details/md/19/20181130_lid19_4.jpg","img/product_details/lg/19/20181130_lid19_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,19,"img/product_details/sm/19/20181130_lid19_5.jpg","img/product_details/md/19/20181130_lid19_5.jpg","img/product_details/lg/19/20181130_lid19_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,20,"img/product_details/sm/20/20181130_lid20_1.jpg","img/product_details/md/20/20181130_lid20_1.jpg","img/product_details/lg/20/20181130_lid20_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,20,"img/product_details/sm/20/20181130_lid20_2.jpg","img/product_details/md/20/20181130_lid20_2.jpg","img/product_details/lg/20/20181130_lid20_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,20,"img/product_details/sm/20/20181130_lid20_3.jpg","img/product_details/md/20/20181130_lid20_3.jpg","img/product_details/lg/20/20181130_lid20_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,20,"img/product_details/sm/20/20181130_lid20_4.jpg","img/product_details/md/20/20181130_lid20_4.jpg","img/product_details/lg/20/20181130_lid20_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,20,"img/product_details/sm/20/20181130_lid20_5.jpg","img/product_details/md/20/20181130_lid20_5.jpg","img/product_details/lg/20/20181130_lid20_5.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,21,"img/product_details/sm/21/20181130_lid21_1.jpg","img/product_details/md/21/20181130_lid21_1.jpg","img/product_details/lg/21/20181130_lid21_1.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,21,"img/product_details/sm/21/20181130_lid21_2.jpg","img/product_details/md/21/20181130_lid21_2.jpg","img/product_details/lg/21/20181130_lid21_2.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,21,"img/product_details/sm/21/20181130_lid21_3.jpg","img/product_details/md/21/20181130_lid21_3.jpg","img/product_details/lg/21/20181130_lid21_3.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,21,"img/product_details/sm/21/20181130_lid21_4.jpg","img/product_details/md/21/20181130_lid21_4.jpg","img/product_details/lg/21/20181130_lid21_4.jpg");
INSERT INTO ayl_product_pic VALUES(NULL,21,"img/product_details/sm/21/20181130_lid21_5.jpg","img/product_details/md/21/20181130_lid21_5.jpg","img/product_details/lg/21/20181130_lid21_5.jpg");







/****************商品库存表*********************/
CREATE TABLE ayl_product_details(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	fid INT ,
	family_id INT,#归属商品
	title VARCHAR(128),
	img VARCHAR(128),
	price DECIMAL(10,2),
	promise VARCHAR(64),
	color VARCHAR(128),
	size VARCHAR(128),
	shelf_time BIGINT(20),
	sold_count INT,
	stock INT,
	is_onsale TINYINT(1)
);
INSERT INTO ayl_product_details VALUES(NULL,1,1,"阿依莲2018冬季新款时气质羽绒服","img/product_details/md/01/20181130_lid1_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","粉红色","S|M|L","2018-11-16",1000,567,1),
(NULL,2,2,"阿依莲2018冬季新款时尚女气质中长款大衣","img/product_details/md/02/20181130_lid2_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","酒红色","S|M|L","2018-11-16",1000,5345,1),
(NULL,3,3,"阿依莲2018冬季新款时尚女气质中长款大衣","img/product_details/md/03/20181130_lid3_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","灰色","S|M|L","2018-11-16",1000,34,1);

INSERT INTO ayl_product_details VALUES(NULL,4,4,"阿依莲2018冬季新款时尚甜美毛织连衣裙女气质百搭长裙","img/product_details/md/04/20181130_lid4_1.jpg",999.00,"*退货补运费 *30天无忧退货 *48小时快速退款","本白","S|M|L","2018-11-16",1000,567,1);
INSERT INTO ayl_product_details VALUES(NULL,5,5,"阿依莲2018冬季新款时尚优雅宽松中长款毛织连衣裙女长款套头毛衣","img/product_details/md/05/20181130_lid5_1.jpg",1499.00,"*退货补运费 *30天无忧退货 *48小时快速退款","本白","S|M","2018-11-16",1800,57,1);
INSERT INTO ayl_product_details VALUES(NULL,6,1,"阿依莲2018冬季新款韩版时尚中长款裙气质修身黑色淑女连衣裙","img/product_details/md/06/20181130_lid6_1.jpg",699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M","2018-11-16",1800,57,1);
INSERT INTO ayl_product_details VALUES(NULL,6,2,"阿依莲2018冬季新款韩版时尚中长款裙气质修身黑色淑女连衣裙","img/product_details/md/06/20181130_lid6_2.jpg",699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","红色","S|M","2018-11-16",60,80,1);
INSERT INTO ayl_product_details VALUES(NULL,7,7,"阿依莲2018冬季新款时尚中长款流苏边毛衣连衣裙圆领套头宽松裙子","img/product_details/md/07/20181130_lid7_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","焦糖色","S|M|L","2018-11-16",7689,2453,1);
INSERT INTO ayl_product_details VALUES(NULL,7,1,"阿依莲2018冬季新款时尚中长款流苏边毛衣连衣裙圆领套头宽松裙子","img/product_details/md/07/20181130_lid7_2.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝","S|M|L","2018-11-16",985,25,1);
INSERT INTO ayl_product_details VALUES(NULL,8,1,"阿依莲2018冬季新款时尚气质黑色套头两件式毛织连衣裙","img/product_details/md/08/20181130_lid8_1.jpg",789.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",678,2453,1);
INSERT INTO ayl_product_details VALUES(NULL,9,1,"阿依莲2018秋季新款简约圆领毛织拼接连衣裙女圆领气质长袖短裙","img/product_details/md/09/20181130_lid9_1.jpg",789.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",9768,8763,1);
INSERT INTO ayl_product_details VALUES(NULL,10,1,"阿依莲2018冬季新款时尚气质蕾丝连衣裙","img/product_details/md/10/20181130_lid10_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","白色","S|M|L","2018-11-16",1000,567,1);
INSERT INTO ayl_product_details VALUES(NULL,10,1,"阿依莲2018冬季新款时尚气质蕾丝连衣裙","img/product_details/md/10/20181130_lid10_2.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",1000,567,1);
INSERT INTO ayl_product_details VALUES(NULL,11,1,"阿依莲2018冬季新款时尚气质蕾丝连衣裙","img/product_details/md/11/20181130_lid11_1.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","红色","S|M|L","2018-11-16",1000,567,1);
INSERT INTO ayl_product_details VALUES(NULL,11,1,"阿依莲2018冬季新款时尚气质蕾丝连衣裙","img/product_details/md/11/20181130_lid11_2.jpg",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",1000,567,1);

INSERT INTO ayl_product_details VALUES(NULL,12,1,"中长款羽绒服女2018冬款阿依莲旗舰店官网正品过膝修身加厚韩版潮","img/product_details/md/12/20181130_lid12_1.jpg",1399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","墨绿色","S|M|L","2018-11-16",9768,8763,1);
INSERT INTO ayl_product_details VALUES(NULL,12,1,"中长款羽绒服女2018冬款阿依莲旗舰店官网正品过膝修身加厚韩版潮","img/product_details/md/12/20181130_lid12_4.jpg",1399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",456,85,1);
INSERT INTO ayl_product_details VALUES(NULL,12,1,"中长款羽绒服女2018冬款阿依莲旗舰店官网正品过膝修身加厚韩版潮","img/product_details/md/12/20181130_lid12_3.jpg",1399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","浅绿色","S|M|L","2018-11-16",987,2345,1);
INSERT INTO ayl_product_details VALUES(NULL,12,1,"中长款羽绒服女2018冬款阿依莲旗舰店官网正品过膝修身加厚韩版潮","img/product_details/md/12/20181130_lid12_2.jpg",1399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","暖棕","S|M|L","2018-11-16",9543,8883,1);
INSERT INTO ayl_product_details VALUES(NULL,13,1,"阿依莲2018冬季新款时尚韩版羽绒服中长款加厚大毛领连帽百搭","img/product_details/md/13/20181130_lid13_1.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","浅灰色","S|M","2018-11-16",7674,785,1);
INSERT INTO ayl_product_details VALUES(NULL,14,1,"阿依莲2018冬季新款时尚韩版羽绒服中长款加厚大毛领连帽百搭","img/product_details/md/14/20181130_lid14_1.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","裸橙色","S|M","2018-11-16",7674,785,1);
INSERT INTO ayl_product_details VALUES(NULL,14,1,"阿依莲2018冬季新款时尚韩版羽绒服中长款加厚大毛领连帽百搭","img/product_details/md/14/20181130_lid14_3.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","本色","S|M","2018-11-16",6894,5748,1);
INSERT INTO ayl_product_details VALUES(NULL,15,1,"阿依莲2018冬季新款官方正品时尚中长款加厚保暖大毛领羽绒服","img/product_details/md/15/20181130_lid15_1.jpg",3356.00,"*退货补运费 *30天无忧退货 *48小时快速退款","云灰色","S|M|L|XL","2018-11-16",654,2324,1);
INSERT INTO ayl_product_details VALUES(NULL,15,1,"阿依莲2018冬季新款官方正品时尚中长款加厚保暖大毛领羽绒服","img/product_details/md/15/20181130_lid15_2.jpg",3356.00,"*退货补运费 *30天无忧退货 *48小时快速退款","大红","S|M|L|XL","2018-11-16",35,487,1);
INSERT INTO ayl_product_details VALUES(NULL,16,1,"羽绒服女中长款2018新款韩版潮阿依莲正品加厚过膝大毛领外套","img/product_details/md/16/20181130_lid16_1.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","灰蓝","S|M|L|XL","2018-11-16",56,574,1);
INSERT INTO ayl_product_details VALUES(NULL,16,1,"羽绒服女中长款2018新款韩版潮阿依莲正品加厚过膝大毛领外套","img/product_details/md/16/20181130_lid16_2.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L|XL","2018-11-16",456,5474,1);
INSERT INTO ayl_product_details VALUES(NULL,17,1,"阿依莲2018冬季新款百搭打底毛衣时尚韩版修身气质套头内搭上衣","img/product_details/md/17/20181130_lid17_4.jpg",899.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",744,7845,1);
INSERT INTO ayl_product_details VALUES(NULL,17,1,"阿依莲2018冬季新款百搭打底毛衣时尚韩版修身气质套头内搭上衣","img/product_details/md/17/20181130_lid17_2.jpg",899.00,"*退货补运费 *30天无忧退货 *48小时快速退款","木丁红","S|M|L","2018-11-16",74,8435,1);
INSERT INTO ayl_product_details VALUES(NULL,17,1,"阿依莲2018冬季新款百搭打底毛衣时尚韩版修身气质套头内搭上衣","img/product_details/md/17/20181130_lid17_1.jpg",899.00,"*退货补运费 *30天无忧退货 *48小时快速退款","本白","S|M|L","2018-11-16",444,985,1);
INSERT INTO ayl_product_details VALUES(NULL,18,1,"阿依莲2018冬季新款时尚修身显瘦打底衫立领百搭毛衣针织衫女潮","img/product_details/md/18/20181130_lid18_1.jpg",5619.00,"*退货补运费 *30天无忧退货 *48小时快速退款","军绿色","S|M|L","2018-11-16",774,789,1);

INSERT INTO ayl_product_details VALUES(NULL,19,1,"阿依莲2018冬季新款时尚修身显瘦套头条纹毛衣针织衫打底衫","img/product_details/md/19/20181130_lid19_1.jpg",2199.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M","2018-11-16",7674,785,1);
INSERT INTO ayl_product_details VALUES(NULL,20,1,"阿依莲正品2018冬季新款连帽套头毛衣女慵懒风宽松外穿","img/product_details/md/20/20181130_lid20_1.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","卡其色","S|M|L","2018-11-16",674,298,1);
INSERT INTO ayl_product_details VALUES(NULL,20,1,"阿依莲正品2018冬季新款连帽套头毛衣女慵懒风宽松外穿","img/product_details/md/20/20181130_lid20_2.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","花瓣紫","S|M|L","2018-11-16",869,898,1);
INSERT INTO ayl_product_details VALUES(NULL,21,1,"阿依莲正品2018冬季新款连帽套头毛衣女慵懒风宽松外穿","img/product_details/md/21/20181130_lid21_1.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黄色","S|M|L","2018-11-16",869,898,1);
INSERT INTO ayl_product_details VALUES(NULL,21,1,"阿依莲正品2018冬季新款羽绒服","img/product_details/md/21/20181130_lid21_3.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","白色","S|M","2018-11-16",869,898,1);
INSERT INTO ayl_product_details VALUES(NULL,21,1,"阿依莲正品2018冬季新款羽绒服","img/product_details/md/21/20181130_lid21_4.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","粉色","S|L","2018-11-16",869,898,1);
INSERT INTO ayl_product_details VALUES(NULL,21,1,"阿依莲正品2018冬季新款羽绒服","img/product_details/md/21/20181130_lid21_5.jpg",399.00,"*退货补运费 *30天无忧退货 *48小时快速退款","红色","S|M|L","2018-11-16",869,898,1);



CREATE TABLE ayl_lookbook_details(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	pid INT ,
	family_id INT,
	img_url VARCHAR(128),
	href VARCHAR(64),
	price DECIMAL(10,2),
	sold_count INT

);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacdcd16617.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacde05364f.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacdec798c9.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacdfef017d.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbace0dc759f.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf45388c2.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbace1db6313.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbace76b7dcb.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbace675c56b.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbace2930c88.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacea78c1d1.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacecb65fb7.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacee0c585d.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacef8e0611.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf0d1d69e.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf2fb2c66.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf83a393f.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf6928dff.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf45388c2.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,1,"img/lookbook/cool/5bbacf5979290.jpg","product_details.html?lid=2",12566,1256456);



INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978147.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978172.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978182.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978196.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978231.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978241.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978250.jpg","product_details.html?lid=2",12566,1256456);


INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978620.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978259.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978269.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978286.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978311.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978412.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978426.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978494.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978523.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978537.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978549.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978562.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978576.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978591.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978607.jpg","product_details.html?lid=2",12566,1256456);
INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978620.jpg","product_details.html?lid=2",12566,1256456);

INSERT INTO  ayl_lookbook_details VALUES(NULL,1,2,"img/lookbook/sweet/1538978537.jpg","product_details.html?lid=2",12566,1256456);




CREATE TABLE ayl_detail_model(
	did INT PRIMARY KEY AUTO_INCREMENT,
	pid INT ,
	img_url VARCHAR(128),
	id VARCHAR(64)
);
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/03.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/04.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,1,"img/product_details/model/01/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/03.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/04.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/11.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/12.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/13.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/16.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,2,"img/product_details/model/02/17.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/02.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/04.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/08.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/10.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/11.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/12.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,3,"img/product_details/model/03/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,4,"img/product_details/model/04/14.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,5,"img/product_details/model/05/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,6,"img/product_details/model/06/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,7,"img/product_details/model/07/16.jpg","");


INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,8,"img/product_details/model/08/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,9,"img/product_details/model/09/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,10,"img/product_details/model/10/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,11,"img/product_details/model/11/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/03.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/08.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/12.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/15.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/16.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/17.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/18.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,12,"img/product_details/model/12/19.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/03.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/04.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/10.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/11.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/12.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/16.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,13,"img/product_details/model/13/17.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/03.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/04.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/10.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/11.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/12.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/13.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/16.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,14,"img/product_details/model/14/17.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,15,"img/product_details/model/15/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,16,"img/product_details/model/16/16.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/01.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/14.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/15.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/16.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/17.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/18.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,17,"img/product_details/model/17/19.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,18,"img/product_details/model/18/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/09.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/10.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/11.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,19,"img/product_details/model/19/13.jpg","");

INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/03.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/04.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/05.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/12.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/13.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/14.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/15.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,20,"img/product_details/model/20/16.jpg","");


INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/01.jpg","goumai");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/02.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/03.jpg","modelshows");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/04.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/05.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/06.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/07.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/08.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/09.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/10.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/11.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/12.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/13.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/14.jpg","information");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/15.jpg","color");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/16.jpg","fabric");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/17.jpg","details");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/18.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/19.jpg","");
INSERT INTO ayl_detail_model VALUES(NULL,21,"img/product_details/model/21/20.jpg","");


