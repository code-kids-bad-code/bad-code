/* DROP schema */

drop database if exists onlinegreivancemanagementsystem;

/*Create TABLE IF NOT EXISTS */

CREATE DATABASE  IF NOT EXISTS `onlinegreivancemanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onlinegreivancemanagementsystem`;


/* User Table */

CREATE TABLE IF NOT EXISTS `users` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`username` varchar(255) UNIQUE NOT NULL,
	`password` varchar(255) NOT NULL,
	`roles` varchar(255) NOT NULL,
	`email` varchar(255) UNIQUE NOT NULL,
	`remember_token` varchar(255),
	`created_at` TIMESTAMP,
	`updated_at` TIMESTAMP


);

/*  UNIVERSITY Table */

CREATE TABLE IF NOT EXISTS `table_university` (
	`id` integer (255)  AUTO_INCREMENT,
	`name` varchar (255),
	`region` varchar (255),
	`location` varchar (255),
	`upoc` varchar (255),
	`phone` int (10),
	`logo` varchar (255),
	`registration_status` int (1),
	`created_at` TIMESTAMP,
	`updated_at` TIMESTAMP,
	PRIMARY KEY (id)
);


/*  College Table */

CREATE TABLE IF NOT EXISTS `table_college` (
	`id` integer (255) AUTO_INCREMENT,
	`university_id` integer,
	`name` varchar (255),
	`region` varchar (255),
	`location` varchar (255),
	`cpoc` varchar (255),
	`phone` int (10),
	`logo` varchar (255),
	`registration_status` int (1),
	`created_at` TIMESTAMP,
	`updated_at` TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (university_id) REFERENCES table_university(id)
);

/*  Department Table */

CREATE TABLE IF NOT EXISTS `table_department` (
	`id` integer (255) AUTO_INCREMENT,
	`college_id` integer,
	`description` varchar (255),
	`name` varchar (255),
	`logo` varchar (255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`created_by` varchar (255),
	 PRIMARY KEY (id),
	FOREIGN KEY (college_id) REFERENCES table_college(id)
);





/*  AICTE USER */

CREATE TABLE IF NOT EXISTS `user_aicte` (
	`id` integer(255) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`profile_picture` varchar(255),
	`last_login` timestamp DEFAULT CURRENT_TIMESTAMP,
	`phone` int(10),
	`reset_token` varchar(255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`remember_token` varchar(255),
	PRIMARY KEY (id)
);

/* Ombudsman Table */

CREATE TABLE IF NOT EXISTS `user_ombudsman` (
	`id` integer(255) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL UNIQUE,
	`name` varchar(255),
	`password` varchar(255) NOT NULL,
	`profile_picture` varchar(255),
	`last_login` timestamp DEFAULT CURRENT_TIMESTAMP,
	`phone` int(10),
	`university_id` integer,
	`registration_status` int(1),
	`reset_token` varchar(255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`authorization_token` varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (university_id) REFERENCES table_university(id)
);

/* Principal Table */

CREATE TABLE IF NOT EXISTS `user_principal` (
	`id` integer(255) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`name` varchar(255),
	`profile_picture` varchar(255),
	`last_login` timestamp DEFAULT CURRENT_TIMESTAMP,
	`phone` int(10),
	`university_id` integer,
	`college_id` integer NOT NULL,
	`registration_status` int(1),
	`reset_token` varchar(255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`authorization_token` varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (college_id) REFERENCES table_college(id),
	FOREIGN KEY (university_id) REFERENCES table_university(id)
);

/* Committe Member Table */

CREATE TABLE IF NOT EXISTS `user_committee_member` (
	`id` integer(255) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`profile_picture` varchar(255),
	`name` varchar(255),
	`last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`phone` int(10),
	`created_by` integer NOT NULL,
	`department_id` integer  NOT NULL,
	`registration_status` int(1),
	`reset_token` varchar(255),
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`authorization_token` varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (created_by) REFERENCES user_principal(id),
	FOREIGN KEY (department_id) REFERENCES table_department(id)
);

/* Student Table */

CREATE TABLE IF NOT EXISTS`user_student` (
	`id` integer(255) PRIMARY KEY AUTO_INCREMENT,
	`email` varchar(255) UNIQUE NOT NULL,
	`username` varchar(255) NOT NULL UNIQUE,
	`password` varchar (255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`profile_picture` varchar (255),
	`last_login` timestamp NOT NULL,
	`college_id` integer NOT NULL,
	`university_id` integer NOT NULL,
	`branch` varchar (255),
	`registration_number` varchar(255),
	`reset_token` varchar (255),
	`course` varchar (255),
	`year` int (2),
	`registration_status` int (1),
	`authorization_token` varchar (255),
	 FOREIGN KEY (college_id) REFERENCES table_college(id),
	 FOREIGN KEY (university_id) REFERENCES table_university(id)
);


/* Link Generation Table */

CREATE TABLE IF NOT EXISTS `table_link` (
	`email` varchar (255),
	`registration_token` varchar (255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (email)
);


/* Grievance Table */

CREATE TABLE IF NOT EXISTS `table_grievance` (
	`id` integer (255) AUTO_INCREMENT,
	`subject` varchar (255) NOT NULL,
	`description` varchar (255) NOT NULL,
	`documents` varchar (255),
	`student_id` integer NOT NULL,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`department_id` varchar (255),
	`priority` varchar (10),
	PRIMARY KEY (`id`),
	FOREIGN KEY (`student_id`) REFERENCES user_student(id)
);

 /* Grievance status table */
 
CREATE TABLE IF NOT EXISTS `table_grievance_status` (
	`id` integer (255) AUTO_INCREMENT,
	`grievance_id` integer NOT NULL,
	`status` varchar(255) NOT NULL,
	`eta` varchar(255),
	`level` int,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (grievance_id) REFERENCES table_grievance(`id`)
);


/* COMMENT Table */

CREATE TABLE IF NOT EXISTS `table_comment` (
	`id` integer(255) AUTO_INCREMENT,
	`grievance_id` integer,
	`read_status` int (1),
	`author` varchar (255),
	`comment` varchar(255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`grievance_id`) REFERENCES table_grievance(`id`)
);

/* Message Table */

CREATE TABLE IF NOT EXISTS `table_message` (
	`id` integer(255) PRIMARY KEY AUTO_INCREMENT,
	`grievance_id` integer NOT NULL,
	`sender` varchar (255) NOT NULL,
	`receiver` varchar (255) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`read_status` int(1),
	`message` varchar (255),
	FOREIGN KEY (`grievance_id`) REFERENCES table_grievance(`id`)
);


/* AICTE Announcement */

CREATE TABLE IF NOT EXISTS `table_aicte_announcement` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`aicte_user_id` integer NOT NULL,
	`description` varchar (255) NOT NULL,
	`file` varchar (255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`aicte_user_id`) REFERENCES user_aicte(`id`)
);



/* Ombudsman Announcement */

CREATE TABLE IF NOT EXISTS `table_ombudsman_announcement` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`ombudsman_user_id` integer NOT NULL,
	`description` varchar (255) NOT NULL,
	`file` varchar (255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`ombudsman_user_id`) REFERENCES user_ombudsman(`id`)
);


/* Principal Announcement */

CREATE TABLE IF NOT EXISTS `table_principal_announcement` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`principal_user_id` integer (255) NOT NULL,
	`description` varchar (255) NOT NULL,
	`file` varchar (255),
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`principal_user_id`) REFERENCES user_principal(`id`)
);

/* GUIDLINES Table */

 CREATE TABLE IF NOT EXISTS `table_guidlines` (
	`id` integer(255) AUTO_INCREMENT,
	`given_by` varchar(255) NOT NULL,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`subject` varchar(255) NOT NULL,
	`guidlines` varchar(255) NOT NULL,
	`documents` varchar(255) NOT NULL,
	`read_status` int (1) DEFAULT 0,
	PRIMARY KEY(`id`)
);

/* feedback Table */

CREATE TABLE IF NOT EXISTS `table_feedback` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`grievance_id` integer,
	`given_by` VARCHAR (255),
	`given_to` VARCHAR (255),
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`rating` int,
	`comment` varchar (255),
	FOREIGN KEY (`grievance_id`) REFERENCES table_grievance(`id`)
);

/* Complaint Table */



/* FAQ Table */

CREATE TABLE IF NOT EXISTS `table_faq` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`question` varchar (255) NOT NULL,
	`answer` varchar (255) NOT NULL,
	`user_id` varchar (255) NOT NULL,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);
/* Complaint Table */

CREATE TABLE IF NOT EXISTS `table_complaint` (
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT, 
	`given_by` varchar (255) NOT NULL,
	`subject` varchar (255) NOT NULL,
	`description` varchar (255) NOT NULL,
	`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
	`read_status` int (1)
);


/* search table */


CREATE TABLE IF NOT EXISTS `table_search`(
	`id` integer (255) PRIMARY KEY AUTO_INCREMENT,
	`query` varchar (255) NOT NULL,
	`search_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`username` varchar(255) NOT NULL
);