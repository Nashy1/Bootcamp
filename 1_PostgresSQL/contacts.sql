DROP TABLE my_contacts;
CREATE TABLE my_contacts(
	contact_id BIGSERIAL CONSTRAINT contact_id_key PRIMARY KEY,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	gender VARCHAR(30) NOT NULL,
	phone VARCHAR (10) UNIQUE NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	zip_code_id BIGINT REFERENCES zip_codes (zip_code_id) ON DELETE CASCADE,	
	status_id BIGINT REFERENCES status (status_id) ON DELETE CASCADE ,
	profession_id BIGINT REFERENCES profession (profession_id) ON DELETE CASCADE	
	);
	
SELECT * FROM my_contacts;

INSERT INTO my_contacts (
	last_name,
	first_name, 
	gender, 
	phone, 
	email, 
	zip_code_id,	
	status_id,
	profession_id	
)
VALUES
('Tom','Smith','female','0780615009','tom@gmail.com',1,1,1),
    ('Gugu','Ndaba','female','0780615012','gugu@gmail.com',2,2,2),
    ('Jo','Nala','male','0780615078','jo@gmail.com',1,1,3),
    ('Mary','Smith','female','0610615009','mary@gmail.com',2,2,4),
    ('Kyle','Koo','male','0710615009','kyle@gmail.com',1,2,1),
    ('Sizwe','Nchabe','male','0840615099','sizwe@gmail.com',3,1,3),
    ('Liz','Sun','female','0830777009','liz@gmail.com',3,1,2);
-------------------------------------------------------------------------------------------------------------------------------	
SELECT* 
FROM my_contacts cont
JOIN zip_codes zip
ON cont.zip_code_id = zip.zip_code_id;
-------------------------------------------------------------------------------------------------------------------------------
SELECT cont.last_name, cont.first_name, cont.status , prof.profession_id
FROM my_contacts cont
JOIN profession prof
ON cont.profession_id = prof.profession_id;
 
-------------------------------------------------------------------------------------------------------------------------------- 
SELECT cont.last_name, cont.first_name,  sta.status_id
FROM my_contacts cont
JOIN status sta
ON cont.status_id = sta.status_id

--------------------------------------------------------------------------------------------------------------------------------



SELECT cont.last_name, cont.first_name, seek.seeking1_id
FROM my_contacts cont
JOIN seeking seek
ON cont.seeking1_id = seek.seeking1_id

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


DROP TABLE zip_codes;

CREATE TABLE zip_codes(
    zip_code_id BIGSERIAL CONSTRAINT zip_code_id_key PRIMARY KEY,
	zip_code CHAR(11) NOT NULL,
	city VARCHAR(30) NOT NULL,
	state_name VARCHAR(30) NOT NULL,
	state_abbr CHAR(2) NOT NULL
	
);


INSERT INTO zip_codes
(
zip_code,
	city ,
	state_name ,
	state_abbr
)
VALUES
('36013-36191','Mongomery','Alabama','AL'),
('99703-99781','Fairbanks','Alaska','AK'),
('85641-85705','Tuicson','Arizona','AR');

SELECT * FROM zip_codes;
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
CREATE TABLE profession
(
profession_id BIGSERIAL CONSTRAINT prof_id_key PRIMARY KEY,
	profession VARCHAR(30) NOT NULL
	
);
INSERT INTO profession
(profession)
VALUES
('doctor'),
('teacher'),
('software developer'),
('student');

SELECT * FROM profession;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE status
(
status_id BIGSERIAL CONSTRAINT status_id_key PRIMARY KEY,
status VARCHAR(30) NOT NULL	
);
 
INSERT INTO status
(status)
VALUES
('single'),
('divorced') ;

SELECT * FROM status;

-----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
Drop table contact_seeking
CREATE TABLE contact_seeking
(
contact_id BIGINT NOT NULL REFERENCES my_contacts(contact_id) ON DELETE CASCADE,
seeking1_id BIGINT NOT NULL REFERENCES seeking(seeking1_id) ON DELETE CASCADE
);
INSERT INTO contact_seeking 
( 
contact_id ,
seeking1_id 
)
VALUES
(1,1 ),
(1,2),
(1,7),
(2,1),
(2,4),
(3,3),
(3,1),
(3,6),
(3,5),
(4,1),
(5,2),
(6,1),
(6,3),
(7,2);

SELECT* FROM contact_seeking;

SELECT mc.last_name, mc.first_name,s.seeking1
FROM my_contacts mc
JOIN contact_seeking cs
ON mc.contact_id = cs.contact_id
JOIN seeking s
ON s.seeking1_id = cs.seeking1_id;


--------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

DROP TABLE seeking;

CREATE TABLE seeking
(
    seeking1_id BIGSERIAL CONSTRAINT seeking1_id_key PRIMARY KEY,
    seeking1 varchar(50) NOT NULL UNIQUE
);

INSERT INTO seeking
(
    seeking1
)
VALUES
    ('single male'),
    ('single female'),
    ('same profession'),
    ('under 25'),
    ('under 50'),
    ('over 50'),
    ('student'),
    ('employed'),
    ('retired');
	
	SELECT* FROM seeking;
	
----------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------
DROP TABLE interest;
CREATE TABLE interest
(
interest1_id BIGSERIAL CONSTRAINT interest1_id_key PRIMARY KEY,
	interests VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO interest
(
interests
)
VALUES
('hiking'),
('diving'),
('reading'),
('running'),
('cooking'),
('walking'),
('art'),
('studying'),
('biking');

SELECT *FROM interest;

---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE contact_interest;
CREATE TABLE contact_interest
(
contact_id BIGINT NOT NULL REFERENCES my_contacts(contact_id) ON DELETE CASCADE,
interest1_id BIGINT NOT NULL REFERENCES interest(interest1_id) ON DELETE CASCADE
);
INSERT INTO contact_interest
(
contact_id,
interest1_id
)
VALUES
(1,1),
(1,2),
(1,9),
(2,4),
(2,3),
(2,5),
(3,7),
(3,8),
(3,2),
(4,4),
(4,6),
(4,3),
(5,8),
(5,9),
(5,4),
(6,4),
(6,5),
(6,2),
(7,1),
(7,8),
(7,9);
  
  SELECT *from contact_interest;
  
  SELECT cm.last_name,cm.first_name, i.interests
  FROM my_contacts cm
  JOIN contact_interest cni
  ON cm.contact_id = cni.contact_id
  JOIN interest i
  ON i.interest1_id = cni.interest1_id;
  
  