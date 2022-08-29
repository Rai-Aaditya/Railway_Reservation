-> phpMyAdmin SQL Dump
-> http://www.phpmyadmin.net
-> Host: 127.0.0.1
-> Generation Time: Aug 29, 2022 at 11:47 PM


SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



-> Database: `railway`


-> Table structure for table `passengers`


CREATE TABLE IF NOT EXISTS `passengers` (
  `p_id` int(30) NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(30) DEFAULT NULL,
  `p_lname` varchar(30) DEFAULT NULL,
  `p_age` varchar(30) DEFAULT NULL,
  `p_contact` varchar(20) DEFAULT NULL,
  `p_gender` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `t_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_id` (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;


-> Dumping data for table `passengers`

INSERT INTO `passengers` (`p_id`, `p_fname`, `p_lname`, `p_age`, `p_contact`, `p_gender`, `email`, `password`, `t_no`) VALUES 
(1, 'Aditya', 'Singh', '42', '9090909090', 'Male', 'aditya@gmail.com', '123123123', 16205),
(2, 'Rahul', 'Jha', '29', '1010101010', 'Male', 'qwe@gmail.com', '123123123', NULL),
(3, 'sumit', 'sharma', '20', '9999999999', 'Male', 'sharma@gmail.com', '123123123', 12951),
(4, 'dhruv', 'mehta', '20', '9191919191', 'Male', 'dhruv@gmail.com', '123123123', 16205);



-> Table structure for table `station`


CREATE TABLE IF NOT EXISTS `station` (
  `s_no` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(20) DEFAULT NULL,
  `s_no_of_platforms` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


-> Dumping data for table `station`


INSERT INTO `station` (`s_no`, `s_name`, `s_no_of_platforms`) VALUES
(1, 'borivali', '8'),
(2, 'Baroda', '6'),
(3, 'Surat', '4');



-> Table structure for table `tickets`


CREATE TABLE IF NOT EXISTS `tickets` (
  `PNR` decimal(10,0) NOT NULL,
  `t_status` varchar(20) NOT NULL DEFAULT 'Waiting',
  `t_fare` int(11) DEFAULT NULL,
  `p_id` int(20) NOT NULL,
  UNIQUE KEY `PNR` (`PNR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-> Dumping data for table `tickets`


INSERT INTO `tickets` (`PNR`, `t_status`, `t_fare`, `p_id`) VALUES
(8056124359, 'Confirmed', 650, 5),
(8851599875, 'Waiting', 540, 1);



-> Table structure for table `trains`


CREATE TABLE IF NOT EXISTS `trains` (
  `t_no` decimal(5,0) NOT NULL,
  `t_name` varchar(30) DEFAULT NULL,
  `t_source` varchar(30) DEFAULT NULL,
  `t_destination` varchar(30) DEFAULT NULL,
  `t_type` varchar(30) DEFAULT NULL,
  `t_status` varchar(20) DEFAULT 'On time',
  `no_of_seats` int(11) DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-> Dumping data for table `trains`


INSERT INTO `trains` (`t_no`, `t_name`, `t_source`, `t_destination`, `t_type`, `t_status`, `no_of_seats`, `t_duration`) VALUES
(4971, 'garibrath', 'Udaipurr', 'Jammu Tawi', 'Express', 'On time', 550, 20),
(12284, 'duronto', 'Mumbai central', 'Ernakulum', 'AC superfast', 'On time', 800, 24),
(12859, 'geetanjali', 'CST', 'Kolkata', 'express', 'On time', 500, 25),
(12951, 'rajdhani', 'Mumbai Central', 'Delhi', 'Superfast', 'On time', 700, 15),
(16205, 'mysoreexp', 'Talguppa', 'Mysore JN', 'Express', 'On time', 475, 21);
