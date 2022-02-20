create schema TravelOnTheGo;
use TravelOnTheGo;

-- 1-- 

create table PASSENGER
(Passenger_name varchar(50),
Category varchar(50),
Gender varchar(1),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50) 
);

create table PRICE
(Bus_Type varchar(50),
 Distance int,
 Price int);
 
 -- 2-- 
 
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Sejal','AC','F', 'Bengaluru', 'Chennai', 350 ,'Sleeper');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700,'Sitting');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru' ,600, 'Sleeper');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
 insert into PASSENGER(Passenger_name,Category,Gender,Boarding_City ,Destination_City,Distance ,Bus_Type) values('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700 ,'Sitting');

insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 350 ,770);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 500 ,1100);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 600, 1320);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 700, 1540);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 1000 ,2200);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 1200, 2640);
insert into PRICE(Bus_Type,Distance,Price) values('Sleeper', 350, 434);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 500, 620);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 500, 620);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 600, 744);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 700, 868);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 1000, 1240);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 1200, 1488);
insert into PRICE(Bus_Type,Distance,Price) values('Sitting', 1500, 1860);

-- 3-- 

select Gender,count(Gender) from PASSENGER  Where Distance>=600 group by Gender having count(Gender) ;

-- 4--

select min(Price) from PRICE  where Bus_Type='Sleeper';

-- 5--

select Passenger_name from PASSENGER where Passenger_name like 'S%';

-- 6--

select DISTINCT p.Passenger_name,p.Boarding_City,p.Destination_City,p.Bus_Type,pr.Price from PASSENGER p, PRICE pr where p.Distance =pr.Distance and p.Bus_Type=pr.Bus_Type;

-- 7--

 select p.Passenger_Name, pr.Price from PASSENGER p,PRICE pr where p.Distance=1000 and p.Bus_Type='Sitting';
 
 -- 8--
 
select  p.Passenger_Name,  p.Destination_city as Boarding_City ,p.Boarding_City as Destination_city, pr.Bus_Type, pr.Price from PASSENGER p,PRICE pr where Passenger_Name='Pallavi' and p.Distance=pr.Distance;

 -- 9-- 
 
 select distinct Distance From PASSENGER order by Distance desc;
 
 -- 10-- 
 
SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM PASSENGER ) as Percentage FROM PASSENGER  GROUP BY Passenger_Name;

-- 11-- 

select Distance,Price,
case
when Price >=1000 then 'Expensive'
when Price >=500 and Price <1000 then 'Average Cost'
else 'Cheap'
End Cost
From PRICE;