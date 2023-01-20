--DROP DATABASE [LIBRARY]
USE [Library]

CREATE DATABASE [Library]

-- CREATE AUTHORS
CREATE TABLE [Authors]
(
[ID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
[Surname] NVARCHAR(35)NOT NULL,
[Age] INT CHECK(Age<30) NOT NULL,
[AddressID] INT FOREIGN KEY References [Address](ID),
[BookID] INT FOREIGN KEY References [Book](ID),
[WorkID] INT FOREIGN KEY References [Work](ID)
)

drop table Authors
--Valeus Authors
INSERT Authors(Name,Surname,Age,AddressID,BookID,WorkID)
VALUES('King','Stephen',25,1,1,1),
		('Dan','Brown',20,2,2,4),
		 ('Abraham','Stoker',18,4,5,4),
		  ('James','Dashner',26,5,4,3),
		   ('David','Hawkins',29,3,3,2),
		    ('Victor','Marie Hugo',26,6,6,6)

-- CREATE ADDRESS
CREATE TABLE [Address]
(
[ID] INT PRIMARY KEY IDENTITY,
[City] NVARCHAR(25) NOT NULL,
[Country] NVARCHAR(25) NOT NULL
)

--Values Address
INSERT Address(City,Country)
VALUES('Portland ','USA'),
		('New Hampshire','USA'),
		  ('Westminster','UK'),
		    ('Georgia','USA'),
			  ('Portland ','USA'),
			   ('Paris',' France')

-- CREATE BOOK
CREATE TABLE [Book]
(
[ID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(25) NOT NULL
)

--Values Book
INSERT Book(Name)
VALUES('The Running Man'),
		('Deception Point'),
		 ('Dracula'),
		  ('The Maze Runner'),
		   ('Letting Go'),
		    ('Səfillər')
--WORK
CREATE TABLE [Work]
(
[ID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(25) NOT NULL
)

--Values Work
INSERT Work(Name)
VALUES ('Pocket Books'),
		('Corgi Books'),
		 ('Wordsworth Editions Ltd'),
		  ('Delacorte Press'),
		   ('Random House'),
		    ('Can Yayınları')

select * from [Book] b inner join [Authors] a
on b.ID = a.BookID inner join
[Address] ad on	ad.ID = a.AddressID where b.ID=6