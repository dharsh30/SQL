create database sales;
create table student(id integer not null,name varchar(20),class integer,city varchar(20));
insert into student(id,name,class,city) values('3','Hina','3','Delhi');
insert into student(id,name,class,city) values('4','Megha','2','Delhi');
insert into student(id,name,class,city) values('6','Gouri','2','Delhi');

select * from student;

create table record(id integer not null,class integer,city varchar(20));
insert into record(id,class,city) values('9','3','Delhi');
insert into record(id,class,city) values('10','2','Delhi');
insert into record(id,class,city) values('12','2','Delhi');

select * from record;

delete from student where id='9';
delete from student where id='10';
delete from student where id='12';

create table prod(id integer not null,name varchar(20),supid integer);
insert into prod(id,name,supid) values('1','table','1');
insert into prod(id,name,supid) values('2','chair','1');
insert into prod(id,name,supid) values('3','spoon','2');
insert into prod(id,name,supid) values('4','plate','1');
insert into prod(id,name,supid) values('5','glass','2');
insert into prod(id,name,supid) values('6','pan','3');

select * from prod;

create table supplier(supid integer not null,supname varchar(20),city varchar(20),quantity integer);
insert into supplier(supid,supname,city,quantity) values('1','Exo','Delhi','10');
insert into supplier(supid,supname,city,quantity) values('2','Traders','Mumbai','50');
insert into supplier(supid,supname,city,quantity) values('3','Elite','Pune','20');
insert into supplier(supid,supname,city,quantity) values('4','Port','Bihar','30');

select * from supplier;
/*EQUI JOIN*/
SELECT student.name, student.id, record.class, record.city FROM student, record WHERE student.city = record.city;

SELECT student.name, student.id, record.class, record.city FROM student JOIN record ON student.city = record.city;

/*NON EQUI JOIN - performs join using comparison operator*/
SELECT student.name, record.id, record.city FROM student, record WHERE Student.id < Record.id ;

/*EXISTS*/
SELECT supname FROM supplier WHERE EXISTS (SELECT name FROM prod WHERE prod.supid = supplier.supid AND id>3);

SELECT name FROM prod WHERE EXISTS (SELECT city FROM supplier WHERE prod.supid = supplier.supid AND city='Delhi');

/*SQL ANY Operator*/
SELECT name FROM prod WHERE id = ANY(SELECT supid FROM supplier WHERE quantity>10);

/*SQL ALL*/
SELECT name FROM prod WHERE id = ALL(SELECT supid FROM supplier WHERE quantity < 20);

/*Some operator*/
select name from prod where id > some (select supid from supplier where supname ='Elite');

/*using case*/
SELECT SUM(quantity),
  CASE
    WHEN quantity >= 50 THEN 'high sales'
    WHEN 20 <= quantity  THEN 'medium sales'
    WHEN quantity < 20 THEN 'low sales'
    END AS sales_category
FROM supplier GROUP BY quantity;


