CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

/* CREATE SUPPLIER TABLE */
CREATE TABLE IF NOT EXISTS supplier(
	supp_id INT PRIMARY KEY,
    supp_name VARCHAR(50) NOT NULL,
    supp_city VARCHAR(50) NOT NULL,
    supp_phone VARCHAR(50) NOT NULL
);

/* CREATE CUSTOMER TABLE */
CREATE TABLE IF NOT EXISTS customer(
	cus_id INT PRIMARY KEY,
    cus_name VARCHAR(20) NOT NULL,
    cus_phone VARCHAR(10) NOT NULL,
    cus_city VARCHAR(30) NOT NULL,
    cus_gender CHAR
);

/* CREATE CATEGORY TABLE */
CREATE TABLE IF NOT EXISTS category(
	cat_id INT PRIMARY KEY,
	cat_name VARCHAR(20) NOT NULL
);

/* CREATE PRODUCT TABLE */
CREATE TABLE IF NOT EXISTS product(
	pro_id INT PRIMARY KEY,
	pro_name VARCHAR(20) NOT NULL DEFAULT 'Dummy',
	pro_desc VARCHAR(60),
	cat_id INT,
    FOREIGN KEY (cat_id) REFERENCES category(cat_id)
);

/* CREATE SUPPLIER PRICING TABLE */
CREATE TABLE IF NOT EXISTS supplier_pricing(
	pricing_id INT PRIMARY KEY,
	pro_id INT,
	supp_id INT,
	supp_price INT DEFAULT 0,
	FOREIGN KEY (pro_id) REFERENCES category(cat_id),
    FOREIGN KEY (supp_id) REFERENCES supplier(supp_id)
);

/* CREATE ORDER TABLE */
CREATE TABLE IF NOT EXISTS `order`(
	ord_id INT PRIMARY KEY,
	ord_amount INT NOT NULL,
	ord_date DATE NOT NULL,
	cus_id INT,
	pricing_id INT,
	FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (pricing_id) REFERENCES supplier_pricing(pricing_id)
);

/* CREATE RATING TABLE */
CREATE TABLE IF NOT EXISTS rating(
	rat_id INT PRIMARY KEY,
	ord_id INT,
	rat_ratstars INT NOT NULL,
	FOREIGN KEY (ord_id) REFERENCES `order`(ord_id)
);


# SUPPLIER 
INSERT INTO supplier VALUES
	(1, 'Rajesh Retails', 'Delhi', 1234567890),
    (2, 'Appario Ltd.', 'Mumbai', 2589631470),
    (3, 'Knome products', 'Bangalore', 9785462315),
    (4, 'Bansal Retails', 'Kochi', 8975463285),
    (5, 'Mittal Ltd.', 'Lucknow', 7898456532);
    
# customer
INSERT INTO customer VALUES
	(1, 'AAKASH', 9999999999, 'DELHI', 'M'),
    (2, 'AMAN', 9785463215, 'NOIDA', 'M'),
	(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
	(4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
	(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

# category
INSERT INTO category(cat_id, cat_name)
VALUES
	(1, 'BOOKS'),
	(2, 'GAMES'),
    (3, 'GROCERIES'),
    (4, 'ELECTRONICS'),
    (5, 'CLOTHES');

# PRODUCT 
INSERT INTO product(pro_id, pro_name, pro_desc, cat_id)
VALUES
	(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
	(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
	(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
	(6, 'MILK', '1L Toned MIlk', 3),
    (7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
    (9, 'Project IGI', 'compatible with windows 7 and above', 2),
	(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);

# Supplier pricing  
# requires value for pricing id 6 - 14 
SET FOREIGN_KEY_CHECKS = 0; 
SET FOREIGN_KEY_CHECKS = 1; 
INSERT INTO
	supplier_pricing(pricing_id, pro_id, supp_id, supp_price)
VALUES
	(1, 1, 2, 1500),
    (2, 3, 5, 30000),
	(3, 5, 1, 3000),
	(4, 2, 3, 2500),
	(5, 4, 1, 1000);

#orders 
INSERT INTO `order` VALUES 	(101, 1500, '2021-10-06', 2, 1);
 INSERT INTO `order` VALUES     (102, 1000, '2021-10-12', 3, 5);
INSERT INTO `order` VALUES    (103, 30000, '2021-09-16', 5, 2);
INSERT INTO `order` VALUES    (104, 1500, '2021-10-05', 1, 1);
INSERT INTO `order` VALUES    (105, 3000, '2021-08-16', 4, 3);
INSERT INTO `order` VALUES    (107, 789, '2021-09-01', 3, 7);
INSERT INTO `order` VALUES    (108, 780, '2021-09-07', 5, 6);
INSERT INTO `order` VALUES    (109, 3000, '2021-00-10', 5, 3);
INSERT INTO `order` VALUES    (110, 2500, '2021-09-10', 2, 4);
INSERT INTO `order` VALUES    (111, 1000, '2021-09-15', 4, 5);
 INSERT INTO `order` VALUES   (112, 789, '2021-09-16', 4, 7);
INSERT INTO `order`  VALUES   (113, 31000, '2021-09-16', 1, 8);
INSERT INTO `order` VALUES    (114, 1000, '2021-09-16', 3, 5);
INSERT INTO `order` VALUES    (115, 3000, '2021-09-16', 5, 3);
 INSERT INTO `order`  values   (116, 99, '2021-09-17', 2, 14);

  
 

# rating
INSERT INTO rating(rat_id, ord_id, rat_ratstars)
VALUES
	(1, 101, 4),
    (2, 102, 3),
	(3, 103, 1),
	(4, 104, 2),
	(5, 105, 4),
	(6, 106, 3),
	(7, 107, 4),
	(8, 108, 4),
	(9, 109, 3),
	(10, 110, 5),
	(11, 111, 3),
	(12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
	(16, 116, 0);


 
 select count( distinct customer.CUS_NAME)  as NoOfCustomer , customer.CUS_GENDER as Gender 
 from (customer inner join `order` on customer.cus_id = `order`.cus_id ) 
 where `order`.ORD_AMOUNT >= 3000 group by customer.CUS_GENDER;
   
 select order_details.* , product.pro_name from 
 (select orders.* ,price.pro_id as productID from  e_commerce.order as orders
 inner join e_commerce.supplier_pricing as price on orders.pricing_id = price.pricing_id
  where  orders.CUS_ID = 2) as order_details inner join product on product.pro_id = order_details.productID ; 

select  * from supplier where supp_id in 
(select supp_id from e_commerce.supplier_pricing group by supp_id having count(pro_id) > 1 );
 
 
 select  Category.cat_id as 'categoryId,', Category.cat_name as 'Name,',product.pro_name as 'product name', min(Supplier_pricing.SUPP_PRICE) as price 
 from product inner join Category on product.cat_id = Category.cat_id inner join Supplier_pricing on product.PRO_ID
  = Supplier_pricing.PRO_ID group by Category.cat_id ;
 
 select productcategory.* , min(Supplier_pricing.supp_price) from (select product.pro_name , product.pro_id, Category.cat_name, Category.cat_id
 from product inner join Category on product.cat_id = Category.cat_id ) as productcategory
  inner join Supplier_pricing on productcategory.PRO_ID = Supplier_pricing.PRO_ID group by productcategory.CAT_ID; 
  
  
     select ordersprice.pro_id , product.pro_name from 
     (select Supplier_pricing.* from `order`as orders inner join Supplier_pricing on Supplier_pricing.Pricing_ID = orders.Pricing_ID 
	where orders.ORD_DATE > "2021-10-05" ) as ordersprice inner join product where ordersprice.pro_id = product.pro_id;
  
  select cus_name, cus_gender from customer where cus_name like "%A" OR cus_name like "A%" ;
  
  
  
delimiter &&
create procedure e_commerce.procs()
Begin
select Supplier.supp_name ,  Supplier.supp_id , supplierid.Average ,
case
when supplierid.Average = 5 Then  "Excellent Service"
when supplierid.Average > 4 then "Good Service"
when supplierid.Average > 2 then "Average Service"
 else "poor Service"  End as Type_of_Service from 
 (select sum(orderRating.rating)/count(orderRating.rating) as Average , Supplier_pricing.SUPP_ID from  
(select Rating.RAT_RATSTARS as rating , orders.PRICING_ID , Rating.ORD_ID from `order` as orders 
inner join rating  on orders.ORD_ID = rating.ORD_ID) as orderRating
 inner join Supplier_pricing on Supplier_pricing.PRICING_ID = orderRating.PRICING_ID group by Supplier_pricing.SUPP_ID) as supplierid inner join Supplier on
 Supplier.supp_id = supplierid.supp_id;
 end &&
 DELIMITER ;
 
call procs();

