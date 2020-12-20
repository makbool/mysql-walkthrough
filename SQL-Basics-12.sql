

SELECT VERSION(), USER(), DATABASE();

/*
SEQUENCES
CLONE TABLES
*/


drop table book;

create table book 
(
id int primary key auto_increment,
name varchar(50)
);

insert into book(id,name)  values (NULL, 'abc');
insert into book(name)  values ('def');
insert into book(name)  values ('ghi');

select * from book;

delete from book where id = 3;

insert into book(name)  values ('jkl');

ALTER TABLE book AUTO_INCREMENT = 100;

insert into book(name)  values ('mno');

insert into book(name)  values ('pqr');



/*
clone tables
*/

drop table citizen;

create table citizen
(
id int primary key auto_increment,
name varchar(50),
gender varchar(1),
age int
);

insert into citizen(name, gender, age) values ('Ram Kumar', 'M', 22);
insert into citizen(name, gender, age) values ('Robert Joseph', 'M', 27);
insert into citizen(name, gender, age) values ('Rahim khan', 'M', 17);

insert into citizen(name, gender, age) values ('Ganga Mummidi', 'F', 12);
insert into citizen(name, gender, age) values ('Jamuna Karividi', 'F', 21);
insert into citizen(name, gender, age) values ('Saraswathi Tuttukudi', 'F', 34);

drop table citizen_male;


create table citizen_male
(
id int primary key auto_increment,
name varchar(50),
age int
) AS select NULL,name,age from citizen where gender = 'M';



create table citizen_female
(
id int primary key auto_increment,
name varchar(50),
age int
);

insert into citizen_male 
select NULL,name,age from citizen where gender = 'M';

insert into citizen_female 
select NULL,name,age from citizen where gender = 'F';


select * from citizen_male;

select * from citizen_female;




SHOW CREATE TABLE CITIZEN;

CREATE TABLE `citizen_copy` (
   `id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(50) DEFAULT NULL,
   `gender` varchar(1) DEFAULT NULL,
   `age` int DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ;
 
 
 
/*
HANDLING DUPLICATES
*/

DROP TABLE COUNTRY;

drop table country;

create table country
(
	id int primary key auto_increment,
    cd varchar(5)
);

insert into country(CD) values ('IND');
insert into country(CD) values ('PAK');
insert into country(CD) values ('CHI');
insert into country(CD) values ('AUS');
insert into country(CD) values ('BAN');
insert into country(CD) values ('IND');
insert into country(CD) values ('CHI');
insert into country(CD) values ('BAN');
insert into country(CD) values ('IND');


SELECT * FROM COUNTRY;

SELECT CD, COUNT(CD), MIN(ID) FROM COUNTRY GROUP BY CD HAVING COUNT(CD) > 1;

select * from country c1 where c1.id > 
(
SELECT MIN(ID) FROM COUNTRY c2 where c2.cd = c1.cd  GROUP BY CD HAVING COUNT(CD) > 1
) order by cd;

/*
Not a recommended way 
*/

create table country_tmp
as select distinct(cd) from country;

select * from country_tmp;

drop table country;

alter table country_tmp rename to country;

select * from country c1 where c1.id < 
(
SELECT MAX(ID) FROM COUNTRY c2 where c2.cd = c1.cd  GROUP BY CD HAVING COUNT(CD) > 1
) order by cd;

/*
recommended way
*/

DELETE FROM COUNTRY WHERE id in 
(
select id from (
select ID from country c1 where c1.id < 
(
SELECT MAX(ID) FROM COUNTRY c2 where c2.cd = c1.cd  GROUP BY CD HAVING COUNT(CD) > 1
) order by cd
) as duplicate_ids
) ;

/*

In MySQL we can't perform update or delete on a table which is referenced in inner query

*/
