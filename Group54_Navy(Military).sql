/* Create Database */
CREATE DATABASE NAVY;

/* Selection of Database */
USE NAVY;

/* Create SHIP table */
CREATE TABLE SHIP(
Ship_ID varchar(5) NOT NULL,
Ship_Type varchar(15),
Ship_Name varchar(15),
Ship_Owner varchar(20),
primary key(Ship_ID)
);


/* Create Rank table as _Rank_ since rank is keyword in sql */
CREATE TABLE _RANK_(
Rank_ID varchar(5) NOT NULL,
Rank_Name varchar(15),
primary key(Rank_ID)
);


/* Create DEPARTMENT table */
CREATE TABLE DEPARTMENT(
Department_ID varchar(5) NOT NULL,
Department_Name varchar(30),
Country varchar(15),
State varchar(15), 
Department_Email varchar(50),
primary key(Department_ID)
);


/* Create SAILER table */
CREATE TABLE SAILER(
Sailer_ID varchar(5) NOT NULL,
First_Name  varchar(15),
Last_Name  varchar(15),
Sailer_Department varchar(5),
Sailer_Ship varchar(5),
Sailer_Rank varchar(15),
Sailer_Mentor varchar(5),
primary key(Sailer_ID),
constraint FK_Mentor Foreign key(Sailer_Mentor) references SAILER(Sailer_ID) on update cascade on delete set null,
constraint FK_Ship foreign key(Sailer_Ship) references SHIP(Ship_ID) on update cascade on delete set null,
constraint FK_Rank foreign key(Sailer_Rank) references _RANK_(Rank_ID) on update cascade on delete set null,
constraint FK_Department foreign key(Sailer_Department) references Department(Department_ID) on update cascade on delete cascade
);


/* Create SAILER_CONTACT table */
CREATE TABLE SAILER_CONTACT(
Sailer_ID varchar(5) NOT NULL,
Contact_Number varchar(12),
primary key(Sailer_ID,Contact_Number),
constraint FK_Contact foreign key(Sailer_ID) references SAILER(Sailer_ID) on update cascade on delete cascade
);


/* Create SERVICE_HISTORY table */
CREATE TABLE SERVICE_HISTORY (
Sailer_ID varchar(5) NOT NULL,
Service_Type varchar(15) NOT NULL,
Resignation_Date date,
Registered_Date date,
Years_of_Service INT GENERATED ALWAYS AS (YEAR(Resignation_Date) - YEAR(Registered_Date)),
primary key(Sailer_ID,Service_Type),
constraint FK_Service foreign key(Sailer_ID) references SAILER(Sailer_ID) on delete cascade on update cascade
);



/* Create BASE table */
CREATE TABLE BASE(
Base_ID varchar(5) NOT NULL,
Base_Department varchar(5),
Base_Name varchar(15),
Country varchar(15),
State varchar(15), 
primary key(Base_ID),
constraint FK_BaseDepartment foreign key(Base_Department) references DEPARTMENT(Department_ID) on update cascade on delete cascade
);



/* Create Base_Contact table */
CREATE TABLE Base_Contact(
Base_ID varchar(5) NOT NULL,
Contact_Number varchar(12),
primary key(Base_ID,Contact_Number),
constraint FK_BaseContact foreign key(Base_ID) references BASE(Base_ID) on update cascade on delete cascade
);


/* Create WEAPON table */
CREATE TABLE WEAPON (
Weapon_ID varchar(5) NOT NULL,
Ship_ID varchar(5) ,
Weapon_Name varchar(20),
Weight float(15),
_Range_ varchar(15),
primary key(Weapon_ID),
constraint FK_CarrierShip foreign key(Ship_ID) references SHIP(Ship_ID) on delete set null on update cascade
);



/* Create CERTIFICATE table */
CREATE TABLE CERTIFICATE(
Weapon_ID varchar(5) NOT NULL,
Certificate_Name varchar(35) NOT NULL,
Expiration_Date date,
Certificate_Type varchar(15),
primary key(Weapon_ID,Certificate_Name),
constraint FK_SailerCertificate foreign key(Weapon_ID) references WEAPON(Weapon_ID) on update cascade on delete cascade
);




/* Insert,update delete operations to SHIP table */
INSERT INTO SHIP VALUES ('H101C', 'Heavy Carrier', 'PHOENIX-77', 'A. Johnson');
INSERT INTO SHIP VALUES ('P306S', 'Passenger', 'OCEANIA-12', 'CruiseCo Ltd.');
INSERT INTO SHIP VALUES ('M402C', 'Mini Carrier', 'SEAGULL-9', 'B. Jagath');
INSERT INTO SHIP VALUES ('P518S', 'Passenger', 'CITY CRUISER', 'SL Routers');
INSERT INTO SHIP VALUES ('B609S', 'Battleship', 'WARHAWK-55', 'Naval Command');
INSERT INTO SHIP VALUES ('M724C', 'Mini Carrier', 'TINY WINGS', 'X. Enterprises');

UPDATE SHIP set Ship_Name ='SL WINGS' where Ship_ID='M724C';
UPDATE SHIP set Ship_Owner ='Lexer Ltd.' where Ship_ID='P306S';
DELETE FROM SHIP where Ship_ID='M724C';


/* Insert,update delete operations to _RANK_ table */
INSERT INTO _RANK_ VALUES ('RA-02', 'Rear Admiral');
INSERT INTO _RANK_ VALUES ('LT-01', 'Lieutenant');
INSERT INTO _RANK_ VALUES ('SM-01', 'Seaman');
INSERT INTO _RANK_ VALUES ('TF-01', 'The Fleet');
INSERT INTO _RANK_ VALUES ('CA-03', 'Captain ');
INSERT INTO _RANK_ VALUES ('VA-02', 'Vice Admiral');

UPDATE _RANK_ set Rank_ID ='RA-52' where Rank_ID='RA-02';
UPDATE _RANK_ set Rank_Name ='New Seaman' where Rank_ID='SM-01';
DELETE FROM _RANK_ where Rank_ID='SM-01';



/* Insert,update delete operations to DEPARTMENT table */
INSERT INTO DEPARTMENT VALUES ('SD101', 'Supply Department', 'USA', 'California', 'Supply101@gmail.com');
INSERT INTO DEPARTMENT VALUES ('CD202', 'Communications Department', 'Sri Lanka', 'Hambanthota', 'CommDept202@gmail.com');
INSERT INTO DEPARTMENT VALUES ('OD303', 'Operations Department', 'Australia', 'New South Wales', 'OpsDept303@gmail.com');
INSERT INTO DEPARTMENT VALUES ('DD404', 'Deck Department', 'UK', 'England', 'Deck404@gmail.com');
INSERT INTO DEPARTMENT VALUES ('TD505', 'Training Department', 'Sri Lanka', 'Trincomalee', 'Training505@gmail.com');

UPDATE DEPARTMENT set  Department_ID='CD244' where Department_ID='CD202';
UPDATE DEPARTMENT set  Department_Email='TrainDP123@gmail.com' where Department_ID='TD505';
DELETE FROM DEPARTMENT where Department_ID='SD101';



/* Insert,update delete operations to SAILER table */
INSERT INTO SAILER VALUES ('NV234', 'Sunil', 'Perera', 'CD244', 'H101C','TF-01',null);
INSERT INTO SAILER VALUES ('NV654', 'Andrew', 'James', 'CD244', 'P306S','RA-52','NV234');
INSERT INTO SAILER VALUES ('NV987', 'John', 'James','OD303', 'M402C','VA-02','NV654');
INSERT INTO SAILER VALUES ('NV198', 'Jagath', 'Ahangama', 'DD404', 'P518S','LT-01','NV987');
INSERT INTO SAILER VALUES ('NV084', 'Poorna', 'Iduwara', 'TD505', 'B609S','CA-03','NV198');
INSERT INTO SAILER VALUES ('NV777', 'Zeek', 'Johanas', 'DD404', 'B609S','CA-03','NV084');
INSERT INTO SAILER VALUES ('NV124', 'Pramod', 'Madusha', 'TD505', 'B609S','CA-03','NV084');

UPDATE SAILER set First_Name= 'Indunil' where Sailer_ID='NV084';
UPDATE SAILER set Sailer_Rank= 'VA-02' where Sailer_ID='NV084';
DELETE FROM SAILER where Sailer_ID='NV654';


/* Insert,update delete operations to SAILER_CONTACT table */
INSERT INTO SAILER_CONTACT values ('NV198','+94773752627');
INSERT INTO SAILER_CONTACT values ('NV198','+94776654471');
INSERT INTO SAILER_CONTACT values ('NV777','+34743772227');
INSERT INTO SAILER_CONTACT values ('NV777','+34775574431');
INSERT INTO SAILER_CONTACT values ('NV987','+14708752345');
INSERT INTO SAILER_CONTACT values ('NV084','+88798752256');
INSERT INTO SAILER_CONTACT values ('NV987','+14708722123');

UPDATE  SAILER_CONTACT set Contact_Number='+1412345678' where Sailer_ID='NV987' and Contact_Number='+14708752345';
UPDATE  SAILER_CONTACT set Contact_Number='+3400000020' where Sailer_ID='NV777' and Contact_Number='+34775574431';
DELETE FROM SAILER_CONTACT where Sailer_ID='NV987' and Contact_Number='+1412345678';




/* Insert,update delete operations to SERVICE_HISTORY table */
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV234','As Lieutenant','2010-05-04','2007-08-11');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV234','As Vice Admiral','2019-09-25','2007-08-11');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV124','As Vice Admiral','2022-08-10','2018-05-13');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV987','As Captain','2009-04-10','2003-08-21');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV198','As Seaman','2019-07-15','2012-10-11');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV198','As Lieutenant','2022-01-03','2019-07-15');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV084','As Lieutenant','2015-11-03','2000-07-15');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV084','As Captain','2000-01-01','1998-02-25');
INSERT INTO SERVICE_HISTORY(Sailer_ID, Service_Type, Resignation_Date, Registered_Date) values ('NV987','As Lieutenant','2012-11-01','2005-12-25');

UPDATE SERVICE_HISTORY set Registered_Date='2017-11-12' where Sailer_ID='NV198' and Registered_Date='2019-07-15';
UPDATE SERVICE_HISTORY set Resignation_Date='2017-11-12' where Sailer_ID='NV084' and Registered_Date='2000-07-15';
DELETE FROM SERVICE_HISTORY where Sailer_ID ='NV198' and Service_Type='As Seaman';



/* Insert,update delete operations to BASE table */
INSERT INTO BASE values ('SD_11','DD404','NorthBase','USA','Florida');
INSERT INTO BASE values ('CD_01','CD244','WestPoint','Sri Lanka','Hambanthota');
INSERT INTO BASE values ('OD_87','OD303','SouthBase','UK','England');
INSERT INTO BASE values ('DD_44','DD404','NorthWest','Australia','South Wales');
INSERT INTO BASE values ('TD_11','TD505','NorthSouth','Sri Lanka','Trincomalee');
INSERT INTO BASE values ('SD_56','CD244','SouthCoast', 'USA', 'California');

UPDATE BASE SET Base_Name='WestPointCoast' where Base_ID='CD_01';
UPDATE BASE SET State='North Wales' where Base_ID='DD_44';
DELETE FROM BASE where Base_ID='SD_56';



/* Insert,update delete operations to Base_Contact table */
INSERT INTO Base_Contact values ('SD_11','+34876683211');
INSERT INTO Base_Contact values ('CD_01','+94117653982');
INSERT INTO Base_Contact values ('OD_87','+54009887923');
INSERT INTO Base_Contact values ('CD_01','+94898880554');
INSERT INTO Base_Contact values ('TD_11','+48876633354');
INSERT INTO Base_Contact values ('TD_11','+48787556794');

UPDATE Base_Contact set Contact_Number='+94000000123' where Base_ID='CD_01' and Contact_Number='+94117653982';
UPDATE Base_Contact set Contact_Number='+48123456123' where Base_ID='OD_87' ;
DELETE FROM Base_Contact where Base_ID='TD_11' and  Contact_Number='+48787556794';



/* Insert,update delete operations to WEAPON table */
INSERT INTO WEAPON values ('FA_66','H101C','Pistol','1.36','Short');
INSERT INTO WEAPON values ('FA_77','P306S','Shotgun','2.29','Short');
INSERT INTO WEAPON values ('MG_68','H101C','LMG','6.88','Medium');
INSERT INTO WEAPON values ('MG_26','M402C','MMG','9.78','Medium');
INSERT INTO WEAPON values ('AT_90','B609S','Anti-Tank Missile','45.91','Long');
INSERT INTO WEAPON values ('AT_00','B609S','Mortars','135.7','Long');

UPDATE WEAPON set Weight='3.6' where Weapon_ID='FA_77';
UPDATE WEAPON set Weapon_Name='LongMAG' where Weapon_ID='MG_68';
DELETE FROM WEAPON where Weapon_ID='FA_66';



/* Insert,update delete operations to CERTIFICATE table */
INSERT INTO CERTIFICATE values ('MG_26','CCP','2025-09-07','Local');
INSERT INTO CERTIFICATE values ('MG_26','Security Guard License','2030-12-07','Local');
INSERT INTO CERTIFICATE values ('FA_77','Specialized Licenses','2030-09-12','Local');
INSERT INTO CERTIFICATE values ('MG_68','Security Guard License','2025-09-07','International');
INSERT INTO CERTIFICATE values ('MG_68','Enforcement Licenses','2035-10-07','International');
INSERT INTO CERTIFICATE values ('AT_90','Enforcement Licenses','2050-10-07','International');
INSERT INTO CERTIFICATE values ('AT_90','Military Licenses','2061-09-22','International');

UPDATE CERTIFICATE set Certificate_Type='Local' where Weapon_ID='AT_90' and Certificate_Name='Military Licenses' ;
UPDATE CERTIFICATE set Expiration_Date='2035-01-01' where Weapon_ID='AT_90' and Certificate_Name='Military Licenses' ;
DELETE FROM CERTIFICATE where Weapon_ID='AT_90' and Certificate_Name='Enforcement Licenses';











/*CHAPTER 05*/
/*Simple Queries*/


/*Select Operation*/
Select * from Department  where Country ='Sri Lanka';

/*Project Operation*/
Select Sailer_ID,First_Name,Sailer_Department,Sailer_Rank,Sailer_Mentor from SAILER where Sailer_Mentor='NV084';

/*the cartesian product operation*/
Select BASE.Base_ID,BASE.Country,BASE.State,_RANK_.Rank_Name from Base cross join _Rank_ ;

/* Create a user view*/
create view UV1 as Select  W.Weapon_ID,S.Ship_ID,S.Ship_Name as Carrier_Ship,S.Ship_Type, Weapon_Name,W.Weight from SHIP as S natural join WEAPON  as W;
select * from UV1;/*Drop view UV1*/

/*Renaming Operation*/
Alter table WEAPON RENAME COLUMN Weight TO Average_Weight;
/*Alter table WEAPON RENAME COLUMN Average_Weight TO Weight;*/

/*Demonstration of an aggregation function*/
Select Service_Type, Avg(Years_of_Service),Count(Sailer_ID) from SERVICE_HISTORY group by Service_Type;

/*Demonstration of the use of LIKE keyword*/
Select Sailer_ID,Service_Type,Registered_Date,Resignation_Date from SERVICE_HISTORY where Resignation_Date like '201_-0_-__';



/*Complex queries*/

/*union*/
Select * from Sailer_Contact ;
Select * from Base_Contact where Contact_Number like '+94%';

Select Sailer_ID as Base_or_Sailer_ID,Contact_Number from Sailer_Contact
union 
select Base_ID,Contact_Number from Base_Contact as B where B.Contact_Number like '+94%';


/*Intersection*/
Select * from Sailer;
Select * from service_history where Years_of_Service>5;

/*Since INTERSECT keyword is not working in current version this operation is implimented using inner join*/
Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department,H.Service_Type,H.Registered_Date,H.Resignation_Date from Sailer as S 
inner join service_history as H on S.Sailer_ID=H.Sailer_ID  where Years_of_Service>5;

/*Set Difference*/
Select * from sailer;
Select * from service_history;
Select * from service_history where Resignation_Date='2000-01-01' or Resignation_Date='2017-11-12';

Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department from sailer as S where S.Sailer_ID NOT IN (Select Years_of_Service from service_history where Resignation_Date='2000-01-01' or Resignation_Date='2017-11-12');


/*Division*/
Select * from service_history;
select DISTINCT sailer_ID from service_history where Registered_Date ='1998-02-25' or Registered_Date ='2003-08-21';
SELECT DISTINCT Service_Type from service_history as S1 where not exists (select distinct Sh.Sailer_ID from service_history as Sh where S1.Registered_Date ='2003-08-21' or S1.Registered_Date ='1998-02-25' AND Sh.sailer_ID not in (SELECT S2.Sailer_ID from service_history as S2 where S2.Service_Type=S1.Service_Type));

/*Inner Join*/
CREATE VIEW UV2 as SELECT Sailer_ID,First_Name,Last_Name,Sailer_Department,Sailer_Rank from sailer;
select * from UV2;
CREATE VIEW UV3 as SELECT Rank_ID from _Rank_;
select * from UV3;
select View2.*,View3.Rank_ID from UV2 as View2 inner join UV3 as View3 on View2.Sailer_Rank=View3.Rank_ID where first_name ='Indunil' or  first_name ='Pramod' or first_name ='Sunil'  ;

/*natural Join*/
CREATE VIEW UV4 AS SELECT  Weapon_ID,Weapon_Name,Average_Weight from weapon;
select * from UV4;

CREATE VIEW UV5 AS SELECT Ship_Type,Ship_Name,Ship_Owner from ship;
select * from UV5;
select * from UV5 where Ship_Owner = "Naval Command";

SELECT DISTINCT view5.*,view4.* from UV4 as View4 natural join UV5 as View5  where view5.Ship_Owner = "Naval Command";


/*Right Outer Join*/
CREATE VIEW UV6 as SELECT * from SAILER;
select * from UV6;

CREATE VIEW UV7 as SELECT Department_ID,Department_Name from DEPARTMENT;
select * from UV7;
select * from UV7 where Department_Name="Deck Department" or Department_Name="Training Department" ;
SELECT * from UV6 as view6 right outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where Department_Name="Deck Department" or Department_Name="Training Department";


/*left Outer Join*/
select * from UV6;
select * from UV6 where last_name like 'a%' or last_name like 'm%' ;
select * from UV7;
SELECT * from UV6 as view6 left outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where  view6.last_name like 'a%' or last_name like 'm%';


/*full Outer Join*/
CREATE VIEW RIGHT_OUTER as SELECT * from UV6 as view6 right outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID;
select * from RIGHT_OUTER;

CREATE VIEW LEFT_OUTER as SELECT * from UV6 as view6 left outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where view6.Sailer_Rank='TF-01' or view6.Sailer_Rank='VA-02' or view6.Sailer_Rank='CA-03';
select * from LEFT_OUTER;

(SELECT * from RIGHT_OUTER) UNION (SELECT * from LEFT_OUTER);



/*-Outer Union*/
select * from Base;
select * from Department;
SELECT Base_ID, Base_Department AS Department_Name, Base_Name, Country, State, NULL AS Department_Email FROM Base
UNION ALL
SELECT Department_ID AS Base_ID, Department_Name, NULL AS Base_Name, Country, State, Department_Email FROM Department;


/*NESTED QUERY*/
/*1*/
SELECT * FROM sailer;
SELECT * FROM Department;
SELECT * FROM Department WHERE state = 'Hambanthota' or  state = 'England' or state = 'New South Wales';
SELECT * FROM sailer WHERE Sailer_Department in ( SELECT Department_ID  FROM Department  WHERE state = 'Hambanthota' or  state = 'England' or state = 'New South Wales');

/*2*/
SELECT * FROM ship;
SELECT * FROM weapon;
SELECT * FROM certificate;
SELECT *  FROM certificate WHERE Expiration_Date > '2030-09-07';
Select * from ship where Ship_ID in (SELECT W.Ship_ID FROM weapon as W WHERE W.Weapon_ID IN ( SELECT C.Weapon_ID  FROM certificate as C WHERE Expiration_Date > '2030-09-07'));

/*3*/
SELECT * FROM ship;
SELECT * FROM Weapon;
SELECT * FROM Weapon where Average_Weight>5;
Select * from Ship where Ship_ID in(Select W.Ship_ID from Weapon as W where Weapon_ID in(Select Weapon_ID from weapon where Average_Weight>5));






/*Chapter 6*/



/*Tuning of Intersection*/
SHOW INDEX FROM service_history;

 EXPLAIN(Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department,H.Service_Type,H.Registered_Date,H.Resignation_Date from Sailer as S 
inner join service_history as H on S.Sailer_ID=H.Sailer_ID  where Years_of_Service>5);

CREATE INDEX  year_idx on service_history(Years_of_Service);

 EXPLAIN(Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department,H.Service_Type,H.Registered_Date,H.Resignation_Date from Sailer as S 
inner join service_history as H on S.Sailer_ID=H.Sailer_ID  where Years_of_Service>5);



/*Tunning of Set Difference*/
SHOW INDEX FROM service_history;

EXPLAIN(Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department from sailer as S where S.Sailer_ID NOT IN (Select Years_of_Service from service_history where Resignation_Date='2000-01-01' or Resignation_Date='2017-11-12'));

CREATE INDEX  Resigdate_idx on service_history(Resignation_Date);

SHOW INDEX FROM service_history;

EXPLAIN(Select S.Sailer_ID,S.Sailer_Rank,S.Sailer_Department from sailer as S where S.Sailer_ID NOT IN (Select Years_of_Service from service_history where Resignation_Date='2000-01-01' or Resignation_Date='2017-11-12'));




/*Tunning of Set Division*/
SHOW INDEX FROM service_history;

EXPLAIN(SELECT DISTINCT Service_Type from service_history as S1 where not exists (select distinct Sh.Sailer_ID from service_history as Sh where S1.Registered_Date ='2003-08-21' or S1.Registered_Date ='1998-02-25' AND Sh.sailer_ID not in (SELECT S2.Sailer_ID from service_history as S2 where S2.Service_Type=S1.Service_Type)));
select * from service_history;

CREATE INDEX  Servie_idx on service_history(Registered_Date);

SHOW INDEX FROM service_history;

EXPLAIN(SELECT DISTINCT Service_Type from service_history as S1 where not exists (select distinct Sh.Sailer_ID from service_history as Sh where S1.Registered_Date ='2003-08-21' or S1.Registered_Date ='1998-02-25' AND Sh.sailer_ID not in (SELECT S2.Sailer_ID from service_history as S2 where S2.Service_Type=S1.Service_Type)));





/*Tunning of Inner Join*/
SHOW INDEX FROM sailer;

EXPLAIN(select View2.*,View3.Rank_ID from UV2 as View2 inner join UV3 as View3 on View2.Sailer_Rank=View3.Rank_ID where first_name ='Indunil' or  first_name ='Pramod' or first_name ='Sunil');

CREATE INDEX ft_name on sailer(First_Name);

SHOW INDEX FROM sailer;

EXPLAIN(select View2.*,View3.Rank_ID from UV2 as View2 inner join UV3 as View3 on View2.Sailer_Rank=View3.Rank_ID where first_name ='Indunil' or  first_name ='Pramod' or first_name ='Sunil');





/*Tunning of natural Join*/

SHOW INDEX FROM Ship;

EXPLAIN(SELECT DISTINCT view5.*,view4.* from UV4 as View4 natural join UV5 as View5  where view5.Ship_Owner = "Naval Command");

CREATE INDEX ship_owner_ix on Ship(Ship_Owner);

SHOW INDEX FROM Ship;

EXPLAIN(SELECT DISTINCT view5.*,view4.* from UV4 as View4 natural join UV5 as View5  where view5.Ship_Owner = "Naval Command");






/*Tunning of right outer Join*/

SHOW INDEX FROM Department;

EXPLAIN(SELECT * from UV6 as view6 right outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where Department_Name="Deck Department" or Department_Name="Training Department");

CREATE INDEX dp_name_idx on Department(Department_Name);

SHOW INDEX FROM Department;

EXPLAIN(SELECT * from UV6 as view6 right outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where Department_Name="Deck Department" or Department_Name="Training Department");





/*Tunning of left outer Join*/

SHOW INDEX FROM Sailer;

EXPLAIN(SELECT * from UV6 as view6 left outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where  view6.last_name like 'a%' or last_name like 'm%');

CREATE INDEX last_name_idx on Sailer(Last_Name);

SHOW INDEX FROM Sailer;

EXPLAIN(SELECT * from UV6 as view6 left outer join uv7 as view7 on view6.Sailer_Department=view7.Department_ID where  view6.last_name like 'a%' or last_name like 'm%');






/*Tunning of Nested Query 1*/

SHOW INDEX FROM Department;

EXPLAIN(SELECT * FROM sailer WHERE Sailer_Department in ( SELECT Department_ID  FROM Department  WHERE state = 'Hambanthota' or  state = 'England' or state = 'New South Wales'));

CREATE INDEX state_idx on Department(state);

SHOW INDEX FROM Department;

EXPLAIN(SELECT * FROM sailer WHERE Sailer_Department in ( SELECT Department_ID  FROM Department  WHERE state = 'Hambanthota' or  state = 'England' or state = 'New South Wales'));




/*Tunning of Nested Query 2*/

SHOW INDEX FROM certificate;

EXPLAIN(Select * from ship where Ship_ID in (SELECT W.Ship_ID FROM weapon as W WHERE W.Weapon_ID IN ( SELECT C.Weapon_ID  FROM certificate as C WHERE Expiration_Date > '2030-09-07')));

CREATE INDEX exp_date_idx on certificate(Expiration_Date);

SHOW INDEX FROM certificate;

EXPLAIN(Select * from ship where Ship_ID in (SELECT W.Ship_ID FROM weapon as W WHERE W.Weapon_ID IN ( SELECT C.Weapon_ID  FROM certificate as C WHERE Expiration_Date > '2030-09-07')));




/*Tunning of Nested Query 3*/

SHOW INDEX FROM weapon;

EXPLAIN(Select * from Ship where Ship_ID in(Select W.Ship_ID from Weapon as W where Weapon_ID in(Select Weapon_ID from weapon where Average_Weight>5)));

CREATE INDEX avg_wei_idx on weapon(Average_Weight);

SHOW INDEX FROM weapon;

EXPLAIN(Select * from Ship where Ship_ID in(Select W.Ship_ID from Weapon as W where Weapon_ID in(Select Weapon_ID from weapon where Average_Weight>5)));
