create database demos;
create table demo (id INT,name VARCHAR(50),gender VARCHAR(10),department VARCHAR(50));
INSERT INTO demo VALUES('1','Pranaya','Male','IT');
INSERT INTO demo VALUES('2','Priyanka','Female','IT');
INSERT INTO demo VALUES('3','Preety','Female','HR');
INSERT INTO demo VALUES('3','Preety','Female','HR');
 
select * from demo;

create table demo1(id INT,name VARCHAR(50),gender VARCHAR(10),department VARCHAR(50));
INSERT INTO demo1 VALUES('2','Priyanka','Female','IT');
INSERT INTO demo1 VALUES('3','Preety','Female','HR');
INSERT INTO demo1 VALUES('4','Anurag','Male','IT');
INSERT INTO demo1(id,name,department) VALUES('5','Anu','IT');
delete from demo1 where name='Anu';

select * from demo1;
/*UNION Operator:duplicates are removed from the result set*/ 
SELECT id, name, gender, department FROM demo UNION SELECT id, name, gender, department FROM demo1;

/*UNION ALL Operator:*/
SELECT id, name, gender, department FROM demo UNION ALL SELECT id, name, gender, department FROM demo1;

/*INTERSECT Operator:*/
SELECT id, name, gender, department FROM demo INTERSECT SELECT id, name, gender, department FROM demo1;

/*EXCEPT Operator:return unique rows from the left table that aren’t in the right table*/
SELECT id, name, gender, department FROM demo EXCEPT SELECT id, name, gender, department FROM demo1;

/* returns rows that are present in right but not in left table*/,
SELECT id, name, gender, department FROM demo EXCEPT SELECT id, name, gender, department FROM demo1;

CREATE TABLE SalesList(SalesMonth NVARCHAR(20), SalesQuartes  VARCHAR(5), SalesYear  SMALLINT, SalesTotal MONEY);
GO
INSERT INTO  SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2019,60);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2020,50);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'May','Q2',2019,30);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'July','Q3',2020,10);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2019,120);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'October','Q4',2019,150);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2019,180);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'November','Q4',2020,120);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'July','Q3',2019,160);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q1',2020,170);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q2',2032,140);
INSERT INTO SalesList(SalesMonth,SalesQuartes,SalesYear,SalesTotal) VALUES (N'March','Q2',2032,100);
delete from SalesList WHERE  SalesTotal= 100;
GO
SELECT  * FROM SalesList;
/*calculate Subtotals in SQL Queries*/
 /*ROLLUP*/
SELECT  SalesYear, SUM(SalesTotal) AS SalesTotal FROM SalesList GROUP BY ROLLUP(SalesYear);

SELECT  SalesYear,SalesQuartes, SUM(SalesTotal) AS SalesTotal FROM SalesList GROUP BY ROLLUP(SalesYear, SalesQuartes);

SELECT  SalesYear,SalesQuartes,SalesMonth ,SUM(SalesTotal) AS SalesTotal FROM SalesList GROUP BY ROLLUP(SalesYear, SalesQuartes, SalesMonth);

/*GROUPING function*/
SELECT SalesYear,SalesQuartes,SUM(SalesTotal) AS SalesTotal ,GROUPING(SalesQuartes) AS SalesQuarterGrp,GROUPING(SalesYear) AS SYearGrp FROM SalesList
GROUP BY ROLLUP(SalesYear, SalesQuartes);

/*PROCEDURE*/
create procedure Allrecords as select * from student
go;
exec Allrecords;

/*Deleting Duplicate Data*/
select name,COUNT(name) as count from demo group by name having count(name) > 1; 
SELECT name,ROW_NUMBER() OVER(PARTITION BY name order by name) AS rn FROM demo;
DELETE FROM (SELECT name,ROW_NUMBER() OVER(PARTITION BY name) AS rn FROM demo)WHERE rn > 1;

DELETE from demo where name in(select name from(select name,ROW_NUMBER() OVER(PARTITION BY name order by name) AS rn FROM demo)as sub WHERE rn =2 );
/*Ordering Data Before Deletion*/
DELETE
FROM demo where name in(select name from(
SELECT name,
 ROW_NUMBER() OVER(PARTITION BY name ORDER BY name DESC) AS rn
FROM demo)as rn
WHERE rn =2);

select * from demo;

/*Removing NULL Values*/
SELECT * from demo1 WHERE gender IS NULL;
DELETE FROM demo1 WHERE gender IS NULL;

select * from demo1;

/*Update Data*/
SELECT * from demo1 WHERE gender IS NULL;
UPDATE demo1 SET gender = 'Other' WHERE gender IS NULL;
/*Capitalization of Values*/
UPDATE demo1 SET name = UPPER(name);

/*Correct Logical Errors*/
SELECT * FROM SalesList WHERE SalesYear > CURRENT_TIMESTAMP;

UPDATE SalesList SET  SalesYear= 2012 FROM SalesList WHERE  SalesTotal= 140;

SELECT  * FROM SalesList;

/*COALESCE: It is used to replace missing values with more suitable values*/
SELECT gender, COALESCE(gender, 'Unknown') AS un 
FROM demo1;

/*SUBSTRING:*/
SELECT SUBSTRING(name, 1,5 ) AS short_title
FROM demo;

/*TRIM()*/
create table demo3(id int not null,address varchar(50));
insert into demo3 values('1','old stae colony  ramaveli pune');

select * from demo3;
SELECT TRIM(address) AS trimmed_address from demo3;




