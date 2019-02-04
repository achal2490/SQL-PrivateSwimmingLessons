DROP TABLE Lesson;

DROP TABLE Pool;

DROP TABLE Swimmer;

DROP TABLE Instructor;

DROP TABLE Swimming_School;

DROP TABLE College;

DROP TABLE College;

CREATE TABLE College (
    College_Id       NUMBER(3, 0),
    Name             VARCHAR2(35),
    City             VARCHAR2(11),
    County           VARCHAR2(11),
    Specialism       VARCHAR2(13),
    Yr_Established   NUMBER(4, 0),
    Campus_Size      NUMBER(2, 0)
);

DROP TABLE Swimming_School;

CREATE TABLE Swimming_School (
    Swimming_School_Id   NUMBER(5, 0),
    Name                 VARCHAR2(27),
    City                 VARCHAR2(12),
    County               VARCHAR2(9),
    Specialism           VARCHAR2(14),
    Yr_Established       NUMBER(4, 0),
    Email                VARCHAR2(45),
    Web_Site             VARCHAR2(31)
);

DROP TABLE Instructor;

CREATE TABLE Instructor (
    Instructor_Id        NUMBER(4, 0),
    FName                VARCHAR2(7),
    Sname                VARCHAR2(8),
    Address              VARCHAR2(38),
    Town                 VARCHAR2(27),
    County               VARCHAR2(10),
    Specialism           VARCHAR2(12),
    Date_Of_Birth        DATE,
    Gender               VARCHAR2(6),
    Mobile_No            VARCHAR2(10),
    Reputation           VARCHAR2(9),
    Qualifications       VARCHAR2(7),
    College_Id           NUMBER(3, 0),
    Swimming_School_Id   NUMBER(5, 0)
);

DROP TABLE Swimmer;

CREATE TABLE Swimmer (
    Swimmer_Id      NUMBER(4, 0),
    ForeName        VARCHAR2(7),
    Surname         VARCHAR2(9),
    Address         VARCHAR2(26),
    Town            VARCHAR2(12),
    County          VARCHAR2(10),
    Date_Of_Birth   DATE,
    Gender          VARCHAR2(6),
    Fav_Stroke      VARCHAR2(12),
    Commitment      VARCHAR2(9),
    Weakness        VARCHAR2(11)
);

DROP TABLE Pool;

CREATE TABLE Pool (
    Pool_Id             NUMBER(3, 0),
    Length              NUMBER(2, 0),
    Width               NUMBER(2, 0),
    Shallow_End_Depth   NUMBER(1, 0),
    Deep_End_Depth      NUMBER(1, 0),
    Water_Quality       VARCHAR2(5),
    Pool_Type           VARCHAR2(7),
    Yr_Running_Cost     NUMBER(5, 0)
);

DROP TABLE Lesson;

CREATE TABLE Lesson (
    Instructor_Id    NUMBER(4, 0),
    Swimmer_Id       NUMBER(4, 0),
    Pool_Id          NUMBER(3, 0),
    Lesson_Date      DATE,
    Topic            VARCHAR2(11),
    Instructor_Fee   NUMBER(5, 2),
    Start_Time       VARCHAR2(11),
    End_Time         VARCHAR2(11),
    Progress         VARCHAR2(9)
);

--Primary Keys(PK)

ALTER TABLE College ADD CONSTRAINT College_College_Id_PK PRIMARY KEY ( College_Id );

ALTER TABLE Swimming_School ADD CONSTRAINT SS_Swimming_School_Id_Pk PRIMARY KEY ( Swimming_School_Id );

ALTER TABLE Instructor ADD CONSTRAINT Instructor_Instructor_Id PRIMARY KEY ( Instructor_Id );

ALTER TABLE Swimmer ADD CONSTRAINT Swimmer_Swimmer_Id PRIMARY KEY ( Swimmer_Id );

ALTER TABLE Pool ADD CONSTRAINT Pool_Pool_Id_Pk PRIMARY KEY ( Pool_Id );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Ins_Swim_Pool_Id_Pk PRIMARY KEY ( Instructor_Id, Swimmer_Id, Pool_Id );

--Foreign Keys(FK)

ALTER TABLE Instructor    ADD CONSTRAINT Instructor_College_Id_Fk FOREIGN KEY ( College_Id ) REFERENCES College ( College_Id );

ALTER TABLE Instructor    ADD CONSTRAINT Ins_Swimming_School_Id_Fk FOREIGN KEY ( Swimming_School_Id ) REFERENCES Swimming_School ( Swimming_School_Id );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Instructor_Id_Fk FOREIGN KEY ( Instructor_Id ) REFERENCES Instructor ( Instructor_Id );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Swimmer_Id_Fk FOREIGN KEY ( Swimmer_Id ) REFERENCES Swimmer ( Swimmer_Id );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Pool_Id_Fk FOREIGN KEY ( Pool_Id ) REFERENCES Pool ( Pool_Id );

--Check Constraints(CK)

ALTER TABLE College    ADD CONSTRAINT College_Specialism_Ck CHECK ( Specialism IN ('Engineering', 'Business', 'Science', 'Sport') );

ALTER TABLE Swimming_School    ADD CONSTRAINT Swimming_School_Specialism_Ck CHECK ( Specialism IN ('Children', 'Teenagers', 'Adults', 'Retired', 'Elite Swimmers' ) );

ALTER TABLE Instructor    ADD CONSTRAINT Instructor_Specialism_Ck CHECK ( Specialism IN ('Front Crawl', 'Backstroke', 'Breaststroke', 'Butterfly') );

ALTER TABLE Instructor    ADD CONSTRAINT Instructor_Reputation_Ck CHECK ( Reputation IN ('Fair', 'Good', 'Excellent') );

ALTER TABLE Instructor    ADD CONSTRAINT Instructor_Qualifications_Ck CHECK ( Qualifications IN ('Level 1', 'Level 2', 'Level 3') );

ALTER TABLE Swimmer    ADD CONSTRAINT Swimmer_Fav_Stroke_Ck CHECK ( Fav_Stroke IN ('Front Crawl', 'Backstroke', 'Breaststroke', 'Butterfly') );

ALTER TABLE Swimmer    ADD CONSTRAINT Swimmer_Commitment_Ck CHECK ( Commitment IN ('Fair', 'Good', 'Excellent') );

ALTER TABLE Pool    ADD CONSTRAINT Pool_Water_Quality_Ck CHECK ( Water_Quality IN ('Dirty', 'Clean') );

ALTER TABLE Pool    ADD CONSTRAINT Pool_Pool_Type_Ck CHECK ( Pool_Type IN ('Indoor', 'Outdoor') );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Progress_Ck CHECK ( Progress IN ('Poor', 'Fair', 'Good', 'Excellent') );

ALTER TABLE Lesson    ADD CONSTRAINT Lesson_Topic_Ck CHECK ( Topic IN ('Breathing', 'Turning', 'Use of Feet', 'Arm Action') );

-- Unique Constraints (UQ)												

ALTER TABLE Instructor ADD CONSTRAINT Instructor_Mobile_No_Uq UNIQUE ( Mobile_No );
											
-- Not Null Constraints (NN)												

ALTER TABLE College MODIFY     Name        CONSTRAINT College_Name_Nn NOT NULL;

ALTER TABLE Swimming_School MODIFY    Name        CONSTRAINT Swimming_School_Name_Nn NOT NULL;

ALTER TABLE Instructor MODIFY    Fname        CONSTRAINT Instructor_Fname_Nn NOT NULL;

ALTER TABLE Instructor MODIFY    Sname        CONSTRAINT Instructor_Sname_Nn NOT NULL;

ALTER TABLE Swimmer MODIFY    ForeName        CONSTRAINT Swimmer_ForeName_Nn NOT NULL;

ALTER TABLE Swimmer MODIFY    Surname        CONSTRAINT Swimmer_Surname_Nn NOT NULL;



 /* Table Name:College  */

  /*College_Id,Name,City,County,Specialism,Yr_Established,Campus_Size */
Insert Into  College Values (101,'Maynooth University','Maynooth','Maynooth','Sport',1658,7);
Insert Into  College Values (102,'Athlone Institute of Technology','Athlone','Westmeath','Business',1762,8);
Insert Into  College Values (103,'Carlow College','Carlow','Carlow','Science',1793,8);
Insert Into  College Values (104,'Cork Institute of Technology','Bishopstown','Cork','Engineering',1757,20);
Insert Into  College Values (105,'Dublin City University','Dublin','Dublin','Business',1748,16);
Insert Into  College Values (106,'University of Limerick','Limerick','Limerick','Sport',1977,10);
Insert Into  College Values (107,'University College Cork','Cork','Cork','Engineering',1729,9);
Insert Into  College Values (108,'Letterkenny Institute of Technology','Letterkenny','Letterkenny','Science',1644,4);
Insert Into  College Values (109,'Limerick Institute of Technology','Limerick','Limerick','Engineering',1601,24);
Insert Into  College Values (110,'Waterford Institute of Technology','Waterford','Waterford','Engineering',1897,16);
commit;

  /* Table Name:Swimming_School  */

  /*Swimming_School_Id,Name,City,County,Specialism,Yr_Established,Email,Web_Site */
Insert Into  Swimming_School Values (1000,'Athlone RSC Water Polo Club','Athlone','Westmeath','Children',1945,'athlone.waterpolo@gmail.com','www.athlonerscwaterpoloclub.com');
Insert Into  Swimming_School Values (2000,'3D Masters Swimming Club','Dublin','Dublin','Teenagers',1946,'3dtrimasters@gmail.com',NULL);
Insert Into  Swimming_School Values (3000,'Aer Lingus Masters SC','Swords','Dublin','Adults',1947,'aerlingusmasters@gmail.com',NULL);
Insert Into  Swimming_School Values (4000,'Ards Leisure Centre','Newtownards','Down','Retired',1948,'ardsswimmingclub@gmail.com','www.ardsswimmingclub.co.uk');
Insert Into  Swimming_School Values (5000,'Asgard Masters SC','Arklow','Wicklow','Elite Swimmers',1949,NULL,NULL);
Insert Into  Swimming_School Values (6000,'Limerick Masters SC','Limerick','Limerick','Children',1950,'turmack@eircom.net','www.limerickmasterssc.com');
Insert Into  Swimming_School Values (7000,'Celtic Waves SC','Grove Island','Limerick','Teenagers',1951,'celticwavessc@gmail.com','www.celticwavessc.ie');
Insert Into  Swimming_School Values (8000,'Waterford Crystal SC','Newtown','Waterford','Children',1952,'secretarywaterfordcrystalswimming@outlook.com','www.teamunify.com');
Insert Into  Swimming_School Values (9000,'Irish SAC Swim Club','Dublin','Dublin','Teenagers',1953,NULL,NULL);
Insert Into  Swimming_School Values (10000,'NAC Masters SC','Dublin','Dublin','Adults',1954,'secretary@nacmasters.com','www.nacmasters.com');
commit;

  /* Table Name:Instructor  */

  /*Instructor_Id,FName,Sname,Address,Town,County,Specialism,Date_Of_Birth,Gender,Mobile_No,Reputation,Qualifications,College_Id,Swimming_School_Id */
Insert Into  Instructor Values (111,'Dessie','Dolan','4 Retreat Mews','Athlone','Westmeath','Front Crawl','18-Oct-1985','Female','899-850853','Excellent','Level 1',102,1000);
Insert Into  Instructor Values (222,'Michael','Ennis','Main st Monasterevin','Crocknamurleog','Donegal','Backstroke','28-May-1987','Male','899-843805','Fair','Level 2',101,2000);
Insert Into  Instructor Values (333,'Joe','Fallon','Brewery rd Stillorgan','Glencolumbkille','Donegal','Butterfly','18-Jul-1985','Female','899-856955','Excellent','Level 3',103,3000);
Insert Into  Instructor Values (444,'Martin','Flanagan','12 Main St.','Ballyliffin','Donegal','Breaststroke','09-Sep-1990','Male','899-844431','Good','Level 1',104,4000);
Insert Into  Instructor Values (555,'Derek','Heavin','Athboy Gate Trim','Ballymore','Westmeath','Backstroke','11-Aug-1985','Male','899-818243','Excellent','Level 1',101,5000);
Insert Into  Instructor Values (666,'Ger','Heavin','Carrick rd','Falcarragh (or Cross Roads)','Donegal','Butterfly','09-Dec-1987','Female','899-819295','Good','Level 2',102,6000);
Insert Into  Instructor Values (777,'Fergal','Wilson','Liscannor','Creeslough','Donegal','Breaststroke','11-Dec-1990','Female','899-819876','Fair','Level 3',103,1000);
Insert Into  Instructor Values (888,'Aidan','Lennon','Abbey hse Abbey st','Freshford','Kilkenny','Backstroke','22-Mar-1989','Female','899-865829','Good','Level 2',104,2000);
Insert Into  Instructor Values (999,'Niall','McCusker','101 South Main st','Glenties','Donegal','Butterfly','23-Jul-1980','Male','899-846591','Fair','Level 1',101,3000);
Insert Into  Instructor Values (1110,'Paul','McFlynn','68 Lower Main st','Glassan','Westmeath','Front Crawl','02-Feb-1985','Male','899-866649','Excellent','Level 2',102,4000);
Insert Into  Instructor Values (1221,'Kieran','McKeever','1 Annavilla Grove','Clonmany','Donegal','Breaststroke','05-Feb-1987','Female','899-844439','Excellent','Level 3',103,5000);
Insert Into  Instructor Values (1332,'David','O Neill','Rose`s Street 56','Clogh-Chatsworth','Kilkenny','Butterfly','12-Feb-1992','Male','899-823333','Fair','Level 2',104,6000);
Insert Into  Instructor Values (1443,'Paddy','Bradley','Doonbeg Kilrush','Castlepollard','Westmeath','Front Crawl','20-Oct-1983','Female','899-876327','Excellent','Level 1',105,1000);
Insert Into  Instructor Values (1554,'Eamonn','Burns','33 Ballagh Bushy','Collinstown','Westmeath','Backstroke','02-Jun-1981','Male','899-815835','Good','Level 2',106,2000);
Insert Into  Instructor Values (1665,'Joe','Cassidy','141 Lr Glanmire rd','Ballybofey-Stranorlar','Donegal','Breaststroke','17-Mar-1988','Male','899-837407','Excellent','Level 3',107,3000);
Insert Into  Instructor Values (1776,'Dermot','Dougan','4 Dominic st','Carrick','Donegal','Front Crawl','29-Aug-1989','Female','899-878273','Good','Level 2',108,4000);
Insert Into  Instructor Values (1887,'Seamus','Downey','Batterfield Firie','Culdaff','Donegal','Backstroke','18-Sep-1982','Male','899-817406','Fair','Level 3',105,5000);
Insert Into  Instructor Values (1998,'Fergal','McCusker','6 Cillmhuire','Dunkineely','Donegal','Breaststroke','05-Sep-1983','Female','899-855356','Good','Level 1',106,6000);
Insert Into  Instructor Values (2109,'Enda','Muldoon','Newgrove Business Park Ballinode Road ','Castlecomer-Donaguile','Kilkenny','Front Crawl','09-May-1987','Female','899-852557','Fair','Level 2',107,7000);
Insert Into  Instructor Values (2220,'Benny','Murray','4 Church st','Callan','Kilkenny','Backstroke','29-Sep-1990','Male','899-835041','Excellent','Level 3',108,8000);
commit;
  /* Table Name:Swimmer  */

  /*Swimmer_Id,ForeName,Surname,Address,Town,County,Date_Of_Birth,Gender,Fav_Stroke,Commitment,Weakness */
Insert Into  Swimmer Values (4200,'Enda','Muldoon','4 Retreat Mews','Athlone','Westmeath','24-Aug-1984','Female','Front Crawl','Fair','Breathing');
Insert Into  Swimmer Values (3709,'Benny','Murray','3 Portroe','Castlefin',' Donegal','18-Apr-1988','Male','Backstroke','Good','Turning');
Insert Into  Swimmer Values (4416,'Eoin','McCloskey','2a Rossnakill','Delvin',' Westmeath','15-Mar-1987','Male','Breaststroke','Excellent','Use of Feet');
Insert Into  Swimmer Values (3959,'Damien','McCusker','27 Claddagh House','Ballyshannon',' Donegal','28-Sep-1986','Male','Front Crawl','Fair','Arm Action');
Insert Into  Swimmer Values (3955,'Dermot','Heaney','105 Main st','Greencastle',' Donegal','01-Apr-1989','Male','Backstroke','Excellent','Breathing');
Insert Into  Swimmer Values (4371,'Ronan','Rocks','Ballinacor Hse.','Brinlack',' Donegal','07-Aug-1999','Female','Breaststroke','Good','Turning');
Insert Into  Swimmer Values (4455,'Anthony','Tohill','2 Abbey st','Dunfanaghy',' Donegal','10-Feb-1995','Male','Front Crawl','Excellent','Use of Feet');
Insert Into  Swimmer Values (4324,'Aidan','Lyons','5 Market st ','Donegal',' Donegal','22-Aug-1985','Female','Backstroke','Good','Arm Action');
Insert Into  Swimmer Values (4454,'David','Mitchell','21 The Century Bar Main st','Gowran',' Kilkenny','23-Mar-1994','Male','Butterfly','Fair','Breathing');
Insert Into  Swimmer Values (4181,'Fergal','Murray','3 Eyre st','Johnstown',' Kilkenny','21-Feb-1990','Female','Breaststroke','Good','Turning');
Insert Into  Swimmer Values (4175,'Shane','Deering','4 Main Street','Bridge End',' Donegal','10-Aug-1983','Female','Backstroke','Fair','Use of Feet');
Insert Into  Swimmer Values (4224,'Dessie','Dolan','9 Killucan','Burtonport',' Donegal','30-Mar-1985','Female','Butterfly','Excellent','Arm Action');
Insert Into  Swimmer Values (3595,'Michael','Ennis','3 Summerfield Hse','Ballynacargy',' Westmeath','25-Mar-1990','Male','Front Crawl','Excellent','Breathing');
Insert Into  Swimmer Values (3973,'Joe','Fallon','2 Royal Lodge Rd.','Athlone','Westmeath','30-Apr-1980','Male','Backstroke','Good','Turning');
Insert Into  Swimmer Values (4349,'Derek','Heavin','91 Bridge st','Carrigans',' Donegal','26-Jan-1988','Male','Butterfly','Excellent','Use of Feet');
Insert Into  Swimmer Values (4489,'Ger','Heavin','12 Castle st','Convoy',' Donegal','13-Feb-1993','Female','Breaststroke','Good','Arm Action');
Insert Into  Swimmer Values (3587,'Fergal','Wilson','6 Cluain Ard','Goresbridge',' Kilkenny','21-Jun-1993','Male','Backstroke','Fair','Breathing');
Insert Into  Swimmer Values (4015,'Henry','Downey','4 Retreat Mews','Athlone','Westmeath','02-Sep-1995','Male','Breaststroke','Good','Turning');
Insert Into  Swimmer Values (3785,'Sean','Marty','46 Elm Court','Inistioge',' Kilkenny','10-Apr-2000','Male','Backstroke','Fair','Use of Feet');
Insert Into  Swimmer Values (4379,'Jean','McBride','45 Castle st','Athlone','Westmeath','16-Feb-1999','Female','Butterfly','Good','Arm Action');
commit;


  /*  Table Name:Pool  */

  /*Pool_Id,Length,Width,Shallow_End_Depth,Deep_End_Depth,Water_Quality,Pool_Type,Yr_Running_Cost */
Insert Into Pool Values (601,46,22,1,5,'Clean','Indoor',12000);
Insert Into Pool Values (611,41,48,2,3,'Clean','Outdoor',25000);
Insert Into Pool Values (621,47,50,1,5,'Clean','Indoor',36000);
Insert Into Pool Values (631,47,45,2,5,'Clean','Outdoor',12000);
Insert Into Pool Values (641,48,49,2,5,'Clean','Indoor',9000);
Insert Into Pool Values (651,49,48,2,3,'Clean','Indoor',25000);
Insert Into Pool Values (661,43,41,2,4,'Clean','Outdoor',12000);
Insert Into Pool Values (671,49,47,2,4,'Clean','Indoor',19000);
Insert Into Pool Values (681,48,43,1,3,'Clean','Outdoor',17000);
Insert Into Pool Values (691,40,41,2,5,'Clean','Indoor',12000);
Insert Into Pool Values (701,48,46,2,5,'Clean','Outdoor',25000);
Insert Into Pool Values (711,42,44,2,5,'Clean','Indoor',21000);
Insert Into Pool Values (721,41,49,2,3,'Clean','Outdoor',12000);
Insert Into Pool Values (731,43,48,1,4,'Clean','Outdoor',43000);
Insert Into Pool Values (741,44,46,1,5,'Clean','Indoor',25000);
Insert Into Pool Values (751,46,46,1,4,'Clean','Outdoor',12000);
Insert Into Pool Values (761,41,45,1,4,'Clean','Indoor',33000);
Insert Into Pool Values (771,50,41,1,3,'Dirty','Outdoor',12000);
Insert Into Pool Values (781,46,42,1,3,'Dirty','Outdoor',12000);
Insert Into Pool Values (791,47,43,1,5,'Dirty','Indoor',12000);
commit;

  /*  Table Name:Lesson  */

  /*  Instructor_Id,Swimmer_Id,Pool_Id,Lesson_Date,Topic,Instructor_Fee,Start_Time,End_Time,Progress */
Insert Into  Lesson Values (111,4200,601,'11-Aug-2018','Breathing',174.00,'12:00:00 PM','01:00:00 PM','Poor');
Insert Into  Lesson Values (222,4349,611,'18-Nov-2018','Turning',142.00,'02:00:00 PM','03:00:00 PM','Fair');
Insert Into  Lesson Values (333,4489,621,'25-Dec-2018','Use of Feet',221.00,'04:00:00 PM','05:00:00 PM','Good');
Insert Into  Lesson Values (444,3587,631,'10-Feb-2018','Arm Action',255.00,'06:00:00 PM','07:00:00 PM','Excellent');
Insert Into  Lesson Values (555,4015,641,'25-Oct-2018','Breathing',202.00,'08:00:00 PM','09:00:00 PM','Poor');
Insert Into  Lesson Values (666,3785,651,'10-Feb-2018','Turning',217.00,'10:00:00 PM','11:00:00 PM','Poor');
Insert Into  Lesson Values (777,4379,601,'18-Nov-2018','Breathing',239.00,'10:00:00 PM','11:00:00 PM','Fair');
Insert Into  Lesson Values (888,4200,611,'16-Nov-2018','Turning',130.00,'06:00:00 AM','09:00:00 AM','Good');
Insert Into  Lesson Values (999,3709,621,'12-Jan-2018','Use of Feet',228.00,'04:00:00 AM','07:00:00 AM','Excellent');
Insert Into  Lesson Values (1110,4416,631,'19-Feb-2018','Arm Action',242.00,'06:00:00 AM','07:00:00 AM','Poor');
Insert Into  Lesson Values (111,3959,641,'10-Sep-2018','Use of Feet',225.00,'08:00:00 AM','10:00:00 AM','Fair');
Insert Into  Lesson Values (222,3955,651,'28-Oct-2018','Breathing',130.00,'10:00:00 AM','11:00:00 AM','Good');
Insert Into  Lesson Values (333,4371,741,'09-Nov-2018','Turning',107.00,'12:00:00 PM','01:00:00 PM','Excellent');
Insert Into  Lesson Values (444,4200,751,'25-May-2018','Use of Feet',202.00,'02:00:00 PM','03:00:00 PM','Poor');
Insert Into  Lesson Values (1998,3709,761,'13-Apr-2018','Arm Action',258.00,'04:00:00 PM','05:00:00 PM','Fair');
Insert Into  Lesson Values (2109,4416,741,'13-Mar-2018','Breathing',128.00,'06:00:00 PM','07:00:00 PM','Good');
Insert Into  Lesson Values (2220,3959,751,'23-Jan-2018','Breathing',256.00,'08:00:00 PM','09:00:00 PM','Poor');
Insert Into  Lesson Values (888,3955,761,'08-Jul-2018','Turning',132.00,'10:00:00 PM','11:00:00 PM','Fair');
Insert Into  Lesson Values (999,4371,741,'03-Nov-2018','Use of Feet',108.00,'08:00:00 AM','10:00:00 AM','Good');
Insert Into  Lesson Values (1110,3785,741,'25-Feb-2018','Arm Action',246.00,'09:00:00 AM','11:00:00 AM','Excellent');
commit;

Describe 		College		;
Describe 		Swimming_School		;
Describe 		Instructor		;
Describe 		Swimmer		;
Describe 		Pool		;
Describe 		Lesson		;
				
Select * from 		College		;
Select * from 		Swimming_School		;
Select * from 		Instructor		;
Select * from 		Swimmer		;
Select * from 		Pool		;
Select * from 		Lesson		;
				
Select count(*) from 		College		;
Select count(*) from 		Swimming_School		;
Select count(*) from 		Instructor		;
Select count(*) from 		Swimmer		;
Select count(*) from 		Pool		;
Select count(*) from 		Lesson		;
