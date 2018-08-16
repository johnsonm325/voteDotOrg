/*group 15*/

/***********************************************
	TABLE STRUCTURE FOR user_data
***********************************************/
CREATE TABLE `user_data` (
	`user_id` INT(3) AUTO_INCREMENT NOT NULL,
	`username` varchar(20) NOT NULL,
	`password` varchar(20) NOT NULL,
	`first_name` varchar(20) NOT NULL,
	`last_name` varchar(20) NOT NULL,
	`dob` date NOT NULL,
	`address` varchar(50) NOT NULL,
	`city` varchar(20) NOT NULL,
	`state` varchar(20) NOT NULL,
	`zip` int(5) NOT NULL,
	`email` varchar(50) NOT NULL,
	`state_id` varchar(20) NOT NULL,
	`ssn` int(9) NOT NULL,
	`race` varchar(2) NOT NULL,
	`sex` varchar(1) NOT NULL,
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*
-- race names come from US census categorization
-- abbreviations will be looked up in a lookup table
	-White  -> [WH]
	-Black or African-American -> [BL]
	-American Indian or Alaska Native -> [AS]
	-Asian -> [AI]
	-Native Hawaiian or other Pacific Islander -> [NH]
	-Some other -> [OT]
*/

/*DATA FOR user_data*/
INSERT INTO `user_data` (`username`, `password`, `last_name`, `first_name`, `dob`, `address`, `city`, `state`, `zip`, `email`, `state_id`, `ssn`, `race`, `sex`)
VALUES 	('esmith', 'Atfnonu6', 'Smith', 'Emma', '1942-09-29', '322 Main Street', 'Portland', 'OR', '97330', 'Emma.Smith@gmail.com', '3386151058', '873313307', 'WH', 'F'),
		('ojohnson', 'Wlqovcy2', 'Johnson', 'Olivia', '1946-04-06', '148 Church Street', 'Corvallis', 'OR', '97207', 'Olivia.Johnson@hotmail.com', '3436525011', '432702345', 'BL', 'F'),
		('awilliams', 'Napzvcw9', 'Williams', 'Ava', '1948-07-15', '424 Main Street North', 'Portland', 'OR', '97330', 'Ava.Williams@verizon.com', '2925570206', '982188874', 'AS', 'F'),
		('ijones', 'Tqnbmxx9', 'Jones', 'Isabella', '1949-03-16', '236 Main Street South', 'Portland', 'OR', '97330', 'Isabella.Jones@aol.com', '8272197787', '417490018', 'AI', 'F'),
		('sbrown', 'JjgilkH9', 'Brown', 'Sophia', '1949-09-17', '185 Elm Street', 'Corvallis', 'OR', '97207', 'Sophia.Brown@protonmail.com', '1777682443', '275367183', 'NH', 'F'),
		('mdavis', 'WjqysxR0', 'Davis', 'Mia', '1950-01-04', '171 High Street', 'Corvallis', 'OR', '97207', 'Mia.Davis@oregonstate.edu', '7763387454', '639337137', 'OT', 'F'),
		('cmiller', 'Bufjnb<9', 'Miller', 'Charlotte', '1956-01-31', '164 Main Street West', 'Portland', 'OR', '97330', 'Charlotte.Miller@comcast.net', '958776737', '501426217', 'WH', 'F'),
		('awilson', 'Xpsxhuf0', 'Wilson', 'Amelia', '1958-06-03', '164 Washington Street', 'Portland', 'OR', '97330', 'Amelia.Wilson@gmail.com', '9901512372', '278870059', 'BL', 'F'),
		('emoore', 'IynjbgK7', 'Moore', 'Evelyn', '1963-12-19', '161 Main Street East', 'Portland', 'OR', '97330', 'Evelyn.Moore@hotmail.com', '4945659844', '645141918', 'AS', 'F'),
		('ataylor', 'Lvzxkno9', 'Taylor', 'Abigail', '1964-08-03', '161 Park Avenue', 'Corvallis', 'OR', '97207', 'Abigail.Taylor@verizon.com', '453716561', '939769561', 'AI', 'F'),
		('handerson', 'TsncuhY6', 'Anderson', 'Harper', '1969-01-09', '157 Walnut Street', 'Corvallis', 'OR', '97207', 'Harper.Anderson@aol.com', '2605697318', '997721360', 'NH', 'F'),
		('ethomas', 'KepzxyP3', 'Thomas', 'Emily', '1974-02-15', '156 2nd Street', 'Corvallis', 'OR', '97207', 'Emily.Thomas@protonmail.com', '9160760646', '723999222', 'OT', 'F'),
		('ejackson', 'Pzqlkur6', 'Jackson', 'Elizabeth', '1978-04-11', '150 Chestnut Street', 'Portland', 'OR', '97330', 'Elizabeth.Jackson@oregonstate.edu', '7255617938', '731600292', 'WH', 'F'),
		('awhite', 'Oxpyjek2', 'White', 'Avery', '1979-09-27', '146 Maple Street', 'Portland', 'OR', '97330', 'Avery.White@comcast.net', '5249955633', '417452259', 'BL', 'F'),
		('sharris', 'CwzypoU9', 'Harris', 'Sofia', '1980-11-15', '142 Maple Avenue', 'Corvallis', 'OR', '97207', 'Sofia.Harris@gmail.com', '2819651930', '330370093', 'AS', 'F'),
		('emartin', 'Hixshp?1', 'Martin', 'Ella', '1983-01-05', '138 Broad Street', 'Portland', 'OR', '97330', 'Ella.Martin@hotmail.com', '3661997101', '574426125', 'AI', 'F'),
		('mthompson', 'UiaosoZ8', 'Thompson', 'Madison', '1983-07-17', '135 Oak Street', 'Portland', 'OR', '97330', 'Madison.Thompson@verizon.com', '7778060656', '352977035', 'NH', 'F'),
		('sgarcia', 'Htwdws<3', 'Garcia', 'Scarlett', '1984-10-31', '132 Center Street', 'Corvallis', 'OR', '97207', 'Scarlett.Garcia@aol.com', '1843859930', '915895731', 'OT', 'F'),
		('vmartinez', 'Uwbvip[6', 'Martinez', 'Victoria', '1985-01-03', '128 Pine Street', 'Corvallis', 'OR', '97207', 'Victoria.Martinez@protonmail.com', '3168013561', '869708741', 'WH', 'F'),
		('arobinson', 'Zdyvlr@2', 'Robinson', 'Aria', '1986-12-02', '125 River Road', 'Portland', 'OR', '97330', 'Aria.Robinson@oregonstate.edu', '5591777405', '480535709', 'BL', 'F'),
		('gclark', 'Nwrgtg[2', 'Clark', 'Grace', '1987-11-11', '120 Market Street', 'Portland', 'OR', '97330', 'Grace.Clark@comcast.net', '4571649275', '437425902', 'AS', 'F'),
		('crodriguez', 'Sconoxd0', 'Rodriguez', 'Chloe', '1988-06-22', '119 Water Street', 'Portland', 'OR', '97330', 'Chloe.Rodriguez@gmail.com', '9817221278', '480688632', 'AI', 'F'),
		('clewis', 'MwqtzbH6', 'Lewis', 'Camila', '1995-05-24', '112 South Street', 'Corvallis', 'OR', '97207', 'Camila.Lewis@hotmail.com', '1900784208', '251465825', 'NH', 'F'),
		('plee', 'Wnczkt\5', 'Lee', 'Penelope', '1995-11-28', '112 Union Street', 'Corvallis', 'OR', '97207', 'Penelope.Lee@verizon.com', '23249661', '627411832', 'OT', 'F'),
		('rwalker', 'Fitfnt>4', 'Walker', 'Riley', '1996-01-31', '106 3rd Street', 'Corvallis', 'OR', '97207', 'Riley.Walker@aol.com', '5489210495', '826538074', 'WH', 'F'),
		('lhall', 'LtgfyxA2', 'Hall', 'Liam', '1941-01-06', '106 Park Street', 'Portland', 'OR', '97330', 'Liam.Hall@protonmail.com', '8473832043', '546431718', 'BL', 'M'),
		('nallen', 'BijlcnY9', 'Allen', 'Noah', '1941-04-24', '103 Cherry Street', 'Portland', 'OR', '97330', 'Noah.Allen@oregonstate.edu', '1808879684', '122836718', 'AS', 'M'),
		('wyoung', 'Gnxlhhu0', 'Young', 'William', '1943-04-16', '103 Washington Avenue', 'Corvallis', 'OR', '97207', 'William.Young@comcast.net', '8294334358', '820569746', 'AI', 'M'),
		('jhernandez', 'Qwczfol7', 'Hernandez', 'James', '1945-01-24', '101 4th Street', 'Portland', 'OR', '97330', 'James.Hernandez@gmail.com', '5564739346', '740105076', 'NH', 'M'),
		('lking', 'Pljmrdl9', 'King', 'Logan', '1948-02-13', '101 Court Street', 'Portland', 'OR', '97330', 'Logan.King@hotmail.com', '1736306910', '431594847', 'OT', 'M'),
		('bwright', 'HgfhakF2', 'Wright', 'Benjamin', '1948-05-13', '100 Highland Avenue', 'Corvallis', 'OR', '97207', 'Benjamin.Wright@verizon.com', '8410541559', '143899717', 'WH', 'M'),
		('mlopez', 'Xxlmyzi2', 'Lopez', 'Mason', '1948-12-10', '100 North Street', 'Corvallis', 'OR', '97207', 'Mason.Lopez@aol.com', '6928411360', '396044061', 'BL', 'M'),
		('ehill', 'Cpkpcuk6', 'Hill', 'Elijah', '1950-09-09', '99 Mill Street', 'Portland', 'OR', '97330', 'Elijah.Hill@protonmail.com', '7583280337', '819154147', 'AS', 'M'),
		('oscott', 'JttitnI9', 'Scott', 'Oliver', '1952-12-06', '98 Franklin Street', 'Portland', 'OR', '97330', 'Oliver.Scott@oregonstate.edu', '716697805', '546638296', 'AI', 'M'),
		('jgreen', 'Jdutbqe9', 'Green', 'Jacob', '1953-04-16', '96 Prospect Street', 'Portland', 'OR', '97330', 'Jacob.Green@comcast.net', '5024161800', '530069852', 'NH', 'M'),
		('ladams', 'Ttbtse\3', 'Adams', 'Lucas', '1953-10-25', '95 School Street', 'Corvallis', 'OR', '97207', 'Lucas.Adams@gmail.com', '664031071', '444593977', 'OT', 'M'),
		('mbaker', 'Xcstnj[1', 'Baker', 'Michael', '1954-11-29', '94 Spring Street', 'Corvallis', 'OR', '97207', 'Michael.Baker@hotmail.com', '2666919502', '285935843', 'WH', 'M'),
		('agonzalez', 'Pdsvbcb5', 'Gonzalez', 'Alexander', '1957-01-15', '93 Central Avenue', 'Corvallis', 'OR', '97207', 'Alexander.Gonzalez@verizon.com', '8015390383', '989537480', 'BL', 'M'),
		('enelson', 'Cwleom=2', 'Nelson', 'Ethan', '1965-03-17', '92 1st Street', 'Portland', 'OR', '97330', 'Ethan.Nelson@aol.com', '2747184712', '739528315', 'AS', 'M'),
		('dcarter', 'WgtzwcG7', 'Carter', 'Daniel', '1969-07-06', '90 State Street', 'Portland', 'OR', '97330', 'Daniel.Carter@protonmail.com', '1511848591', '719446643', 'AI', 'M'),
		('mmitchell', 'RjepzbQ6', 'Mitchell', 'Matthew', '1970-05-04', '88 Front Street', 'Corvallis', 'OR', '97207', 'Matthew.Mitchell@oregonstate.edu', '866685709', '976300337', 'NH', 'M'),
		('aperez', 'Pwgtuwr0', 'Perez', 'Aiden', '1972-04-07', '87 West Street', 'Portland', 'OR', '97330', 'Aiden.Perez@comcast.net', '143330000', '444168547', 'OT', 'M'),
		('hroberts', 'Cvjxesy7', 'Roberts', 'Henry', '1973-11-30', '85 Jefferson Street', 'Portland', 'OR', '97330', 'Henry.Roberts@gmail.com', '9902054368', '951951234', 'WH', 'M'),
		('jturner', 'Tawesac1', 'Turner', 'Joseph', '1974-12-10', '83 Cedar Street', 'Corvallis', 'OR', '97207', 'Joseph.Turner@hotmail.com', '8030156479', '471947573', 'BL', 'M'),
		('jphillips', 'Zkogrvd5', 'Phillips', 'Jackson', '1977-02-01', '81 Jackson Street', 'Corvallis', 'OR', '97207', 'Jackson.Phillips@verizon.com', '5565243594', '646248474', 'AS', 'M'),
		('scampbell', 'FdavirI0', 'Campbell', 'Samuel', '1977-05-20', '79 Park Place', 'Portland', 'OR', '97330', 'Samuel.Campbell@aol.com', '614878146', '920419063', 'AI', 'M'),
		('sparker', 'Pgrbzms3', 'Parker', 'Sebastian', '1978-03-30', '77 Bridge Street', 'Portland', 'OR', '97330', 'Sebastian.Parker@protonmail.com', '7327520253', '121823536', 'NH', 'M'),
		('devans', 'Njjfkx_1', 'Evans', 'David', '1981-01-01', '77 Locust Street', 'Portland', 'OR', '97330', 'David.Evans@oregonstate.edu', '270299256', '822504956', 'OT', 'M'),
		('cedwards', 'HsjubcV8', 'Edwards', 'Carter', '1982-08-21', '76 Madison Avenue', 'Corvallis', 'OR', '97207', 'Carter.Edwards@comcast.net', '9118199834', '695111236', 'WH', 'M'),
		('wcollins', 'QchtcvR8', 'Collins', 'Wyatt', '1989-02-16', '228 Acme Drive', 'Corvallis', 'OR', '97207', 'Wyatt.Collins@gmail.com', '9680631490', '558225694', 'BL', 'M');





/***********************************************
	TABLE STRUCTURE FOR issue_data
***********************************************/
CREATE TABLE `issue_data` (
  	`issue_id` VARCHAR(4) NOT NULL,
  	`choice` INT(3) NOT NULL,
    `description` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*DATA FOR issue_data*/
INSERT INTO `issue_data` (`issue_id`, `choice`, `description`)
VALUES 	('001', '0', 'no'),
		('001', '1', 'yes'),
		('002', '0', 'no'),
		('002', '1', 'yes'),
		('003', '0', 'red'),
		('003', '1', 'blue'),
		('003', '2', 'green');


/***********************************************
	TABLE STRUCTURE FOR issue_data
***********************************************/
CREATE TABLE `issue_summary` (
	`issue_id` VARCHAR(4) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `district` INT(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*DATA FOR issue_summary*/
INSERT INTO `issue_summary` (`issue_id`,`description`,`district`)
VALUES 	('001','Raise property taxes','97207'),
		('002','Place term limit on council board members','97330'),
		('003','Color to paint new community center','97330');


/***********************************************
	TABLE STRUCTURE FOR vote_details
***********************************************/
CREATE TABLE `vote_details` (
  	`voter_id` INT(3) NOT NULL,
  	`issue_id` VARCHAR(4) NOT NULL,
  	`vote_choice` INT(3),
   	FOREIGN KEY (`voter_id`) REFERENCES `user_data` (`user_id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*DATA FOR vote_details*/
INSERT INTO `vote_details` (`voter_id`,`issue_id`,`vote_choice`)
VALUES 	('1', '001', '0'),
		('1', '002', '1'),
		('1', '003', '0'),
		('2', '001', '1'),
		('2', '002', '0'),
		('2', '003', '0'),
		('3', '001', '1'),
		('3', '002', '1'),
		('3', '003', '0'),
		('4', '001', '0'),
		('4', '002', '0'),
		('4', '003', '2'),
		('5', '001', '1'),
		('5', '002', '1'),
		('5', '003', '1'),
		('6', '001', '1'),
		('6', '002', '1'),
		('6', '003', '0'),
		('7', '001', '0'),
		('7', '002', '1'),
		('7', '003', '1'),
		('8', '001', '0'),
		('8', '002', '0'),
		('8', '003', '1'),
		('9', '001', '1'),
		('9', '002', '0'),
		('9', '003', '1'),
		('10', '001', '0'),
		('10', '002', '1'),
		('10', '003', '2'),
		('11', '001', '1'),
		('11', '002', '0'),
		('11', '003', '1'),
		('12', '001', '1'),
		('12', '002', '1'),
		('12', '003', '2'),
		('13', '001', '0'),
		('13', '002', '1'),
		('13', '003', '2'),
		('14', '001', '1'),
		('14', '002', '0'),
		('14', '003', '1'),
		('15', '001', '0'),
		('15', '002', '1'),
		('15', '003', '0'),
		('16', '001', '0'),
		('16', '002', '0'),
		('16', '003', '1'),
		('17', '001', '0'),
		('17', '002', '0'),
		('17', '003', '1'),
		('18', '001', '1'),
		('18', '002', '0'),
		('18', '003', '1'),
		('19', '001', '1'),
		('19', '002', '1'),
		('19', '003', '1'),
		('20', '001', '0'),
		('20', '002', '0'),
		('20', '003', '1'),
		('21', '001', '0'),
		('21', '002', '0'),
		('21', '003', '2'),
		('22', '001', '1'),
		('22', '002', '1'),
		('22', '003', '2'),
		('23', '001', '0'),
		('23', '002', '0'),
		('23', '003', '1'),
		('24', '001', '0'),
		('24', '002', '1'),
		('24', '003', '0'),
		('25', '001', '0'),
		('25', '002', '1'),
		('25', '003', '0'),
		('26', '001', '1'),
		('26', '002', '1'),
		('26', '003', '1'),
		('27', '001', '1'),
		('27', '002', '0'),
		('27', '003', '0'),
		('28', '001', '0'),
		('28', '002', '1'),
		('28', '003', '0'),
		('29', '001', '1'),
		('29', '002', '0'),
		('29', '003', '2'),
		('30', '001', '1'),
		('30', '002', '1'),
		('30', '003', '2'),
		('31', '001', '1'),
		('31', '002', '0'),
		('31', '003', '0'),
		('32', '001', '1'),
		('32', '002', '1'),
		('32', '003', '1'),
		('33', '001', '0'),
		('33', '002', '1'),
		('33', '003', '0'),
		('34', '001', '0'),
		('34', '002', '0'),
		('34', '003', '0'),
		('35', '001', '0'),
		('35', '002', '1'),
		('35', '003', '0'),
		('36', '001', '1'),
		('36', '002', '0'),
		('36', '003', '0'),
		('37', '001', '1'),
		('37', '002', '0'),
		('37', '003', '1'),
		('38', '001', '0'),
		('38', '002', '1'),
		('38', '003', '1'),
		('39', '001', '1'),
		('39', '002', '0'),
		('39', '003', '0'),
		('40', '001', '0'),
		('40', '002', '0'),
		('40', '003', '2'),
		('41', '001', '0'),
		('41', '002', '1'),
		('41', '003', '0'),
		('42', '001', '1'),
		('42', '002', '0'),
		('42', '003', '1'),
		('43', '001', '1'),
		('43', '002', '1'),
		('43', '003', '1'),
		('44', '001', '0'),
		('44', '002', '1'),
		('44', '003', '1'),
		('45', '001', '1'),
		('45', '002', '0'),
		('45', '003', '2'),
		('46', '001', '1'),
		('46', '002', '1'),
		('46', '003', '0'),
		('47', '001', '1'),
		('47', '002', '0'),
		('47', '003', '1'),
		('48', '001', '0'),
		('48', '002', '1'),
		('48', '003', '0'),
		('49', '001', '1'),
		('49', '002', '1'),
		('49', '003', '0'),
		('50', '001', '1'),
		('50', '002', '1'),
		('50', '003', '2');
