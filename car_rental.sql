-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2019 at 08:00 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--
CREATE DATABASE IF NOT EXISTS `car_rental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `car_rental`;

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

DROP TABLE IF EXISTS `additional_charges`;
CREATE TABLE `additional_charges` (
  `charges_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`charges_id`, `name`, `cost`) VALUES
(1, 'Late return', 100),
(2, 'Minor damage', 250),
(3, 'Major damage', 500),
(4, 'Empty fuel tank', 70);

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges_to_invoices`
--

DROP TABLE IF EXISTS `additional_charges_to_invoices`;
CREATE TABLE `additional_charges_to_invoices` (
  `aci_id` int(11) NOT NULL,
  `fk_charges_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges_to_invoices`
--

INSERT INTO `additional_charges_to_invoices` (`aci_id`, `fk_charges_id`, `fk_invoice_id`, `quantity`) VALUES
(1, 4, 3, 1),
(2, 2, 5, 1),
(3, 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `agency_branches`
--

DROP TABLE IF EXISTS `agency_branches`;
CREATE TABLE `agency_branches` (
  `branch_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency_branches`
--

INSERT INTO `agency_branches` (`branch_id`, `name`, `address`, `phone_number`, `opening_time`, `closing_time`) VALUES
(1, 'Rent-A-Car Stephansplatz', 'Rotenturmstrasse 49 1010 Vienna', 1234567, '09:30:00', '19:00:00'),
(2, 'Rent-A-Car DonauCity', 'Donau-City-Straße 2 1220 Vienna', 1233367, '09:30:00', '19:00:00'),
(3, 'Rent-A-Car Vienna International Airport', 'Parkhaus 4, 1300 Schwechat', 1933367, '05:00:00', '23:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
CREATE TABLE `credit_cards` (
  `card_id` int(11) NOT NULL,
  `card_type` enum('Visa','Mastercard','American Express','Diners') DEFAULT NULL,
  `card_number` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credit_cards`
--

INSERT INTO `credit_cards` (`card_id`, `card_type`, `card_number`, `expire_date`, `fk_customer_id`) VALUES
(1, 'Visa', 1667, '2020-03-04', 1),
(2, 'Mastercard', 1227, '2020-09-01', 2),
(3, 'American Express', 1927, '2020-10-01', 3),
(4, 'Visa', 1957, '2020-11-01', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `drivers_license_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `age`, `phone_number`, `address`, `email`, `drivers_license_nr`) VALUES
(1, 'Valentina', 'Panetta', 27, 111234789, 'Mariahilferstrasse 39 1060 Vienna', 'valentina@gmail.com', 789392),
(2, 'Mary', 'Cherry', 23, 111212789, 'Zentagasse 19 1050 Vienna', 'merrycherry@gmail.com', 6661392),
(3, 'Bobby', 'Hill', 29, 111212339, 'Praterstern 1 1020 Vienna', 'bobbyhill@gmail.com', 6621392),
(4, 'Nancy', 'Wheeler', 21, 112212339, 'Kärnterstraße 12 1010 Vienna', 'nwheeler@gmail.com', 6621312);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_branch_id` int(11) DEFAULT NULL,
  `fk_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `fk_branch_id`, `fk_role_id`) VALUES
(1, 'Vanessa', 'Mateo', 1, 1),
(2, 'Rupaul', 'Charles', 1, 2),
(3, 'Carlo', 'Conti', 1, 4),
(4, 'Kennedy', 'Davenport', 1, 4),
(5, 'Charles', 'Devayne', 1, 4),
(6, 'Katya', 'Zamo', 2, 1),
(7, 'Peggy', 'Hill', 2, 2),
(8, 'Mario', 'Rossi', 2, 4),
(9, 'Jasmine', 'Masters', 2, 4),
(10, 'Noah', 'Offence', 2, 4),
(11, 'Hank', 'Hill', 3, 1),
(12, 'Dale', 'Gribble', 3, 2),
(13, 'Bill', 'Dauterive', 3, 3),
(14, 'Johannes', 'Müller', 3, 4),
(15, 'Andrew', 'Byrne', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `rental_start` date DEFAULT NULL,
  `rental_end` date DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `grand_total`, `rental_start`, `rental_end`, `date_of_issue`, `fk_reservation_id`, `fk_employee_id`) VALUES
(1, 300, '2019-06-12', '2019-06-15', '2019-06-15', 1, 15),
(2, 100, '2019-08-19', '2019-08-20', '2019-08-20', 1, 14),
(3, 100, '2019-12-12', '2019-12-13', '2019-12-13', 2, 9),
(4, 300, '2019-07-12', '2019-07-15', '2019-07-15', 3, 3),
(5, 1000, '2019-11-01', '2019-11-10', '2019-11-10', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `loc_id` int(11) NOT NULL,
  `pickUpAddress` varchar(55) DEFAULT NULL,
  `dropOffAddress` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loc_id`, `pickUpAddress`, `dropOffAddress`) VALUES
(1, 'MariahilferStrasse Parkhaus', 'Stephansplatz Parkhaus'),
(2, 'Donauinsel Parkhaus', 'Meidling Parkhaus'),
(3, 'Praterstern Parkhaus', 'Landstraße Parkhaus');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_services`
--

DROP TABLE IF EXISTS `maintenance_services`;
CREATE TABLE `maintenance_services` (
  `maintenance_id` int(11) NOT NULL,
  `date_of_maintenance` date DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `report` text,
  `maintenance_cost` int(11) DEFAULT NULL,
  `fk_vehicle_id` int(11) DEFAULT NULL,
  `fk_workshop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance_services`
--

INSERT INTO `maintenance_services` (`maintenance_id`, `date_of_maintenance`, `mileage`, `report`, `maintenance_cost`, `fk_vehicle_id`, `fk_workshop_id`) VALUES
(17, '2019-05-09', 90000, 'Tire change, oil change, brake service', 300, 1, 1),
(18, '2019-04-09', 120000, 'Tire change, oil change, brake service', 500, 2, 2),
(19, '2019-04-11', 150000, 'Tire change, oil change, brake service', 500, 3, 3),
(20, '2019-03-09', 200000, 'Oil change, brake service', 350, 4, 2),
(21, '2019-09-09', 250000, 'Tire change, oil change, brake service', 450, 5, 3),
(22, '2019-09-12', 150000, 'Tire change, oil change, brake service', 250, 6, 2),
(23, '2019-03-09', 290000, 'Tire change, brake service', 300, 7, 2),
(24, '2019-09-12', 90000, 'Tire change, oil change, brake service', 500, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `deposit` int(11) DEFAULT NULL,
  `rental_fee` int(11) DEFAULT NULL,
  `rental_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_vehicle_id` int(11) DEFAULT NULL,
  `fk_loc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `deposit`, `rental_fee`, `rental_date`, `return_date`, `fk_customer_id`, `fk_vehicle_id`, `fk_loc_id`) VALUES
(1, 200, 100, '2019-06-12', '2019-06-15', 1, 6, 1),
(2, 200, 100, '2019-08-19', '2019-06-20', 1, 7, 1),
(3, 200, 100, '2019-12-12', '2019-12-13', 2, 8, 2),
(4, 200, 100, '2019-06-12', '2019-06-15', 3, 9, 3),
(5, 200, 100, '2019-11-01', '2019-11-10', 4, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `salary`) VALUES
(1, 'Manager', 3000),
(2, 'Assistant-Manager', 2000),
(3, 'Supervisor', 1800),
(4, 'Clerk', 1400);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_type` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fuel_type` enum('Diesel','Gasoline','Ethanol','Bio-Diesel') DEFAULT NULL,
  `current_mileage` int(11) DEFAULT NULL,
  `gearbox_type` enum('Automatic','Manual') DEFAULT NULL,
  `fk_branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_type`, `model`, `capacity`, `fuel_type`, `current_mileage`, `gearbox_type`, `fk_branch_id`) VALUES
(1, 'Van', 'Volkswagen Transporter', 8, 'Diesel', 100000, 'Manual', 1),
(2, 'Van', 'Volkswagen Transporter', 8, 'Diesel', 150000, 'Manual', 2),
(3, 'Van', 'Volkswagen Transporter', 8, 'Diesel', 180000, 'Manual', 3),
(4, 'Car', 'Volkswagen Golf', 5, 'Gasoline', 500000, 'Automatic', 1),
(5, 'Car', 'Toyota Auris', 5, 'Gasoline', 280000, 'Manual', 2),
(6, 'Car', 'Toyota Yaris', 5, 'Bio-Diesel', 200000, 'Automatic', 3),
(7, 'Car', 'Opel Zafira', 5, 'Bio-Diesel', 3000000, 'Manual', 1),
(8, 'Car', 'Mini Cooper', 5, 'Diesel', 230000, 'Manual', 2),
(9, 'Car', 'Fiat Punto', 5, 'Ethanol', 100000, 'Manual', 3);

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

DROP TABLE IF EXISTS `workshops`;
CREATE TABLE `workshops` (
  `workshop_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workshops`
--

INSERT INTO `workshops` (`workshop_id`, `name`, `address`, `phone_number`) VALUES
(1, 'Euromaster', 'Triester Str. 131, 2512 Traiskirchen', 2147483647),
(2, 'KMH car workshop', 'Dassanowskyweg 12, 1220 Vienna', 2147483647),
(3, 'PALA & CO MOTORS', 'Leberstrasse 118, 1110 Vienna', 431252071);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`charges_id`);

--
-- Indexes for table `additional_charges_to_invoices`
--
ALTER TABLE `additional_charges_to_invoices`
  ADD PRIMARY KEY (`aci_id`),
  ADD KEY `fk_charges_id` (`fk_charges_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `agency_branches`
--
ALTER TABLE `agency_branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_branch_id` (`fk_branch_id`),
  ADD KEY `fk_role_id` (`fk_role_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `fk_vehicle_id` (`fk_vehicle_id`),
  ADD KEY `fk_workshop_id` (`fk_workshop_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_vehicle_id` (`fk_vehicle_id`),
  ADD KEY `fk_loc_id` (`fk_loc_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `fk_branch_id` (`fk_branch_id`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`workshop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `charges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `additional_charges_to_invoices`
--
ALTER TABLE `additional_charges_to_invoices`
  MODIFY `aci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agency_branches`
--
ALTER TABLE `agency_branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges_to_invoices`
--
ALTER TABLE `additional_charges_to_invoices`
  ADD CONSTRAINT `additional_charges_to_invoices_ibfk_1` FOREIGN KEY (`fk_charges_id`) REFERENCES `additional_charges` (`charges_id`),
  ADD CONSTRAINT `additional_charges_to_invoices_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Constraints for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD CONSTRAINT `credit_cards_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_branch_id`) REFERENCES `agency_branches` (`branch_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`fk_role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  ADD CONSTRAINT `maintenance_services_ibfk_1` FOREIGN KEY (`fk_vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  ADD CONSTRAINT `maintenance_services_ibfk_2` FOREIGN KEY (`fk_workshop_id`) REFERENCES `workshops` (`workshop_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`fk_vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`fk_loc_id`) REFERENCES `locations` (`loc_id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`fk_branch_id`) REFERENCES `agency_branches` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
