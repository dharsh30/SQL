create database school;
create table emp(id integer not null,name varchar(20),age integer,city varchar(20));
insert into emp(id,name,age,city) values ('1','Rahul','25','Chennai');
insert into emp(id,name,age,city) values ('2','Kaushik','23','Karur');
insert into emp(id,name,age,city) values ('3','Hardik','27','Chennai');
insert into emp(id,name,age,city) values ('4','Ramesh','24','Salem');
insert into emp(id,name,age,city) values ('5','Komal','25','Trichy');
insert into emp(id,name,age,city) values ('6','Riya','22','Coimbatore');

select * from emp;

create table details(id integer not null,salary integer);
insert into details(id,salary) values ('1','20000');
insert into details(id,salary) values ('3','30000');
insert into details(id,salary) values ('4','19000');

select * from details;

select emp.name,emp.age,details.salary from emp inner join details on emp.id=details.id;
select emp.id,emp.name,emp.age,details.salary from emp left join details on emp.id=details.id;
select emp.id,emp.name,emp.age,details.salary from emp right join details on emp.id=details.id;
select emp.id,emp.name,emp.age,details.salary from emp full join details on emp.id=details.id;
select emp.id,emp.name,emp.age,details.salary from emp cross join details ;


/*string functions */
select ascii('AB');
select char (66);
select len('WIDESKILLS');
select lower('JOHN');
select replace('country','y','ies');
select reverse('PATH');
select str(134.56,4,1);
select upper('peter');
 
 /* date functions */
select dateadd(mm,2,'2010-02-03');
select datediff(year,convert(datetime,'2006-05-06'),convert(datetime,'2009-01-01'));
select datepart(mm,'2008-01-01');
select day('2010-03-21');
select month('2007-04-03');
select year('2011-04-17');

/* mathematical functions */
SELECT abs (-77); /* returns absolute value */
SELECT sin(1.5);/* returns the angle in radian */
SELECT ceiling (14.45);/* returns smaller or greater than the specified value */
SELECT exp (4.5);/* exponential value */
SELECT floor (15.55);
SELECT log (5.4);

create table stud(id integer not null,grade varchar(2),course varchar(10));
insert into stud(id,grade,course) values('1','A','BE');
insert into stud(id,grade,course) values('2','C','MBA');
insert into stud(id,grade,course) values('3','B','BSC');
insert into stud(id,grade,course) values('4','A','MS');
insert into stud(id,grade,course) values('5','B','BBA');
insert into stud(id,grade,course) values('6','A','MBA');
insert into stud(id,grade,course) values('7','C','MCA');

select * from stud;

/* rank functions */
/*ROW_NUMBER() - returns the consecutive number of ranks in desc order*/
select id,grade,ROW_NUMBER() OVER ( ORDER BY id desc) as rank from stud;

create table rate(id integer not null,product varchar(20),cost integer);
insert into rate(id,product,cost) values('105','pen','20');
insert into rate(id,product,cost) values('320','pencil','11');
insert into rate(id,product,cost) values('125','eraser','10');
insert into rate(id,product,cost) values('303','book','150');
insert into rate(id,product,cost) values('215','perfume','1500');
insert into rate(id,product,cost) values('333','shoes','1000');
insert into rate(id,product,cost) values('62','notebook','80');
insert into rate(id,product,cost) values('140','dress','2000');



select * from rate;

/* RANK()-it gives same rank for duplicate record and jumps one rank for the next one*/
select id, cost, RANK() over ( order by id) as rank from rate;

/*dense_rank() the same records have the same ranks*/
select id, product, dense_rank() over (ORDER BY id desc) as rank from rate;

/*groups the rank based on the arguments given*/
select id,product, NTILE(3) over ( order by cost ) as rank from rate where cost>=50;

/* system functions */
select host_id();
select host_name();
select suser_name();
select suser_id('DESKTOP-26TR8EP\HP');
select user_name();
select user_id('dbo');
select db_name();
select db_id();

/* aggregate functions */
select 'average age'=avg(age) from emp;/* avg()- average  */
select 'unique age'=count(distinct age)from emp;
select 'minimun age'=min(age)from emp;/* min()- returns lowest value */
select 'maximum age'=max(age)from emp;/* max() -returns highest value */
select 'sum'= sum(salary)from details;/* returns the sum of values */

/* group by*/
select product,'MINIMUM'=min(cost),'MAXIMUM'=max(cost) from rate where cost<1000 group by product;

