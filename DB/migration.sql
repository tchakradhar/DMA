-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2020 at 01:49 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `migration`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `hosturl` varchar(1000) NOT NULL,
  `port` varchar(200) NOT NULL,
  `warehouse` varchar(200) NOT NULL,
  `database_name` varchar(255) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `database_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `hosturl`, `port`, `warehouse`, `database_name`, `userid`, `password`, `database_id`, `type`) VALUES
(62, 'MSSQL1', 'localhost', '81', '', 'Test', 'demo', 'demo', 4, 'source'),
(69, 'ORA2', '202.62.76.104', '1521', '', 'demo', 'c2c', 'c2c', 3, 'source'),
(70, 'ORA1', 'localhost', '1521', '', 'demo', 'c2c', 'c2c', 3, 'source'),
(71, 'MySQL1', 'localhost', '3306', '', 'migration', 'root', 'mysql', 5, 'source'),
(72, 'SF', 'https://datasticians.snowflakecomputing.com', '81', 'DEMO_WH', 'TEST_DB', 'vagrawal', 'Snowflake1@', 6, 'target'),
(74, 'ORACLE', '202.62.76.104', '1521', '', 'demo', 'c2c', 'c2c', 3, ''),
(76, 'ORACLE1', '202.62.76.104', '1521', '', 'Test', 'test', 'test', 3, ''),
(77, 'Demo_Job ', 'test-sss.cmx3j5mpskak.us-east-1.redshift.amazonaws.com', '5439', '', 'demo', 'demo', 'demo', 1, ''),
(78, 'My_SQL_123', 'localhost', '3306', '', 'Mysql', 'root', '', 5, ''),
(81, 'Test', 'localhost', '3306', '', 'migration', 'root', '', 5, ''),
(82, 'Testreact', 'localhost', '3000', 'sample', 'sample', 'c42', 'c42', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `create_job`
--

CREATE TABLE `create_job` (
  `id` int(150) NOT NULL,
  `job_name` varchar(150) NOT NULL,
  `status` enum('process','completed','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `create_job`
--

INSERT INTO `create_job` (`id`, `job_name`, `status`) VALUES
(1, 'Sample', 'completed'),
(2, 'Sample', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `joblist`
--

CREATE TABLE `joblist` (
  `joblistid` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `s_connection` varchar(2000) NOT NULL,
  `s_conn` varchar(2000) NOT NULL,
  `s_db` varchar(2000) NOT NULL,
  `s_schema_l` varchar(10000) NOT NULL,
  `s_schema_r` varchar(10000) NOT NULL,
  `s_table_l` varchar(10000) NOT NULL,
  `s_table_r` varchar(10000) NOT NULL,
  `t_conn` varchar(2000) NOT NULL,
  `t_connection` varchar(255) NOT NULL,
  `t_database_name` varchar(200) NOT NULL,
  `t_db` varchar(2000) NOT NULL,
  `seleted_target` varchar(7000) NOT NULL,
  `t_schema` varchar(2000) NOT NULL,
  `t_table` varchar(255) NOT NULL,
  `j_name` varchar(2000) NOT NULL,
  `status` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joblist`
--

INSERT INTO `joblist` (`joblistid`, `job_id`, `s_connection`, `s_conn`, `s_db`, `s_schema_l`, `s_schema_r`, `s_table_l`, `s_table_r`, `t_conn`, `t_connection`, `t_database_name`, `t_db`, `seleted_target`, `t_schema`, `t_table`, `j_name`, `status`) VALUES
(40, 40, 'MYSQL', 'MySQL1', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"busbooking\",\"label\":\"busbooking\"},{\"id\":\"certificates\",\"label\":\"certificates\"},{\"id\":\"evencal\",\"label\":\"evencal\"},{\"id\":\"hotel\",\"label\":\"hotel\"},{\"id\":\"hotel_booking\",\"label\":\"hotel_booking\"},{\"id\":\"hotel_mgmt\",\"label\":\"hotel_mgmt\"},{\"id\":\"hotel_mgmt_sys\",\"label\":\"hotel_mgmt_sys\"},{\"id\":\"hotelmis\",\"label\":\"hotelmis\"},{\"id\":\"migration\",\"label\":\"migration\"},{\"id\":\"motherhospital\",\"label\":\"motherhospital\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"php_stock\",\"label\":\"php_stock\"},{\"id\":\"sales_exec\",\"label\":\"sales_exec\"},{\"id\":\"stichfix\",\"label\":\"stichfix\"},{\"id\":\"stitchfix\",\"label\":\"stitchfix\"},{\"id\":\"stock\",\"label\":\"stock\"},{\"id\":\"tieitdev_hms\",\"label\":\"tieitdev_hms\"},{\"id\":\"wordpress\",\"label\":\"wordpress\"}]', '[{\"id\":\"chat_app\",\"label\":\"chat_app\"},{\"id\":\"chat_realtime\",\"label\":\"chat_realtime\"},{\"id\":\"db_gym1\",\"label\":\"db_gym1\"},{\"id\":\"db_myasset\",\"label\":\"db_myasset\"},{\"id\":\"dbase\",\"label\":\"dbase\"},{\"id\":\"dbgym\",\"label\":\"dbgym\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"elms_new\",\"label\":\"elms_new\"}]', '[{\"id\":\"chat\",\"label\":\"chat_app.chat\"},{\"id\":\"chat_login_details\",\"label\":\"chat_app.chat_login_details\"},{\"id\":\"chat_users\",\"label\":\"chat_app.chat_users\"},{\"id\":\"tbl_deposit\",\"label\":\"db_gym1.tbl_deposit\"},{\"id\":\"tbl_email_config\",\"label\":\"db_gym1.tbl_email_config\"},{\"id\":\"tbl_enquiry\",\"label\":\"db_gym1.tbl_enquiry\"},{\"id\":\"tbl_expense\",\"label\":\"db_gym1.tbl_expense\"},{\"id\":\"tbl_group\",\"label\":\"db_gym1.tbl_group\"},{\"id\":\"tbl_membership\",\"label\":\"db_gym1.tbl_membership\"},{\"id\":\"tbl_permission\",\"label\":\"db_gym1.tbl_permission\"},{\"id\":\"tbl_permission_role\",\"label\":\"db_gym1.tbl_permission_role\"},{\"id\":\"tbl_sms_config\",\"label\":\"db_gym1.tbl_sms_config\"},{\"id\":\"tbl_subscription\",\"label\":\"db_gym1.tbl_subscription\"},{\"id\":\"tbl_assignments\",\"label\":\"db_myasset.tbl_assignments\"},{\"id\":\"tbl_categories\",\"label\":\"db_myasset.tbl_categories\"},{\"id\":\"tbl_depts\",\"label\":\"db_myasset.tbl_depts\"},{\"id\":\"tbl_hardwares\",\"label\":\"db_myasset.tbl_hardwares\"},{\"id\":\"tbl_softwares\",\"label\":\"db_myasset.tbl_softwares\"},{\"id\":\"tbl_users\",\"label\":\"db_myasset.tbl_users\"},{\"id\":\"tbl_vendors\",\"label\":\"db_myasset.tbl_vendors\"},{\"id\":\"admin_task\",\"label\":\"dbase.admin_task\"},{\"id\":\"group_title\",\"label\":\"dbase.group_title\"},{\"id\":\"info\",\"label\":\"dbase.info\"},{\"id\":\"messaging\",\"label\":\"dbase.messaging\"},{\"id\":\"networking\",\"label\":\"dbase.networking\"},{\"id\":\"resolve_telephone\",\"label\":\"dbase.resolve_telephone\"},{\"id\":\"sent_items\",\"label\":\"dbase.sent_items\"},{\"id\":\"server_maintenace\",\"label\":\"dbase.server_maintenace\"},{\"id\":\"task_list\",\"label\":\"dbase.task_list\"},{\"id\":\"user_profile\",\"label\":\"dbase.user_profile\"},{\"id\":\"auth_user\",\"label\":\"dbgym.auth_user\"},{\"id\":\"healthstatus\",\"label\":\"dbgym.healthstatus\"},{\"id\":\"mem_types\",\"label\":\"dbgym.mem_types\"},{\"id\":\"subsciption\",\"label\":\"dbgym.subsciption\"},{\"id\":\"time_table\",\"label\":\"dbgym.time_table\"},{\"id\":\"user_data\",\"label\":\"dbgym.user_data\"},{\"id\":\"announcements\",\"label\":\"elms.announcements\"},{\"id\":\"dashboard_images\",\"label\":\"elms.dashboard_images\"},{\"id\":\"employee_hcm\",\"label\":\"elms.employee_hcm\"},{\"id\":\"employee_new\",\"label\":\"elms.employee_new\"},{\"id\":\"leaves_new\",\"label\":\"elms.leaves_new\"},{\"id\":\"lop_details\",\"label\":\"elms.lop_details\"},{\"id\":\"tbl_notification\",\"label\":\"elms.tbl_notification\"},{\"id\":\"tbldepartments\",\"label\":\"elms.tbldepartments\"},{\"id\":\"tbldesignation\",\"label\":\"elms.tbldesignation\"},{\"id\":\"tblemployees\",\"label\":\"elms.tblemployees\"},{\"id\":\"tblleaves\",\"label\":\"elms.tblleaves\"},{\"id\":\"tblleavetype\",\"label\":\"elms.tblleavetype\"},{\"id\":\"tblpayslip_details\",\"label\":\"elms.tblpayslip_details\"},{\"id\":\"thought_day\",\"label\":\"elms.thought_day\"},{\"id\":\"uploads\",\"label\":\"elms.uploads\"},{\"id\":\"userlogs\",\"label\":\"elms.userlogs\"},{\"id\":\"usernames\",\"label\":\"elms.usernames\"},{\"id\":\"working_days\",\"label\":\"elms.working_days\"},{\"id\":\"announcements\",\"label\":\"elms_new.announcements\"},{\"id\":\"dashboard_images\",\"label\":\"elms_new.dashboard_images\"},{\"id\":\"emp_timesheet_tbl\",\"label\":\"elms_new.emp_timesheet_tbl\"},{\"id\":\"employee_new\",\"label\":\"elms_new.employee_new\"},{\"id\":\"group_relationship\",\"label\":\"elms_new.group_relationship\"},{\"id\":\"groups\",\"label\":\"elms_new.groups\"},{\"id\":\"leave_balance_tbl\",\"label\":\"elms_new.leave_balance_tbl\"},{\"id\":\"leave_details\",\"label\":\"elms_new.leave_details\"},{\"id\":\"leaves_new\",\"label\":\"elms_new.leaves_new\"},{\"id\":\"lop_details\",\"label\":\"elms_new.lop_details\"},{\"id\":\"project_tbl\",\"label\":\"elms_new.project_tbl\"},{\"id\":\"role_dept_tbl\",\"label\":\"elms_new.role_dept_tbl\"},{\"id\":\"roles_tbl\",\"label\":\"elms_new.roles_tbl\"},{\"id\":\"tbl_notification\",\"label\":\"elms_new.tbl_notification\"},{\"id\":\"tbldepartments\",\"label\":\"elms_new.tbldepartments\"},{\"id\":\"tbldesignation\",\"label\":\"elms_new.tbldesignation\"},{\"id\":\"tblemployees\",\"label\":\"elms_new.tblemployees\"},{\"id\":\"tblemployees1\",\"label\":\"elms_new.tblemployees1\"},{\"id\":\"tblleaves\",\"label\":\"elms_new.tblleaves\"},{\"id\":\"tblleavetype\",\"label\":\"elms_new.tblleavetype\"},{\"id\":\"tblpayslip_details\",\"label\":\"elms_new.tblpayslip_details\"},{\"id\":\"thought_day\",\"label\":\"elms_new.thought_day\"},{\"id\":\"uploads\",\"label\":\"elms_new.uploads\"},{\"id\":\"user_login\",\"label\":\"elms_new.user_login\"},{\"id\":\"userlogs\",\"label\":\"elms_new.userlogs\"},{\"id\":\"usernames\",\"label\":\"elms_new.usernames\"},{\"id\":\"working_days\",\"label\":\"elms_new.working_days\"}]', '[{\"id\":\"messages\",\"label\":\"chat_realtime.messages\"},{\"id\":\"users\",\"label\":\"chat_realtime.users\"},{\"id\":\"admin\",\"label\":\"db_gym1.admin\"},{\"id\":\"manage_website\",\"label\":\"db_gym1.manage_website\"},{\"id\":\"tbl_attendance\",\"label\":\"db_gym1.tbl_attendance\"},{\"id\":\"tbl_customer\",\"label\":\"db_gym1.tbl_customer\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"schema\":\"chat_realtime\",\"table\":\"messages\",\"listOfDataTypes\":[],\"id\":\"messages\",\"label\":\"chat_realtime.messages\"},{\"schema\":\"chat_realtime\",\"table\":\"users\",\"listOfDataTypes\":[],\"id\":\"users\",\"label\":\"chat_realtime.users\"},{\"schema\":\"db_gym1\",\"table\":\"admin\",\"listOfDataTypes\":[],\"id\":\"admin\",\"label\":\"db_gym1.admin\"},{\"schema\":\"db_gym1\",\"table\":\"manage_website\",\"listOfDataTypes\":[],\"id\":\"manage_website\",\"label\":\"db_gym1.manage_website\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_attendance\",\"listOfDataTypes\":[],\"id\":\"tbl_attendance\",\"label\":\"db_gym1.tbl_attendance\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_customer\",\"listOfDataTypes\":[],\"id\":\"tbl_customer\",\"label\":\"db_gym1.tbl_customer\"}]', 'PUBLIC', '', 'MYSQL', 'completed'),
(41, 41, 'MYSQL', 'MySQL1', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"busbooking\",\"label\":\"busbooking\"},{\"id\":\"certificates\",\"label\":\"certificates\"},{\"id\":\"chat_app\",\"label\":\"chat_app\"},{\"id\":\"chat_realtime\",\"label\":\"chat_realtime\"},{\"id\":\"evencal\",\"label\":\"evencal\"},{\"id\":\"hotel\",\"label\":\"hotel\"},{\"id\":\"hotel_booking\",\"label\":\"hotel_booking\"},{\"id\":\"hotel_mgmt\",\"label\":\"hotel_mgmt\"},{\"id\":\"hotel_mgmt_sys\",\"label\":\"hotel_mgmt_sys\"},{\"id\":\"hotelmis\",\"label\":\"hotelmis\"},{\"id\":\"migration\",\"label\":\"migration\"},{\"id\":\"motherhospital\",\"label\":\"motherhospital\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"php_stock\",\"label\":\"php_stock\"},{\"id\":\"sales_exec\",\"label\":\"sales_exec\"},{\"id\":\"stichfix\",\"label\":\"stichfix\"},{\"id\":\"stitchfix\",\"label\":\"stitchfix\"},{\"id\":\"stock\",\"label\":\"stock\"},{\"id\":\"tieitdev_hms\",\"label\":\"tieitdev_hms\"},{\"id\":\"wordpress\",\"label\":\"wordpress\"}]', '[{\"id\":\"db_gym1\",\"label\":\"db_gym1\"},{\"id\":\"db_myasset\",\"label\":\"db_myasset\"},{\"id\":\"dbase\",\"label\":\"dbase\"},{\"id\":\"dbgym\",\"label\":\"dbgym\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"elms_new\",\"label\":\"elms_new\"}]', '[{\"id\":\"admin\",\"label\":\"db_gym1.admin\"},{\"id\":\"manage_website\",\"label\":\"db_gym1.manage_website\"},{\"id\":\"tbl_attendance\",\"label\":\"db_gym1.tbl_attendance\"},{\"id\":\"tbl_customer\",\"label\":\"db_gym1.tbl_customer\"},{\"id\":\"tbl_subscription\",\"label\":\"db_gym1.tbl_subscription\"},{\"id\":\"tbl_assignments\",\"label\":\"db_myasset.tbl_assignments\"},{\"id\":\"tbl_categories\",\"label\":\"db_myasset.tbl_categories\"},{\"id\":\"tbl_depts\",\"label\":\"db_myasset.tbl_depts\"},{\"id\":\"tbl_hardwares\",\"label\":\"db_myasset.tbl_hardwares\"},{\"id\":\"tbl_softwares\",\"label\":\"db_myasset.tbl_softwares\"},{\"id\":\"tbl_users\",\"label\":\"db_myasset.tbl_users\"},{\"id\":\"tbl_vendors\",\"label\":\"db_myasset.tbl_vendors\"},{\"id\":\"admin_task\",\"label\":\"dbase.admin_task\"},{\"id\":\"group_title\",\"label\":\"dbase.group_title\"},{\"id\":\"info\",\"label\":\"dbase.info\"},{\"id\":\"messaging\",\"label\":\"dbase.messaging\"},{\"id\":\"networking\",\"label\":\"dbase.networking\"},{\"id\":\"resolve_telephone\",\"label\":\"dbase.resolve_telephone\"},{\"id\":\"sent_items\",\"label\":\"dbase.sent_items\"},{\"id\":\"server_maintenace\",\"label\":\"dbase.server_maintenace\"},{\"id\":\"task_list\",\"label\":\"dbase.task_list\"},{\"id\":\"user_profile\",\"label\":\"dbase.user_profile\"},{\"id\":\"auth_user\",\"label\":\"dbgym.auth_user\"},{\"id\":\"healthstatus\",\"label\":\"dbgym.healthstatus\"},{\"id\":\"mem_types\",\"label\":\"dbgym.mem_types\"},{\"id\":\"subsciption\",\"label\":\"dbgym.subsciption\"},{\"id\":\"time_table\",\"label\":\"dbgym.time_table\"},{\"id\":\"user_data\",\"label\":\"dbgym.user_data\"},{\"id\":\"admin\",\"label\":\"elms.admin\"},{\"id\":\"announcements\",\"label\":\"elms.announcements\"},{\"id\":\"dashboard_images\",\"label\":\"elms.dashboard_images\"},{\"id\":\"employee_hcm\",\"label\":\"elms.employee_hcm\"},{\"id\":\"employee_new\",\"label\":\"elms.employee_new\"},{\"id\":\"leaves_new\",\"label\":\"elms.leaves_new\"},{\"id\":\"lop_details\",\"label\":\"elms.lop_details\"},{\"id\":\"tbl_notification\",\"label\":\"elms.tbl_notification\"},{\"id\":\"tbldepartments\",\"label\":\"elms.tbldepartments\"},{\"id\":\"tbldesignation\",\"label\":\"elms.tbldesignation\"},{\"id\":\"tblemployees\",\"label\":\"elms.tblemployees\"},{\"id\":\"tblleaves\",\"label\":\"elms.tblleaves\"},{\"id\":\"tblleavetype\",\"label\":\"elms.tblleavetype\"},{\"id\":\"tblpayslip_details\",\"label\":\"elms.tblpayslip_details\"},{\"id\":\"thought_day\",\"label\":\"elms.thought_day\"},{\"id\":\"uploads\",\"label\":\"elms.uploads\"},{\"id\":\"userlogs\",\"label\":\"elms.userlogs\"},{\"id\":\"usernames\",\"label\":\"elms.usernames\"},{\"id\":\"working_days\",\"label\":\"elms.working_days\"},{\"id\":\"admin\",\"label\":\"elms_new.admin\"},{\"id\":\"announcements\",\"label\":\"elms_new.announcements\"},{\"id\":\"dashboard_images\",\"label\":\"elms_new.dashboard_images\"},{\"id\":\"emp_timesheet_tbl\",\"label\":\"elms_new.emp_timesheet_tbl\"},{\"id\":\"employee_new\",\"label\":\"elms_new.employee_new\"},{\"id\":\"group_relationship\",\"label\":\"elms_new.group_relationship\"},{\"id\":\"groups\",\"label\":\"elms_new.groups\"},{\"id\":\"leave_balance_tbl\",\"label\":\"elms_new.leave_balance_tbl\"},{\"id\":\"leave_details\",\"label\":\"elms_new.leave_details\"},{\"id\":\"leaves_new\",\"label\":\"elms_new.leaves_new\"},{\"id\":\"lop_details\",\"label\":\"elms_new.lop_details\"},{\"id\":\"project_tbl\",\"label\":\"elms_new.project_tbl\"},{\"id\":\"role_dept_tbl\",\"label\":\"elms_new.role_dept_tbl\"},{\"id\":\"roles_tbl\",\"label\":\"elms_new.roles_tbl\"},{\"id\":\"tbl_notification\",\"label\":\"elms_new.tbl_notification\"},{\"id\":\"tbldepartments\",\"label\":\"elms_new.tbldepartments\"},{\"id\":\"tbldesignation\",\"label\":\"elms_new.tbldesignation\"},{\"id\":\"tblemployees\",\"label\":\"elms_new.tblemployees\"},{\"id\":\"tblemployees1\",\"label\":\"elms_new.tblemployees1\"},{\"id\":\"tblleaves\",\"label\":\"elms_new.tblleaves\"},{\"id\":\"tblleavetype\",\"label\":\"elms_new.tblleavetype\"},{\"id\":\"tblpayslip_details\",\"label\":\"elms_new.tblpayslip_details\"},{\"id\":\"thought_day\",\"label\":\"elms_new.thought_day\"},{\"id\":\"uploads\",\"label\":\"elms_new.uploads\"},{\"id\":\"user_login\",\"label\":\"elms_new.user_login\"},{\"id\":\"userlogs\",\"label\":\"elms_new.userlogs\"},{\"id\":\"usernames\",\"label\":\"elms_new.usernames\"},{\"id\":\"working_days\",\"label\":\"elms_new.working_days\"}]', '[{\"id\":\"tbl_deposit\",\"label\":\"db_gym1.tbl_deposit\"},{\"id\":\"tbl_email_config\",\"label\":\"db_gym1.tbl_email_config\"},{\"id\":\"tbl_enquiry\",\"label\":\"db_gym1.tbl_enquiry\"},{\"id\":\"tbl_expense\",\"label\":\"db_gym1.tbl_expense\"},{\"id\":\"tbl_group\",\"label\":\"db_gym1.tbl_group\"},{\"id\":\"tbl_membership\",\"label\":\"db_gym1.tbl_membership\"},{\"id\":\"tbl_permission\",\"label\":\"db_gym1.tbl_permission\"},{\"id\":\"tbl_permission_role\",\"label\":\"db_gym1.tbl_permission_role\"},{\"id\":\"tbl_sms_config\",\"label\":\"db_gym1.tbl_sms_config\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"schema\":\"db_gym1\",\"table\":\"tbl_deposit\",\"listOfDataTypes\":[],\"id\":\"tbl_deposit\",\"label\":\"db_gym1.tbl_deposit\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_email_config\",\"listOfDataTypes\":[],\"id\":\"tbl_email_config\",\"label\":\"db_gym1.tbl_email_config\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_enquiry\",\"listOfDataTypes\":[],\"id\":\"tbl_enquiry\",\"label\":\"db_gym1.tbl_enquiry\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_expense\",\"listOfDataTypes\":[],\"id\":\"tbl_expense\",\"label\":\"db_gym1.tbl_expense\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_group\",\"listOfDataTypes\":[],\"id\":\"tbl_group\",\"label\":\"db_gym1.tbl_group\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_membership\",\"listOfDataTypes\":[{\"datatype\":\"int\",\"columnname\":\"id\",\"id\":\"int\",\"label\":\"id.int\"},{\"datatype\":\"varchar\",\"columnname\":\"name\",\"id\":\"varchar\",\"label\":\"name.varchar\"},{\"datatype\":\"decimal\",\"columnname\":\"price_1\",\"id\":\"decimal\",\"label\":\"price_1.decimal\"},{\"datatype\":\"varchar\",\"columnname\":\"duration\",\"id\":\"varchar\",\"label\":\"duration.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"details\",\"id\":\"varchar\",\"label\":\"details.varchar\"}],\"id\":\"tbl_membership\",\"label\":\"db_gym1.tbl_membership\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_permission\",\"listOfDataTypes\":[],\"id\":\"tbl_permission\",\"label\":\"db_gym1.tbl_permission\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_permission_role\",\"listOfDataTypes\":[],\"id\":\"tbl_permission_role\",\"label\":\"db_gym1.tbl_permission_role\"},{\"schema\":\"db_gym1\",\"table\":\"tbl_sms_config\",\"listOfDataTypes\":[],\"id\":\"tbl_sms_config\",\"label\":\"db_gym1.tbl_sms_config\"}]', 'PUBLIC', '', 'MYSQL1', 'completed'),
(42, 42, 'MYSQL', 'MySQL1', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"busbooking\",\"label\":\"busbooking\"},{\"id\":\"certificates\",\"label\":\"certificates\"},{\"id\":\"chat_app\",\"label\":\"chat_app\"},{\"id\":\"db_myasset\",\"label\":\"db_myasset\"},{\"id\":\"dbase\",\"label\":\"dbase\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"elms_new\",\"label\":\"elms_new\"},{\"id\":\"evencal\",\"label\":\"evencal\"},{\"id\":\"hotel\",\"label\":\"hotel\"},{\"id\":\"sales_exec\",\"label\":\"sales_exec\"},{\"id\":\"stitchfix\",\"label\":\"stitchfix\"},{\"id\":\"stock\",\"label\":\"stock\"},{\"id\":\"tieitdev_hms\",\"label\":\"tieitdev_hms\"},{\"id\":\"wordpress\",\"label\":\"wordpress\"},{\"id\":\"hotel_mgmt_sys\",\"label\":\"hotel_mgmt_sys\"},{\"id\":\"hotel_booking\",\"label\":\"hotel_booking\"},{\"id\":\"hotel_mgmt\",\"label\":\"hotel_mgmt\"},{\"id\":\"hotelmis\",\"label\":\"hotelmis\"},{\"id\":\"migration\",\"label\":\"migration\"},{\"id\":\"motherhospital\",\"label\":\"motherhospital\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"php_stock\",\"label\":\"php_stock\"}]', '[{\"id\":\"chat_realtime\",\"label\":\"chat_realtime\"},{\"id\":\"db_gym1\",\"label\":\"db_gym1\"},{\"id\":\"dbgym\",\"label\":\"dbgym\"},{\"id\":\"stichfix\",\"label\":\"stichfix\"}]', '[{\"id\":\"messages\",\"label\":\"chat_realtime.messages\"},{\"id\":\"users\",\"label\":\"chat_realtime.users\"},{\"id\":\"admin\",\"label\":\"db_gym1.admin\"},{\"id\":\"auth_user\",\"label\":\"dbgym.auth_user\"},{\"id\":\"healthstatus\",\"label\":\"dbgym.healthstatus\"},{\"id\":\"mem_types\",\"label\":\"dbgym.mem_types\"},{\"id\":\"subsciption\",\"label\":\"dbgym.subsciption\"},{\"id\":\"time_table\",\"label\":\"dbgym.time_table\"},{\"id\":\"user_data\",\"label\":\"dbgym.user_data\"},{\"id\":\"admin_activities\",\"label\":\"stichfix.admin_activities\"},{\"id\":\"credit_type\",\"label\":\"stichfix.credit_type\"},{\"id\":\"inventory_impact\",\"label\":\"stichfix.inventory_impact\"},{\"id\":\"line_description\",\"label\":\"stichfix.line_description\"},{\"id\":\"lkp_Amount_fields\",\"label\":\"stichfix.lkp_Amount_fields\"},{\"id\":\"lkp_Transactions\",\"label\":\"stichfix.lkp_Transactions\"},{\"id\":\"lkp_account\",\"label\":\"stichfix.lkp_account\"},{\"id\":\"lkp_credit\",\"label\":\"stichfix.lkp_credit\"},{\"id\":\"lkp_event\",\"label\":\"stichfix.lkp_event\"},{\"id\":\"lkp_fiscal_week\",\"label\":\"stichfix.lkp_fiscal_week\"},{\"id\":\"lkp_revenue_line_desc\",\"label\":\"stichfix.lkp_revenue_line_desc\"},{\"id\":\"lkp_status\",\"label\":\"stichfix.lkp_status\"},{\"id\":\"ls_inventory_gl\",\"label\":\"stichfix.ls_inventory_gl\"},{\"id\":\"ls_inventory_gl_approve\",\"label\":\"stichfix.ls_inventory_gl_approve\"},{\"id\":\"ls_promocode\",\"label\":\"stichfix.ls_promocode\"},{\"id\":\"ls_revenue_gl\",\"label\":\"stichfix.ls_revenue_gl\"},{\"id\":\"t_userdata\",\"label\":\"stichfix.t_userdata\"},{\"id\":\"user_logs\",\"label\":\"stichfix.user_logs\"},{\"id\":\"usertracking\",\"label\":\"stichfix.usertracking\"}]', '[{\"id\":\"manage_website\",\"label\":\"db_gym1.manage_website\"},{\"id\":\"tbl_attendance\",\"label\":\"db_gym1.tbl_attendance\"},{\"id\":\"tbl_customer\",\"label\":\"db_gym1.tbl_customer\"},{\"id\":\"tbl_deposit\",\"label\":\"db_gym1.tbl_deposit\"},{\"id\":\"tbl_email_config\",\"label\":\"db_gym1.tbl_email_config\"},{\"id\":\"tbl_enquiry\",\"label\":\"db_gym1.tbl_enquiry\"},{\"id\":\"tbl_expense\",\"label\":\"db_gym1.tbl_expense\"},{\"id\":\"tbl_group\",\"label\":\"db_gym1.tbl_group\"},{\"id\":\"tbl_membership\",\"label\":\"db_gym1.tbl_membership\"},{\"id\":\"tbl_permission\",\"label\":\"db_gym1.tbl_permission\"},{\"id\":\"tbl_permission_role\",\"label\":\"db_gym1.tbl_permission_role\"},{\"id\":\"tbl_sms_config\",\"label\":\"db_gym1.tbl_sms_config\"},{\"id\":\"tbl_subscription\",\"label\":\"db_gym1.tbl_subscription\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"id\":\"manage_website\",\"label\":\"db_gym1.manage_website\"},{\"id\":\"tbl_attendance\",\"label\":\"db_gym1.tbl_attendance\",\"listOfDataTypes\":[{\"datatype\":\"int\",\"columnname\":\"id\",\"id\":\"int\",\"label\":\"id.int\"},{\"datatype\":\"varchar\",\"columnname\":\"user_id\",\"id\":\"varchar\",\"label\":\"user_id.varchar\"},{\"datatype\":\"text\",\"columnname\":\"curr_date\",\"id\":\"text\",\"label\":\"curr_date.text\"},{\"datatype\":\"text\",\"columnname\":\"curr_time\",\"id\":\"text\",\"label\":\"curr_time.text\"},{\"datatype\":\"tinyint\",\"columnname\":\"present\",\"id\":\"tinyint\",\"label\":\"present.tinyint\"}]},{\"id\":\"tbl_customer\",\"label\":\"db_gym1.tbl_customer\"},{\"id\":\"tbl_deposit\",\"label\":\"db_gym1.tbl_deposit\"},{\"id\":\"tbl_email_config\",\"label\":\"db_gym1.tbl_email_config\"},{\"id\":\"tbl_enquiry\",\"label\":\"db_gym1.tbl_enquiry\"},{\"id\":\"tbl_expense\",\"label\":\"db_gym1.tbl_expense\"},{\"id\":\"tbl_group\",\"label\":\"db_gym1.tbl_group\"},{\"id\":\"tbl_membership\",\"label\":\"db_gym1.tbl_membership\"},{\"id\":\"tbl_permission\",\"label\":\"db_gym1.tbl_permission\"},{\"id\":\"tbl_permission_role\",\"label\":\"db_gym1.tbl_permission_role\"},{\"id\":\"tbl_sms_config\",\"label\":\"db_gym1.tbl_sms_config\"},{\"id\":\"tbl_subscription\",\"label\":\"db_gym1.tbl_subscription\"}]', 'PUBLIC', '', 'MS1', 'completed'),
(43, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'MYSQL123', 'process'),
(44, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'sample', 'process'),
(45, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '123', 'process'),
(46, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'MySQL_123', 'process'),
(47, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'sss', 'process'),
(48, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Sample', 'process'),
(49, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Sample', 'process'),
(50, 50, 'MYSQL', 'Test', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"migration\",\"label\":\"migration\"}]', '[{\"id\":\"configuration\",\"label\":\"migration.configuration\"},{\"id\":\"create_job\",\"label\":\"migration.create_job\"},{\"id\":\"job_target\",\"label\":\"migration.job_target\"},{\"id\":\"schemas\",\"label\":\"migration.schemas\"},{\"id\":\"source\",\"label\":\"migration.source\"},{\"id\":\"tables\",\"label\":\"migration.tables\"},{\"id\":\"target\",\"label\":\"migration.target\"}]', '[{\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"id\":\"job_config\",\"label\":\"migration.job_config\"},{\"id\":\"job_schema\",\"label\":\"migration.job_schema\"},{\"id\":\"job_source\",\"label\":\"migration.job_source\"},{\"id\":\"job_table\",\"label\":\"migration.job_table\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"schema\":\"migration\",\"table\":\"joblist\",\"listOfDataTypes\":[{\"datatype\":\"int\",\"columnname\":\"joblistid\",\"id\":\"int\",\"label\":\"joblistid.int\"},{\"datatype\":\"int\",\"columnname\":\"job_id\",\"id\":\"int\",\"label\":\"job_id.int\"},{\"datatype\":\"varchar\",\"columnname\":\"s_connection\",\"id\":\"varchar\",\"label\":\"s_connection.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_conn\",\"id\":\"varchar\",\"label\":\"s_conn.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_db\",\"id\":\"varchar\",\"label\":\"s_db.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_schema_l\",\"id\":\"varchar\",\"label\":\"s_schema_l.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_schema_r\",\"id\":\"varchar\",\"label\":\"s_schema_r.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_table_l\",\"id\":\"varchar\",\"label\":\"s_table_l.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"s_table_r\",\"id\":\"varchar\",\"label\":\"s_table_r.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_conn\",\"id\":\"varchar\",\"label\":\"t_conn.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_connection\",\"id\":\"varchar\",\"label\":\"t_connection.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_database_name\",\"id\":\"varchar\",\"label\":\"t_database_name.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_db\",\"id\":\"varchar\",\"label\":\"t_db.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"seleted_target\",\"id\":\"varchar\",\"label\":\"seleted_target.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_schema\",\"id\":\"varchar\",\"label\":\"t_schema.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"t_table\",\"id\":\"varchar\",\"label\":\"t_table.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"j_name\",\"id\":\"varchar\",\"label\":\"j_name.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"status\",\"id\":\"varchar\",\"label\":\"status.varchar\"}],\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"schema\":\"migration\",\"table\":\"job_config\",\"listOfDataTypes\":[{\"datatype\":\"int\",\"columnname\":\"job_id\",\"id\":\"int\",\"label\":\"job_id.int\"},{\"datatype\":\"int\",\"columnname\":\"config_id\",\"id\":\"int\",\"label\":\"config_id.int\"},{\"datatype\":\"int\",\"columnname\":\"id\",\"id\":\"int\",\"label\":\"id.int\"}],\"id\":\"job_config\",\"label\":\"migration.job_config\"},{\"schema\":\"migration\",\"table\":\"job_schema\",\"listOfDataTypes\":[],\"id\":\"job_schema\",\"label\":\"migration.job_schema\"},{\"schema\":\"migration\",\"table\":\"job_source\",\"listOfDataTypes\":[],\"id\":\"job_source\",\"label\":\"migration.job_source\"},{\"schema\":\"migration\",\"table\":\"job_table\",\"listOfDataTypes\":[],\"id\":\"job_table\",\"label\":\"migration.job_table\"}]', 'PUBLIC', '', 'mysqldemo', 'completed'),
(51, 51, 'MYSQL', 'My_SQL_123', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"migration\",\"label\":\"migration\"}]', '[{\"id\":\"job_schema\",\"label\":\"migration.job_schema\"},{\"id\":\"job_source\",\"label\":\"migration.job_source\"},{\"id\":\"job_table\",\"label\":\"migration.job_table\"},{\"id\":\"job_target\",\"label\":\"migration.job_target\"},{\"id\":\"schemas\",\"label\":\"migration.schemas\"},{\"id\":\"source\",\"label\":\"migration.source\"},{\"id\":\"tables\",\"label\":\"migration.tables\"},{\"id\":\"target\",\"label\":\"migration.target\"}]', '[{\"id\":\"configuration\",\"label\":\"migration.configuration\"},{\"id\":\"create_job\",\"label\":\"migration.create_job\"},{\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"id\":\"job_config\",\"label\":\"migration.job_config\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"id\":\"configuration\",\"label\":\"migration.configuration\",\"listOfDataTypes\":[]},{\"id\":\"create_job\",\"label\":\"migration.create_job\"},{\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"id\":\"job_config\",\"label\":\"migration.job_config\"}]', 'PUBLIC', '', 'Samplemysql', 'completed'),
(52, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'process'),
(53, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'react-demo', 'process'),
(54, 54, 'MYSQL', 'Test', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"migration\",\"label\":\"migration\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"}]', '[{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"pma__bookmark\",\"label\":\"phpmyadmin.pma__bookmark\"},{\"id\":\"pma__central_columns\",\"label\":\"phpmyadmin.pma__central_columns\"},{\"id\":\"pma__pdf_pages\",\"label\":\"phpmyadmin.pma__pdf_pages\"},{\"id\":\"pma__recent\",\"label\":\"phpmyadmin.pma__recent\"},{\"id\":\"pma__relation\",\"label\":\"phpmyadmin.pma__relation\"},{\"id\":\"pma__savedsearches\",\"label\":\"phpmyadmin.pma__savedsearches\"},{\"id\":\"pma__table_coords\",\"label\":\"phpmyadmin.pma__table_coords\"},{\"id\":\"pma__table_info\",\"label\":\"phpmyadmin.pma__table_info\"},{\"id\":\"pma__table_uiprefs\",\"label\":\"phpmyadmin.pma__table_uiprefs\"},{\"id\":\"pma__tracking\",\"label\":\"phpmyadmin.pma__tracking\"},{\"id\":\"pma__userconfig\",\"label\":\"phpmyadmin.pma__userconfig\"},{\"id\":\"pma__usergroups\",\"label\":\"phpmyadmin.pma__usergroups\"},{\"id\":\"pma__users\",\"label\":\"phpmyadmin.pma__users\"}]', '[{\"id\":\"pma__column_info\",\"label\":\"phpmyadmin.pma__column_info\"},{\"id\":\"pma__designer_settings\",\"label\":\"phpmyadmin.pma__designer_settings\"},{\"id\":\"pma__export_templates\",\"label\":\"phpmyadmin.pma__export_templates\"},{\"id\":\"pma__favorite\",\"label\":\"phpmyadmin.pma__favorite\"},{\"id\":\"pma__history\",\"label\":\"phpmyadmin.pma__history\"},{\"id\":\"pma__navigationhiding\",\"label\":\"phpmyadmin.pma__navigationhiding\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"id\":\"pma__column_info\",\"label\":\"phpmyadmin.pma__column_info\",\"listOfDataTypes\":[{\"datatype\":\"varchar\",\"columnname\":\"id\",\"id\":\"varchar\",\"label\":\"id.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"db_name\",\"id\":\"varchar\",\"label\":\"db_name.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"table_name\",\"id\":\"varchar\",\"label\":\"table_name.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"column_name\",\"id\":\"varchar\",\"label\":\"column_name.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"comment\",\"id\":\"varchar\",\"label\":\"comment.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"mimetype\",\"id\":\"varchar\",\"label\":\"mimetype.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"transformation\",\"id\":\"varchar\",\"label\":\"transformation.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"transformation_options\",\"id\":\"varchar\",\"label\":\"transformation_options.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"input_transformation\",\"id\":\"varchar\",\"label\":\"input_transformation.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"input_transformation_options\",\"id\":\"varchar\",\"label\":\"input_transformation_options.varchar\"}]},{\"id\":\"pma__designer_settings\",\"label\":\"phpmyadmin.pma__designer_settings\"},{\"id\":\"pma__export_templates\",\"label\":\"phpmyadmin.pma__export_templates\"},{\"id\":\"pma__favorite\",\"label\":\"phpmyadmin.pma__favorite\"},{\"id\":\"pma__history\",\"label\":\"phpmyadmin.pma__history\"},{\"id\":\"pma__navigationhiding\",\"label\":\"phpmyadmin.pma__navigationhiding\"}]', 'PUBLIC', '', 'demo123', 'completed'),
(55, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'process'),
(56, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Sample', 'process'),
(57, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'test', 'process'),
(58, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'process'),
(59, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 's', 'process'),
(60, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'mysqldemo', 'process'),
(61, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bhvhgj', 'process'),
(62, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'saa', 'process'),
(63, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Sample123', 'process'),
(64, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'mysqldemo', 'process'),
(65, 65, 'MYSQL', 'Test', 'MYSQL', '[{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"migration\",\"label\":\"migration\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"elms\",\"label\":\"elms\"}]', '[{\"id\":\"ALL_PLUGINS\",\"label\":\"information_schema.ALL_PLUGINS\"},{\"id\":\"APPLICABLE_ROLES\",\"label\":\"information_schema.APPLICABLE_ROLES\"},{\"id\":\"COLLATION_CHARACTER_SET_APPLICABILITY\",\"label\":\"information_schema.COLLATION_CHARACTER_SET_APPLICABILITY\"},{\"id\":\"COLUMN_PRIVILEGES\",\"label\":\"information_schema.COLUMN_PRIVILEGES\"},{\"id\":\"ENABLED_ROLES\",\"label\":\"information_schema.ENABLED_ROLES\"},{\"id\":\"ENGINES\",\"label\":\"information_schema.ENGINES\"},{\"id\":\"EVENTS\",\"label\":\"information_schema.EVENTS\"},{\"id\":\"FILES\",\"label\":\"information_schema.FILES\"},{\"id\":\"GLOBAL_STATUS\",\"label\":\"information_schema.GLOBAL_STATUS\"},{\"id\":\"GLOBAL_VARIABLES\",\"label\":\"information_schema.GLOBAL_VARIABLES\"},{\"id\":\"KEY_CACHES\",\"label\":\"information_schema.KEY_CACHES\"},{\"id\":\"KEY_COLUMN_USAGE\",\"label\":\"information_schema.KEY_COLUMN_USAGE\"},{\"id\":\"OPTIMIZER_TRACE\",\"label\":\"information_schema.OPTIMIZER_TRACE\"},{\"id\":\"PARAMETERS\",\"label\":\"information_schema.PARAMETERS\"},{\"id\":\"PARTITIONS\",\"label\":\"information_schema.PARTITIONS\"},{\"id\":\"PLUGINS\",\"label\":\"information_schema.PLUGINS\"},{\"id\":\"PROCESSLIST\",\"label\":\"information_schema.PROCESSLIST\"},{\"id\":\"PROFILING\",\"label\":\"information_schema.PROFILING\"},{\"id\":\"REFERENTIAL_CONSTRAINTS\",\"label\":\"information_schema.REFERENTIAL_CONSTRAINTS\"},{\"id\":\"ROUTINES\",\"label\":\"information_schema.ROUTINES\"},{\"id\":\"SCHEMATA\",\"label\":\"information_schema.SCHEMATA\"},{\"id\":\"SCHEMA_PRIVILEGES\",\"label\":\"information_schema.SCHEMA_PRIVILEGES\"},{\"id\":\"SESSION_STATUS\",\"label\":\"information_schema.SESSION_STATUS\"},{\"id\":\"SESSION_VARIABLES\",\"label\":\"information_schema.SESSION_VARIABLES\"},{\"id\":\"STATISTICS\",\"label\":\"information_schema.STATISTICS\"},{\"id\":\"SYSTEM_VARIABLES\",\"label\":\"information_schema.SYSTEM_VARIABLES\"},{\"id\":\"TABLES\",\"label\":\"information_schema.TABLES\"},{\"id\":\"TABLESPACES\",\"label\":\"information_schema.TABLESPACES\"},{\"id\":\"TABLE_CONSTRAINTS\",\"label\":\"information_schema.TABLE_CONSTRAINTS\"},{\"id\":\"TABLE_PRIVILEGES\",\"label\":\"information_schema.TABLE_PRIVILEGES\"},{\"id\":\"TRIGGERS\",\"label\":\"information_schema.TRIGGERS\"},{\"id\":\"USER_PRIVILEGES\",\"label\":\"information_schema.USER_PRIVILEGES\"},{\"id\":\"VIEWS\",\"label\":\"information_schema.VIEWS\"},{\"id\":\"GEOMETRY_COLUMNS\",\"label\":\"information_schema.GEOMETRY_COLUMNS\"},{\"id\":\"SPATIAL_REF_SYS\",\"label\":\"information_schema.SPATIAL_REF_SYS\"},{\"id\":\"CLIENT_STATISTICS\",\"label\":\"information_schema.CLIENT_STATISTICS\"},{\"id\":\"INDEX_STATISTICS\",\"label\":\"information_schema.INDEX_STATISTICS\"},{\"id\":\"INNODB_SYS_DATAFILES\",\"label\":\"information_schema.INNODB_SYS_DATAFILES\"},{\"id\":\"USER_STATISTICS\",\"label\":\"information_schema.USER_STATISTICS\"},{\"id\":\"INNODB_SYS_TABLESTATS\",\"label\":\"information_schema.INNODB_SYS_TABLESTATS\"},{\"id\":\"INNODB_LOCKS\",\"label\":\"information_schema.INNODB_LOCKS\"},{\"id\":\"INNODB_MUTEXES\",\"label\":\"information_schema.INNODB_MUTEXES\"},{\"id\":\"INNODB_CMPMEM\",\"label\":\"information_schema.INNODB_CMPMEM\"},{\"id\":\"INNODB_CMP_PER_INDEX\",\"label\":\"information_schema.INNODB_CMP_PER_INDEX\"},{\"id\":\"INNODB_CMP\",\"label\":\"information_schema.INNODB_CMP\"},{\"id\":\"INNODB_FT_DELETED\",\"label\":\"information_schema.INNODB_FT_DELETED\"},{\"id\":\"INNODB_CMP_RESET\",\"label\":\"information_schema.INNODB_CMP_RESET\"},{\"id\":\"INNODB_LOCK_WAITS\",\"label\":\"information_schema.INNODB_LOCK_WAITS\"},{\"id\":\"TABLE_STATISTICS\",\"label\":\"information_schema.TABLE_STATISTICS\"},{\"id\":\"INNODB_TABLESPACES_ENCRYPTION\",\"label\":\"information_schema.INNODB_TABLESPACES_ENCRYPTION\"},{\"id\":\"INNODB_BUFFER_PAGE_LRU\",\"label\":\"information_schema.INNODB_BUFFER_PAGE_LRU\"},{\"id\":\"INNODB_SYS_FIELDS\",\"label\":\"information_schema.INNODB_SYS_FIELDS\"},{\"id\":\"INNODB_CMPMEM_RESET\",\"label\":\"information_schema.INNODB_CMPMEM_RESET\"},{\"id\":\"INNODB_SYS_COLUMNS\",\"label\":\"information_schema.INNODB_SYS_COLUMNS\"},{\"id\":\"INNODB_FT_INDEX_TABLE\",\"label\":\"information_schema.INNODB_FT_INDEX_TABLE\"},{\"id\":\"INNODB_CMP_PER_INDEX_RESET\",\"label\":\"information_schema.INNODB_CMP_PER_INDEX_RESET\"},{\"id\":\"user_variables\",\"label\":\"information_schema.user_variables\"},{\"id\":\"INNODB_FT_INDEX_CACHE\",\"label\":\"information_schema.INNODB_FT_INDEX_CACHE\"},{\"id\":\"INNODB_SYS_FOREIGN_COLS\",\"label\":\"information_schema.INNODB_SYS_FOREIGN_COLS\"},{\"id\":\"INNODB_FT_BEING_DELETED\",\"label\":\"information_schema.INNODB_FT_BEING_DELETED\"},{\"id\":\"INNODB_BUFFER_POOL_STATS\",\"label\":\"information_schema.INNODB_BUFFER_POOL_STATS\"},{\"id\":\"INNODB_TRX\",\"label\":\"information_schema.INNODB_TRX\"},{\"id\":\"INNODB_SYS_FOREIGN\",\"label\":\"information_schema.INNODB_SYS_FOREIGN\"},{\"id\":\"INNODB_SYS_TABLES\",\"label\":\"information_schema.INNODB_SYS_TABLES\"},{\"id\":\"INNODB_FT_DEFAULT_STOPWORD\",\"label\":\"information_schema.INNODB_FT_DEFAULT_STOPWORD\"},{\"id\":\"INNODB_FT_CONFIG\",\"label\":\"information_schema.INNODB_FT_CONFIG\"},{\"id\":\"INNODB_BUFFER_PAGE\",\"label\":\"information_schema.INNODB_BUFFER_PAGE\"},{\"id\":\"INNODB_SYS_TABLESPACES\",\"label\":\"information_schema.INNODB_SYS_TABLESPACES\"},{\"id\":\"INNODB_METRICS\",\"label\":\"information_schema.INNODB_METRICS\"},{\"id\":\"INNODB_SYS_INDEXES\",\"label\":\"information_schema.INNODB_SYS_INDEXES\"},{\"id\":\"INNODB_SYS_VIRTUAL\",\"label\":\"information_schema.INNODB_SYS_VIRTUAL\"},{\"id\":\"INNODB_TABLESPACES_SCRUBBING\",\"label\":\"information_schema.INNODB_TABLESPACES_SCRUBBING\"},{\"id\":\"INNODB_SYS_SEMAPHORE_WAITS\",\"label\":\"information_schema.INNODB_SYS_SEMAPHORE_WAITS\"},{\"id\":\"website\",\"label\":\"ci3_reactjs_crud.website\"},{\"id\":\"category\",\"label\":\"elms.category\"},{\"id\":\"department\",\"label\":\"elms.department\"},{\"id\":\"designation\",\"label\":\"elms.designation\"},{\"id\":\"employee\",\"label\":\"elms.employee\"},{\"id\":\"employee1\",\"label\":\"elms.employee1\"},{\"id\":\"employee2\",\"label\":\"elms.employee2\"},{\"id\":\"employee3\",\"label\":\"elms.employee3\"},{\"id\":\"generate_education\",\"label\":\"elms.generate_education\"},{\"id\":\"generate_experience\",\"label\":\"elms.generate_experience\"},{\"id\":\"generate_jd\",\"label\":\"elms.generate_jd\"},{\"id\":\"generate_resume\",\"label\":\"elms.generate_resume\"},{\"id\":\"generate_resume_project\",\"label\":\"elms.generate_resume_project\"},{\"id\":\"generate_skills\",\"label\":\"elms.generate_skills\"},{\"id\":\"groups\",\"label\":\"elms.groups\"},{\"id\":\"leave_balance\",\"label\":\"elms.leave_balance\"},{\"id\":\"leave_details\",\"label\":\"elms.leave_details\"},{\"id\":\"leave_type\",\"label\":\"elms.leave_type\"},{\"id\":\"payroll\",\"label\":\"elms.payroll\"},{\"id\":\"project\",\"label\":\"elms.project\"},{\"id\":\"service_request\",\"label\":\"elms.service_request\"},{\"id\":\"service_request_type\",\"label\":\"elms.service_request_type\"},{\"id\":\"skill_competency\",\"label\":\"elms.skill_competency\"},{\"id\":\"talent_pool\",\"label\":\"elms.talent_pool\"},{\"id\":\"timesheet\",\"label\":\"elms.timesheet\"},{\"id\":\"user_alerts\",\"label\":\"elms.user_alerts\"}]', '[{\"id\":\"CHARACTER_SETS\",\"label\":\"information_schema.CHARACTER_SETS\"},{\"id\":\"CHECK_CONSTRAINTS\",\"label\":\"information_schema.CHECK_CONSTRAINTS\"},{\"id\":\"COLLATIONS\",\"label\":\"information_schema.COLLATIONS\"},{\"id\":\"COLUMNS\",\"label\":\"information_schema.COLUMNS\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '[{\"id\":\"CHARACTER_SETS\",\"label\":\"information_schema.CHARACTER_SETS\",\"listOfDataTypes\":[{\"datatype\":\"varchar\",\"columnname\":\"CHARACTER_SET_NAME\",\"id\":\"varchar\",\"label\":\"CHARACTER_SET_NAME.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"DEFAULT_COLLATE_NAME\",\"id\":\"varchar\",\"label\":\"DEFAULT_COLLATE_NAME.varchar\"},{\"datatype\":\"varchar\",\"columnname\":\"DESCRIPTION\",\"id\":\"varchar\",\"label\":\"DESCRIPTION.varchar\"},{\"datatype\":\"bigint\",\"columnname\":\"MAXLEN\",\"id\":\"bigint\",\"label\":\"MAXLEN.bigint\"}]},{\"id\":\"CHECK_CONSTRAINTS\",\"label\":\"information_schema.CHECK_CONSTRAINTS\"},{\"id\":\"COLLATIONS\",\"label\":\"information_schema.COLLATIONS\"},{\"id\":\"COLUMNS\",\"label\":\"information_schema.COLUMNS\"}]', 'PUBLIC', '', 'Sample', 'completed'),
(66, 66, 'MYSQL', 'Test', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"migration\",\"label\":\"migration\"}]', '[{\"id\":\"configuration\",\"label\":\"migration.configuration\"},{\"id\":\"create_job\",\"label\":\"migration.create_job\"},{\"id\":\"job_schema\",\"label\":\"migration.job_schema\"},{\"id\":\"job_source\",\"label\":\"migration.job_source\"},{\"id\":\"job_table\",\"label\":\"migration.job_table\"},{\"id\":\"job_target\",\"label\":\"migration.job_target\"},{\"id\":\"schemas\",\"label\":\"migration.schemas\"},{\"id\":\"source\",\"label\":\"migration.source\"},{\"id\":\"tables\",\"label\":\"migration.tables\"},{\"id\":\"target\",\"label\":\"migration.target\"}]', '[{\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"id\":\"job_config\",\"label\":\"migration.job_config\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '', 'PUBLIC', '', 'demo', 'completed'),
(67, 67, 'MYSQL', 'Test', 'MYSQL', '[{\"id\":\"information_schema\",\"label\":\"information_schema\"},{\"id\":\"ci3_reactjs_crud\",\"label\":\"ci3_reactjs_crud\"},{\"id\":\"diksha_sea\",\"label\":\"diksha_sea\"},{\"id\":\"elms\",\"label\":\"elms\"},{\"id\":\"legal_bots\",\"label\":\"legal_bots\"},{\"id\":\"mysql\",\"label\":\"mysql\"},{\"id\":\"performance_schema\",\"label\":\"performance_schema\"},{\"id\":\"phpmyadmin\",\"label\":\"phpmyadmin\"},{\"id\":\"test\",\"label\":\"test\"}]', '[{\"id\":\"migration\",\"label\":\"migration\"}]', '[{\"id\":\"configuration\",\"label\":\"migration.configuration\"},{\"id\":\"create_job\",\"label\":\"migration.create_job\"},{\"id\":\"joblist\",\"label\":\"migration.joblist\"},{\"id\":\"job_source\",\"label\":\"migration.job_source\"},{\"id\":\"job_table\",\"label\":\"migration.job_table\"},{\"id\":\"job_target\",\"label\":\"migration.job_target\"},{\"id\":\"schemas\",\"label\":\"migration.schemas\"},{\"id\":\"source\",\"label\":\"migration.source\"},{\"id\":\"tables\",\"label\":\"migration.tables\"},{\"id\":\"target\",\"label\":\"migration.target\"}]', '[{\"id\":\"job_config\",\"label\":\"migration.job_config\"},{\"id\":\"job_schema\",\"label\":\"migration.job_schema\"}]', 'SF', 'Driver={CData ODBC Driver for Snowflake};url=https://datasticians.snowflakecomputing.com;warehouse=DEMO_WH;Database=TEST_DB;', 'TEST_DB', 'SnowFlake Dev', '', 'PUBLIC', '', 'demo1', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `job_config`
--

CREATE TABLE `job_config` (
  `job_id` int(11) NOT NULL,
  `config_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_config`
--

INSERT INTO `job_config` (`job_id`, `config_id`, `id`) VALUES
(2, 81, 1),
(2, 81, 2);

-- --------------------------------------------------------

--
-- Table structure for table `job_schema`
--

CREATE TABLE `job_schema` (
  `id` int(150) NOT NULL,
  `schema_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL,
  `left_schema_names` varchar(200) NOT NULL,
  `right_schema_names` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_schema`
--

INSERT INTO `job_schema` (`id`, `schema_id`, `job_id`, `left_schema_names`, `right_schema_names`) VALUES
(31, 0, 17, '', ''),
(33, 0, 18, '', ''),
(35, 0, 19, '', ''),
(37, 0, 20, '', ''),
(39, 0, 31, '', ''),
(40, 0, 32, '', ''),
(41, 0, 33, '', ''),
(42, 0, 34, '', ''),
(43, 0, 35, '', ''),
(44, 0, 36, '', ''),
(45, 0, 37, '', ''),
(46, 0, 38, '', ''),
(47, 0, 39, '', ''),
(48, 0, 40, '', ''),
(49, 0, 41, '', ''),
(50, 0, 42, '', ''),
(51, 0, 43, '', ''),
(52, 0, 45, '', ''),
(53, 0, 46, '', ''),
(54, 0, 47, '', ''),
(55, 0, 48, '', ''),
(56, 0, 50, '', ''),
(58, 0, 51, '', ''),
(59, 0, 54, '', ''),
(60, 0, 60, '', ''),
(61, 0, 65, '', ''),
(62, 0, 66, '', ''),
(63, 0, 67, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `job_source`
--

CREATE TABLE `job_source` (
  `id` int(150) NOT NULL,
  `source_id` varchar(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_table`
--

CREATE TABLE `job_table` (
  `id` int(150) NOT NULL,
  `table_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_target`
--

CREATE TABLE `job_target` (
  `id` int(150) NOT NULL,
  `target_id` int(150) NOT NULL,
  `job_id` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_target`
--

INSERT INTO `job_target` (`id`, `target_id`, `job_id`) VALUES
(16, 6, 17),
(17, 6, 18),
(18, 6, 19),
(19, 6, 20),
(20, 6, 31),
(21, 6, 32),
(22, 6, 33),
(23, 6, 34),
(24, 6, 35),
(25, 6, 36),
(26, 6, 37),
(27, 6, 38),
(28, 6, 39),
(29, 6, 40),
(30, 6, 41),
(31, 6, 42),
(32, 6, 50),
(33, 6, 51),
(34, 6, 54),
(35, 6, 65),
(36, 6, 66),
(37, 6, 67);

-- --------------------------------------------------------

--
-- Table structure for table `schemas`
--

CREATE TABLE `schemas` (
  `id` int(11) NOT NULL,
  `schema_list` varchar(400) NOT NULL,
  `database_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `database_list` varchar(400) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `database_list`, `status`) VALUES
(1, 'Amazon RedShift', 0),
(2, 'PostgreSQL', 0),
(3, 'Oracle', 0),
(4, 'MS SQL Server', 0),
(5, 'MYSQL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_list` varchar(400) NOT NULL,
  `schema_id` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `target`
--

CREATE TABLE `target` (
  `id` int(11) NOT NULL,
  `snow_flake` varchar(200) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `target`
--

INSERT INTO `target` (`id`, `snow_flake`, `status`) VALUES
(6, 'SnowFlake Dev', 0),
(7, 'SnowFlake SIT', 0),
(8, 'SnowFlake UAT', 0),
(9, 'NeSnowFlake PROD', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_job`
--
ALTER TABLE `create_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joblist`
--
ALTER TABLE `joblist`
  ADD PRIMARY KEY (`joblistid`);

--
-- Indexes for table `job_config`
--
ALTER TABLE `job_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_schema`
--
ALTER TABLE `job_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_source`
--
ALTER TABLE `job_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_table`
--
ALTER TABLE `job_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_target`
--
ALTER TABLE `job_target`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schemas`
--
ALTER TABLE `schemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `create_job`
--
ALTER TABLE `create_job`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `joblist`
--
ALTER TABLE `joblist`
  MODIFY `joblistid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `job_config`
--
ALTER TABLE `job_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_schema`
--
ALTER TABLE `job_schema`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `job_source`
--
ALTER TABLE `job_source`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_table`
--
ALTER TABLE `job_table`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_target`
--
ALTER TABLE `job_target`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `schemas`
--
ALTER TABLE `schemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `target`
--
ALTER TABLE `target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
