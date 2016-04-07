-- Dropping Tables (If they already exist)
 drop table Tree;
 drop table TreeType;
 drop table Scout;
 drop table Session;
 drop table Shift; 
 drop table Transaction;
 
-- Creating the tables:
create table TreeType (
	treeTypeID			int AUTO_INCREMENT,
	typeDescription		varchar(25),
	cost				decimal(5, 2),
	barcodePrefix		char(2),
	constraint primary key(treeTypeID)	
);

create table Tree (
	barcode				char(20),
	treeTypeID			int,
	notes				varchar(200),
	status				varchar(10),
	dateStatusUpdated	char(12),
	check(status IN('Avalible', 'Sold', 'Damaged')),
	check(dateStatusUpdated Like '\d{4}-\d{2}-\d{2}'),
	constraint primary key(barcode),
	constraint foreign key(treeTypeID)
		references TreeType(treeTypeID)
        on delete no action
);

create table Scout (
	scoutID		int AUTO_INCREMENT,
	lastName			varchar(25),
	firstName			varchar(25),
	middleName			varchar(25),
	birthDate			char(12),
	phoneNumber			char(14),
	email				varchar(30),
	troopID				char(10),
	status				varchar(10),
	dateStatusUpdated	char(12),
	check(status IN('Active', 'Inactive')),
	check(birthDate Like '\d{1}-\d{3}-\d{3}-\d{4}'),
	check(birthDate Like '\d{4}-\d{2}-\d{2}'),
	check(dateStatusUpdated Like '\d{4}-\d{2}-\d{2}'),
	constraint primary key(scoutID)
);

create table Session (
	sessionID			int AUTO_INCREMENT,
	startDate			char(12),
	startTime			char(5),
	endTime				char(5),
	startingCash		decimal(6, 2),
	endingCash			decimal(6, 2),
	totalCheckTrans		int,
	notes				varchar(500),
	check(startDate Like '\d{4}-\d{2}-\d{2}'),
	check(startTime Like '\d{2}:\d{2}'),
	check(endTime Like '\d{2}:\d{2}'),
	constraint primary key(sessionID),
);

create table Shift (
	shiftID		int AUTO_INCREMENT,
	constraint primary key(shiftID),
);

create table Transaction (
	transID		int AUTO_INCREMENT,
	constraint primary key(transID),
);

-- Insertion Statements:
insert into Book(author, title, pubYear, status)
values	
		('George Polya', 'How to Solve It', '1945', 'in'),
		('John Steinbeck', 'Of Mice and Men', '1937', 'out'),
		('J.K. Rowling', 'Harry Potter and the Chamber of Secrets', '1998', 'out'),
		('John Steinbeck', 'East of Eden', '1952', 'in'),
		('Veronica Roth', 'Divergent', '2001', 'out'),
		('Irma S. Rombauer', 'The Joy of Cooking', '1931', 'in'),
		('Charles Dickens', 'A Tale of Two Cities', '1859', 'out'),
		('J.R.R. Tolkien', 'The Hobbit', '1937', 'in'),
		('Veronica Roth', 'Insurgent', '2012', 'out'),
		('J.K. Rowling', 'Harry Potter and the Goblet of Fire', '2000', 'in');

insert into Patron(name, address, city, stateCode, zip, email, dateOfBirth, status)
values	
		('John Doe', '10 Main Street', 'Brockport', 'NY', '14420', 'johndoe@yahoo.com', '1980-05-04', 1),
		('Jane Doe', '20 Morgan Road', 'Liverpool', 'NY', '13090', 'janed@aol.com', '1970-06-08', 1),
		('Clay Mills', '9948 Cambridge Drive', 'West Chester', 'PA', '19380', 'cmills@gmail.com', '1947-07-27', 1),
		('Kathleen Hill', '7100 State Street', 'Concord', 'NH', '03301', 'khill@aol.com', '1951-03-10', 1),
		('Frances Green', '542 North Ave.', 'Lawrence Township', 'NJ', '08648', 'fgreen@yahoo.com', '1957-11-09', 1),
		('Todd Gray', '3222 Elm Street', 'Corpus Christi', 'TX', '78418', 'toddg@gmail.com', '1980-03-25', 1),
		('Dennis Rogers', '25 State Street', 'Brockport', 'NY', '14420', 'dennisr@yahoo.com', '1987-04-13', 1),
		('Jose Jenkins', '46 Bass Street', 'Liverpool', 'NY', '13090', 'josej@hotmail.com', '1997-05-04', 1),
		('Lawrence Stewart', '6224 3rd Street', 'Liverpool', 'NY', '13090', 'lawstew@yahoo.com', '1998-07-03', 1),
		('Lillian Diaz', '81 Bass Street', 'Liverpool', 'NY', '13090', 'lildiz@gmail.com', '2001-04-13', 1);

insert into Transaction(bookId, patronId, transType, dateOfTrans)
values	
		(9, 10, 'Rent', '2006-01-04'),
		(8, 9, 'Return', '2000-02-04'),
		(7, 1, 'Rent', '2004-01-14'),
		(6, 6, 'Return', '2015-02-27'),
		(2, 4, 'Rent', '2004-11-17'),
		(5, 2, 'Return', '2010-02-04'),
		(1, 7, 'Rent', '2006-01-04'),
		(3, 8, 'Return', '2000-03-04'),
		(4, 5, 'Rent', '2006-01-15'),
		(10, 3, 'Return', '2015-09-04');

