CREATE SCHEMA IF NOT EXISTS `humanresources` DEFAULT CHARACTER
SET
    utf8mb4;

USE `humanresources`;

SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------
--
-- Table structure for table `countries`
--
CREATE TABLE
    IF NOT EXISTS `countries` (
        `COUNTRY_ID` varchar(2) NOT NULL,
        `COUNTRY_NAME` varchar(40) DEFAULT NULL,
        `REGION_ID` decimal(10, 0) DEFAULT NULL,
        PRIMARY KEY (`COUNTRY_ID`),
        KEY `COUNTR_REG_FK` (`REGION_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `departments`
--
CREATE TABLE
    IF NOT EXISTS `departments` (
        `DEPARTMENT_ID` decimal(4, 0) NOT NULL DEFAULT '0',
        `DEPARTMENT_NAME` varchar(30) NOT NULL,
        `MANAGER_ID` decimal(6, 0) DEFAULT NULL,
        `LOCATION_ID` decimal(4, 0) DEFAULT NULL,
        PRIMARY KEY (`DEPARTMENT_ID`),
        KEY `DEPT_MGR_FK` (`MANAGER_ID`),
        KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `employees`
--
CREATE TABLE
    IF NOT EXISTS `employees` (
        `EMPLOYEE_ID` decimal(6, 0) NOT NULL DEFAULT '0',
        `FIRST_NAME` varchar(20) DEFAULT NULL,
        `LAST_NAME` varchar(25) NOT NULL,
        `EMAIL` varchar(25) NOT NULL,
        `PHONE_NUMBER` varchar(20) DEFAULT NULL,
        `HIRE_DATE` date NOT NULL,
        `JOB_ID` varchar(10) NOT NULL,
        `SALARY` decimal(8, 2) DEFAULT NULL,
        `COMMISSION_PCT` decimal(2, 2) DEFAULT NULL,
        `MANAGER_ID` decimal(6, 0) DEFAULT NULL,
        `DEPARTMENT_ID` decimal(4, 0) DEFAULT NULL,
        PRIMARY KEY (`EMPLOYEE_ID`),
        UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
        KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
        KEY `EMP_JOB_IX` (`JOB_ID`),
        KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
        KEY `EMP_NAME_IX` (`LAST_NAME`, `FIRST_NAME`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `job_history`
--
CREATE TABLE
    IF NOT EXISTS `job_history` (
        `EMPLOYEE_ID` decimal(6, 0) NOT NULL,
        `START_DATE` date NOT NULL,
        `END_DATE` date NOT NULL,
        `JOB_ID` varchar(10) NOT NULL,
        `DEPARTMENT_ID` decimal(4, 0) DEFAULT NULL,
        PRIMARY KEY (`EMPLOYEE_ID`, `START_DATE`),
        KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
        KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
        KEY `JHIST_JOB_IX` (`JOB_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `jobs`
--
CREATE TABLE
    IF NOT EXISTS `jobs` (
        `JOB_ID` varchar(10) NOT NULL DEFAULT '',
        `JOB_TITLE` varchar(35) NOT NULL,
        `MIN_SALARY` decimal(6, 0) DEFAULT NULL,
        `MAX_SALARY` decimal(6, 0) DEFAULT NULL,
        PRIMARY KEY (`JOB_ID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `locations`
--
CREATE TABLE
    IF NOT EXISTS `locations` (
        `LOCATION_ID` decimal(4, 0) NOT NULL DEFAULT '0',
        `STREET_ADDRESS` varchar(40) DEFAULT NULL,
        `POSTAL_CODE` varchar(12) DEFAULT NULL,
        `CITY` varchar(30) NOT NULL,
        `STATE_PROVINCE` varchar(25) DEFAULT NULL,
        `COUNTRY_ID` varchar(2) DEFAULT NULL,
        PRIMARY KEY (`LOCATION_ID`),
        KEY `LOC_CITY_IX` (`CITY`),
        KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
        KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `regions`
--
CREATE TABLE
    IF NOT EXISTS `regions` (
        `REGION_ID` decimal(5, 0) NOT NULL,
        `REGION_NAME` varchar(25) DEFAULT NULL,
        PRIMARY KEY (`REGION_ID`),
        UNIQUE KEY `sss` (`REGION_NAME`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;