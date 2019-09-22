-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2019 at 02:29 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(64, 'RS', 'test-sss.cmx3j5mpskak.us-east-1.redshift.amazonaws.com', '5439', '', 'test_sss', 'admin', 'Admin123', 1, 'source'),
(66, 'RS1', 'localhost', '5439', '', '', 'Test', 'admin', 1, 'source'),
(69, 'ORA2', '202.62.76.104', '1521', '', 'demo', 'c2c', 'c2c', 3, 'source'),
(70, 'ORA1', 'localhost', '1521', '', 'demo', 'c2c', 'c2c', 3, 'source'),
(71, 'MySQL1', 'localhost', '3306', '', 'migration', 'root', 'mysql', 5, 'source'),
(72, 'SF', 'https://datasticians.snowflakecomputing.com', '81', 'DEMO_WH', 'TEST_DB', 'vagrawal', 'Snowflake1@', 6, 'target');

-- --------------------------------------------------------

--
-- Table structure for table `create_job`
--

CREATE TABLE `create_job` (
  `id` int(150) NOT NULL,
  `job_name` varchar(150) NOT NULL,
  `status` enum('process','completed','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `joblist`
--

CREATE TABLE `joblist` (
  `joblistid` int(11) NOT NULL,
  `s_conn` varchar(2000) NOT NULL,
  `s_db` varchar(2000) NOT NULL,
  `s_schema_l` varchar(10000) NOT NULL,
  `s_schema_r` varchar(10000) NOT NULL,
  `s_table_l` varchar(10000) NOT NULL,
  `s_table_r` varchar(10000) NOT NULL,
  `t_conn` varchar(2000) NOT NULL,
  `t_db` varchar(2000) NOT NULL,
  `t_schema` varchar(2000) NOT NULL,
  `j_name` varchar(2000) NOT NULL,
  `status` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joblist`
--

INSERT INTO `joblist` (`joblistid`, `s_conn`, `s_db`, `s_schema_l`, `s_schema_r`, `s_table_l`, `s_table_r`, `t_conn`, `t_db`, `t_schema`, `j_name`, `status`) VALUES
(1, '', '', '', '', '', '', '', '', '', 'Job1', 'process'),
(2, 'RSdfgdf', 'Amazon RedShift', '[{\"id\":\"test\",\"label\":\"test\"},{\"id\":\"public\",\"label\":\"public\"},{\"id\":\"information_schema\",\"label\":\"information_schema\"}]', '[{\"id\":\"pg_toast\",\"label\":\"pg_toast\"},{\"id\":\"pg_internal\",\"label\":\"pg_internal\"},{\"id\":\"pg_temp_1\",\"label\":\"pg_temp_1\"},{\"id\":\"pg_catalog\",\"label\":\"pg_catalog\"}]', '[{\"id\":\"pg_user_info\",\"label\":\"pg_catalog.pg_user_info\"},{\"id\":\"padb_config_harvest\",\"label\":\"pg_catalog.padb_config_harvest\"},{\"id\":\"pg_external_schema\",\"label\":\"pg_catalog.pg_external_schema\"},{\"id\":\"pg_statistic\",\"label\":\"pg_catalog.pg_statistic\"},{\"id\":\"pg_settings\",\"label\":\"pg_catalog.pg_settings\"},{\"id\":\"pg_type\",\"label\":\"pg_catalog.pg_type\"},{\"id\":\"pg_attribute\",\"label\":\"pg_catalog.pg_attribute\"},{\"id\":\"pg_class\",\"label\":\"pg_catalog.pg_class\"},{\"id\":\"pg_tablespace\",\"label\":\"pg_catalog.pg_tablespace\"},{\"id\":\"pg_inherits\",\"label\":\"pg_catalog.pg_inherits\"},{\"id\":\"pg_index\",\"label\":\"pg_catalog.pg_index\"},{\"id\":\"pg_operator\",\"label\":\"pg_catalog.pg_operator\"},{\"id\":\"pg_opclass\",\"label\":\"pg_catalog.pg_opclass\"},{\"id\":\"pg_am\",\"label\":\"pg_catalog.pg_am\"},{\"id\":\"pg_amop\",\"label\":\"pg_catalog.pg_amop\"},{\"id\":\"pg_amproc\",\"label\":\"pg_catalog.pg_amproc\"},{\"id\":\"pg_language\",\"label\":\"pg_catalog.pg_language\"},{\"id\":\"pg_largeobject\",\"label\":\"pg_catalog.pg_largeobject\"},{\"id\":\"pg_aggregate\",\"label\":\"pg_catalog.pg_aggregate\"},{\"id\":\"pg_statistic_multicol\",\"label\":\"pg_catalog.pg_statistic_multicol\"},{\"id\":\"pg_trigger\",\"label\":\"pg_catalog.pg_trigger\"},{\"id\":\"pg_listener\",\"label\":\"pg_catalog.pg_listener\"},{\"id\":\"pg_cast\",\"label\":\"pg_catalog.pg_cast\"},{\"id\":\"pg_namespace\",\"label\":\"pg_catalog.pg_namespace\"},{\"id\":\"pg_conversion\",\"label\":\"pg_catalog.pg_conversion\"},{\"id\":\"pg_udf\",\"label\":\"pg_catalog.pg_udf\"},{\"id\":\"pg_bar_repos\",\"label\":\"pg_catalog.pg_bar_repos\"},{\"id\":\"pg_bar_state\",\"label\":\"pg_catalog.pg_bar_state\"},{\"id\":\"pg_depend\",\"label\":\"pg_catalog.pg_depend\"},{\"id\":\"pg_highwatermark\",\"label\":\"pg_catalog.pg_highwatermark\"},{\"id\":\"pg_resize\",\"label\":\"pg_catalog.pg_resize\"},{\"id\":\"pg_attrdef\",\"label\":\"pg_catalog.pg_attrdef\"},{\"id\":\"pg_constraint\",\"label\":\"pg_catalog.pg_constraint\"},{\"id\":\"pg_database\",\"label\":\"pg_catalog.pg_database\"},{\"id\":\"pg_description\",\"label\":\"pg_catalog.pg_description\"},{\"id\":\"pg_group\",\"label\":\"pg_catalog.pg_group\"},{\"id\":\"pg_proc\",\"label\":\"pg_catalog.pg_proc\"},{\"id\":\"pg_rewrite\",\"label\":\"pg_catalog.pg_rewrite\"},{\"id\":\"pg_bar_ddllog\",\"label\":\"pg_catalog.pg_bar_ddllog\"},{\"id\":\"pg_user\",\"label\":\"pg_catalog.pg_user\"},{\"id\":\"pg_rules\",\"label\":\"pg_catalog.pg_rules\"},{\"id\":\"pg_views\",\"label\":\"pg_catalog.pg_views\"},{\"id\":\"pg_tables\",\"label\":\"pg_catalog.pg_tables\"},{\"id\":\"pg_table_def\",\"label\":\"pg_catalog.pg_table_def\"},{\"id\":\"pg_indexes\",\"label\":\"pg_catalog.pg_indexes\"},{\"id\":\"pg_stats\",\"label\":\"pg_catalog.pg_stats\"},{\"id\":\"pg_stat_all_tables\",\"label\":\"pg_catalog.pg_stat_all_tables\"},{\"id\":\"pg_stat_sys_tables\",\"label\":\"pg_catalog.pg_stat_sys_tables\"},{\"id\":\"pg_stat_user_tables\",\"label\":\"pg_catalog.pg_stat_user_tables\"},{\"id\":\"pg_statio_all_tables\",\"label\":\"pg_catalog.pg_statio_all_tables\"},{\"id\":\"pg_statio_sys_tables\",\"label\":\"pg_catalog.pg_statio_sys_tables\"},{\"id\":\"pg_statio_user_tables\",\"label\":\"pg_catalog.pg_statio_user_tables\"},{\"id\":\"pg_stat_all_indexes\",\"label\":\"pg_catalog.pg_stat_all_indexes\"},{\"id\":\"pg_stat_sys_indexes\",\"label\":\"pg_catalog.pg_stat_sys_indexes\"},{\"id\":\"pg_stat_user_indexes\",\"label\":\"pg_catalog.pg_stat_user_indexes\"},{\"id\":\"pg_statio_all_indexes\",\"label\":\"pg_catalog.pg_statio_all_indexes\"},{\"id\":\"pg_statio_sys_indexes\",\"label\":\"pg_catalog.pg_statio_sys_indexes\"},{\"id\":\"pg_statio_user_indexes\",\"label\":\"pg_catalog.pg_statio_user_indexes\"},{\"id\":\"pg_statio_all_sequences\",\"label\":\"pg_catalog.pg_statio_all_sequences\"},{\"id\":\"pg_statio_sys_sequences\",\"label\":\"pg_catalog.pg_statio_sys_sequences\"},{\"id\":\"pg_statio_user_sequences\",\"label\":\"pg_catalog.pg_statio_user_sequences\"},{\"id\":\"pg_stat_activity\",\"label\":\"pg_catalog.pg_stat_activity\"},{\"id\":\"pg_stat_database\",\"label\":\"pg_catalog.pg_stat_database\"},{\"id\":\"pg_locks\",\"label\":\"pg_catalog.pg_locks\"},{\"id\":\"pg_test\",\"label\":\"pg_catalog.pg_test\"},{\"id\":\"pg_statistic_indicator\",\"label\":\"pg_catalog.pg_statistic_indicator\"},{\"id\":\"pg_proc_info\",\"label\":\"pg_catalog.pg_proc_info\"},{\"id\":\"stl_commit_stats\",\"label\":\"pg_catalog.stl_commit_stats\"},{\"id\":\"stl_connection_log\",\"label\":\"pg_catalog.stl_connection_log\"},{\"id\":\"stl_userlog\",\"label\":\"pg_catalog.stl_userlog\"},{\"id\":\"stl_alert_event_log\",\"label\":\"pg_catalog.stl_alert_event_log\"},{\"id\":\"stl_ddltext\",\"label\":\"pg_catalog.stl_ddltext\"},{\"id\":\"stl_error\",\"label\":\"pg_catalog.stl_error\"},{\"id\":\"stl_explain\",\"label\":\"pg_catalog.stl_explain\"},{\"id\":\"stl_file_scan\",\"label\":\"pg_catalog.stl_file_scan\"},{\"id\":\"stl_load_commits\",\"label\":\"pg_catalog.stl_load_commits\"},{\"id\":\"stl_loaderror_detail\",\"label\":\"pg_catalog.stl_loaderror_detail\"},{\"id\":\"stl_load_errors\",\"label\":\"pg_catalog.stl_load_errors\"},{\"id\":\"stl_load_trace\",\"label\":\"pg_catalog.stl_load_trace\"},{\"id\":\"stl_plan_info\",\"label\":\"pg_catalog.stl_plan_info\"},{\"id\":\"stl_querytext\",\"label\":\"pg_catalog.stl_querytext\"},{\"id\":\"stl_replacements\",\"label\":\"pg_catalog.stl_replacements\"},{\"id\":\"stl_s3client\",\"label\":\"pg_catalog.stl_s3client\"},{\"id\":\"stl_s3client_error\",\"label\":\"pg_catalog.stl_s3client_error\"},{\"id\":\"stl_sshclient_error\",\"label\":\"pg_catalog.stl_sshclient_error\"},{\"id\":\"stl_sessions\",\"label\":\"pg_catalog.stl_sessions\"},{\"id\":\"stl_stream_segs\",\"label\":\"pg_catalog.stl_stream_segs\"},{\"id\":\"stl_tr_conflict\",\"label\":\"pg_catalog.stl_tr_conflict\"},{\"id\":\"stl_udf_compile_error\",\"label\":\"pg_catalog.stl_udf_compile_error\"},{\"id\":\"stl_undone\",\"label\":\"pg_catalog.stl_undone\"},{\"id\":\"stl_utilitytext\",\"label\":\"pg_catalog.stl_utilitytext\"},{\"id\":\"stl_vacuum_detail\",\"label\":\"pg_catalog.stl_vacuum_detail\"},{\"id\":\"stl_vacuum\",\"label\":\"pg_catalog.stl_vacuum\"},{\"id\":\"stl_warning\",\"label\":\"pg_catalog.stl_warning\"},{\"id\":\"stl_wlm_error\",\"label\":\"pg_catalog.stl_wlm_error\"},{\"id\":\"stl_wlm_query\",\"label\":\"pg_catalog.stl_wlm_query\"},{\"id\":\"stl_restarted_sessions\",\"label\":\"pg_catalog.stl_restarted_sessions\"},{\"id\":\"stl_disk_full_diag\",\"label\":\"pg_catalog.stl_disk_full_diag\"},{\"id\":\"stv_blocklist\",\"label\":\"pg_catalog.stv_blocklist\"},{\"id\":\"stv_exec_state\",\"label\":\"pg_catalog.stv_exec_state\"},{\"id\":\"stv_inflight\",\"label\":\"pg_catalog.stv_inflight\"},{\"id\":\"stv_load_state\",\"label\":\"pg_catalog.stv_load_state\"},{\"id\":\"stv_locks\",\"label\":\"pg_catalog.stv_locks\"},{\"id\":\"stv_partitions\",\"label\":\"pg_catalog.stv_partitions\"},{\"id\":\"stv_proc_stat\",\"label\":\"pg_catalog.stv_proc_stat\"},{\"id\":\"stv_recents\",\"label\":\"pg_catalog.stv_recents\"},{\"id\":\"stv_sessions\",\"label\":\"pg_catalog.stv_sessions\"},{\"id\":\"stv_slices\",\"label\":\"pg_catalog.stv_slices\"},{\"id\":\"stv_table_partitions\",\"label\":\"pg_catalog.stv_table_partitions\"},{\"id\":\"stv_table_partition_summary\",\"label\":\"pg_catalog.stv_table_partition_summary\"},{\"id\":\"stv_tbl_perm\",\"label\":\"pg_catalog.stv_tbl_perm\"},{\"id\":\"stv_tbl_trans\",\"label\":\"pg_catalog.stv_tbl_trans\"},{\"id\":\"stv_underrepped_blocks\",\"label\":\"pg_catalog.stv_underrepped_blocks\"},{\"id\":\"stv_wlm_classification_config\",\"label\":\"pg_catalog.stv_wlm_classification_config\"},{\"id\":\"stv_wlm_query_queue_state\",\"label\":\"pg_catalog.stv_wlm_query_queue_state\"},{\"id\":\"stv_wlm_query_state\",\"label\":\"pg_catalog.stv_wlm_query_state\"},{\"id\":\"stv_wlm_query_task_state\",\"label\":\"pg_catalog.stv_wlm_query_task_state\"},{\"id\":\"stv_wlm_service_class_config\",\"label\":\"pg_catalog.stv_wlm_service_class_config\"},{\"id\":\"stv_wlm_service_class_state\",\"label\":\"pg_catalog.stv_wlm_service_class_state\"},{\"id\":\"stv_disk_extents\",\"label\":\"pg_catalog.stv_disk_extents\"},{\"id\":\"stl_leader_snapshot\",\"label\":\"pg_catalog.stl_leader_snapshot\"},{\"id\":\"stv_pg_wal_length\",\"label\":\"pg_catalog.stv_pg_wal_length\"},{\"id\":\"stl_aggr\",\"label\":\"pg_catalog.stl_aggr\"},{\"id\":\"stl_bcast\",\"label\":\"pg_catalog.stl_bcast\"},{\"id\":\"stl_delete\",\"label\":\"pg_catalog.stl_delete\"},{\"id\":\"stl_dist\",\"label\":\"pg_catalog.stl_dist\"},{\"id\":\"stl_rpc\",\"label\":\"pg_catalog.stl_rpc\"},{\"id\":\"stl_window\",\"label\":\"pg_catalog.stl_window\"},{\"id\":\"stl_hashjoin\",\"label\":\"pg_catalog.stl_hashjoin\"},{\"id\":\"stl_hash\",\"label\":\"pg_catalog.stl_hash\"},{\"id\":\"stl_insert\",\"label\":\"pg_catalog.stl_insert\"},{\"id\":\"stl_metadata_step\",\"label\":\"pg_catalog.stl_metadata_step\"},{\"id\":\"stl_unique\",\"label\":\"pg_catalog.stl_unique\"},{\"id\":\"stl_limit\",\"label\":\"pg_catalog.stl_limit\"},{\"id\":\"stl_mergejoin\",\"label\":\"pg_catalog.stl_mergejoin\"},{\"id\":\"stl_merge\",\"label\":\"pg_catalog.stl_merge\"},{\"id\":\"stl_nestloop\",\"label\":\"pg_catalog.stl_nestloop\"},{\"id\":\"stl_parse\",\"label\":\"pg_catalog.stl_parse\"},{\"id\":\"stl_project\",\"label\":\"pg_catalog.stl_project\"},{\"id\":\"stl_query\",\"label\":\"pg_catalog.stl_query\"},{\"id\":\"stl_return\",\"label\":\"pg_catalog.stl_return\"},{\"id\":\"stl_save\",\"label\":\"pg_catalog.stl_save\"},{\"id\":\"stl_scan\",\"label\":\"pg_catalog.stl_scan\"},{\"id\":\"stl_sort\",\"label\":\"pg_catalog.stl_sort\"},{\"id\":\"stv_query_stats\",\"label\":\"pg_catalog.stv_query_stats\"},{\"id\":\"stl_unload_log\",\"label\":\"pg_catalog.stl_unload_log\"},{\"id\":\"stv_active_cursors\",\"label\":\"pg_catalog.stv_active_cursors\"},{\"id\":\"stv_block_reps\",\"label\":\"pg_catalog.stv_block_reps\"},{\"id\":\"stv_cursor_configuration\",\"label\":\"pg_catalog.stv_cursor_configuration\"},{\"id\":\"stv_interleaved_counts\",\"label\":\"pg_catalog.stv_interleaved_counts\"},{\"id\":\"stv_query_metrics\",\"label\":\"pg_catalog.stv_query_metrics\"},{\"id\":\"stl_query_metrics\",\"label\":\"pg_catalog.stl_query_metrics\"},{\"id\":\"stl_wlm_rule_action\",\"label\":\"pg_catalog.stl_wlm_rule_action\"},{\"id\":\"stv_startup_recovery_state\",\"label\":\"pg_catalog.stv_startup_recovery_state\"},{\"id\":\"stl_analyze\",\"label\":\"pg_catalog.stl_analyze\"},{\"id\":\"stl_analyze_compression\",\"label\":\"pg_catalog.stl_analyze_compression\"},{\"id\":\"stl_column_stats\",\"label\":\"pg_catalog.stl_column_stats\"},{\"id\":\"stv_wlm_qmr_config\",\"label\":\"pg_catalog.stv_wlm_qmr_config\"},{\"id\":\"stl_wlm_auto_concurrency\",\"label\":\"pg_catalog.stl_wlm_auto_concurrency\"},{\"id\":\"stl_rlf_scan\",\"label\":\"pg_catalog.stl_rlf_scan\"},{\"id\":\"stl_incremental_resize_state\",\"label\":\"pg_catalog.stl_incremental_resize_state\"},{\"id\":\"stl_commit_internal_stats\",\"label\":\"pg_catalog.stl_commit_internal_stats\"},{\"id\":\"stl_prefetch_stats\",\"label\":\"pg_catalog.stl_prefetch_stats\"},{\"id\":\"stl_tombstone\",\"label\":\"pg_catalog.stl_tombstone\"},{\"id\":\"svv_diskusage\",\"label\":\"pg_catalog.svv_disku', '[{\"id\":\"pg_database_info\",\"label\":\"pg_catalog.pg_database_info\"},{\"id\":\"pg_class_info\",\"label\":\"pg_catalog.pg_class_info\"},{\"id\":\"pg_default_acl\",\"label\":\"pg_catalog.pg_default_acl\"},{\"id\":\"pg_conf\",\"label\":\"pg_catalog.pg_conf\"},{\"id\":\"pg_library\",\"label\":\"pg_catalog.pg_library\"},{\"id\":\"pg_shdepend\",\"label\":\"pg_catalog.pg_shdepend\"},{\"id\":\"systable_globaldict\",\"label\":\"pg_catalog.systable_globaldict\"},{\"id\":\"systable_topology\",\"label\":\"pg_catalog.systable_topology\"},{\"id\":\"systable_schema\",\"label\":\"pg_catalog.systable_schema\"}]', 'SF', 'SnowFlake Dev', 'PUBLIC', 'Jobrr', 'completed'),
(3, 'RS', 'Amazon RedShift', '[{\"id\":\"pg_catalog\",\"label\":\"pg_catalog\"},{\"id\":\"public\",\"label\":\"public\"},{\"id\":\"information_schema\",\"label\":\"information_schema\"}]', '[{\"id\":\"test\",\"label\":\"test\"},{\"id\":\"pg_toast\",\"label\":\"pg_toast\"},{\"id\":\"pg_internal\",\"label\":\"pg_internal\"},{\"id\":\"pg_temp_1\",\"label\":\"pg_temp_1\"}]', 'null', '[{\"id\":\"php_test\",\"label\":\"test.php_test\"}]', 'SF', 'SnowFlake Dev', 'PUBLIC', 'job45', 'completed'),
(4, '', '', '', '', '', '', '', '', '', 'Job867', 'process'),
(5, '', '', '', '', '', '', '', '', '', 'Job354', 'process'),
(6, 'RS', 'Amazon RedShift', '[{\"id\":\"test\",\"label\":\"test\"},{\"id\":\"pg_toast\",\"label\":\"pg_toast\"},{\"id\":\"pg_internal\",\"label\":\"pg_internal\"}]', '[{\"id\":\"pg_temp_1\",\"label\":\"pg_temp_1\"},{\"id\":\"pg_catalog\",\"label\":\"pg_catalog\"},{\"id\":\"public\",\"label\":\"public\"},{\"id\":\"information_schema\",\"label\":\"information_schema\"}]', '[{\"id\":\"pg_user_info\",\"label\":\"pg_catalog.pg_user_info\"},{\"id\":\"pg_database_info\",\"label\":\"pg_catalog.pg_database_info\"},{\"id\":\"systable_schema\",\"label\":\"pg_catalog.systable_schema\"},{\"id\":\"padb_config_harvest\",\"label\":\"pg_catalog.padb_config_harvest\"},{\"id\":\"pg_external_schema\",\"label\":\"pg_catalog.pg_external_schema\"},{\"id\":\"pg_statistic\",\"label\":\"pg_catalog.pg_statistic\"},{\"id\":\"pg_settings\",\"label\":\"pg_catalog.pg_settings\"},{\"id\":\"pg_type\",\"label\":\"pg_catalog.pg_type\"},{\"id\":\"pg_attribute\",\"label\":\"pg_catalog.pg_attribute\"},{\"id\":\"pg_class\",\"label\":\"pg_catalog.pg_class\"},{\"id\":\"pg_tablespace\",\"label\":\"pg_catalog.pg_tablespace\"},{\"id\":\"pg_inherits\",\"label\":\"pg_catalog.pg_inherits\"},{\"id\":\"pg_index\",\"label\":\"pg_catalog.pg_index\"},{\"id\":\"pg_operator\",\"label\":\"pg_catalog.pg_operator\"},{\"id\":\"pg_opclass\",\"label\":\"pg_catalog.pg_opclass\"},{\"id\":\"pg_am\",\"label\":\"pg_catalog.pg_am\"},{\"id\":\"pg_amop\",\"label\":\"pg_catalog.pg_amop\"},{\"id\":\"pg_amproc\",\"label\":\"pg_catalog.pg_amproc\"},{\"id\":\"pg_language\",\"label\":\"pg_catalog.pg_language\"},{\"id\":\"pg_largeobject\",\"label\":\"pg_catalog.pg_largeobject\"},{\"id\":\"pg_aggregate\",\"label\":\"pg_catalog.pg_aggregate\"},{\"id\":\"pg_statistic_multicol\",\"label\":\"pg_catalog.pg_statistic_multicol\"},{\"id\":\"pg_trigger\",\"label\":\"pg_catalog.pg_trigger\"},{\"id\":\"pg_listener\",\"label\":\"pg_catalog.pg_listener\"},{\"id\":\"pg_cast\",\"label\":\"pg_catalog.pg_cast\"},{\"id\":\"pg_namespace\",\"label\":\"pg_catalog.pg_namespace\"},{\"id\":\"pg_conversion\",\"label\":\"pg_catalog.pg_conversion\"},{\"id\":\"pg_udf\",\"label\":\"pg_catalog.pg_udf\"},{\"id\":\"pg_bar_repos\",\"label\":\"pg_catalog.pg_bar_repos\"},{\"id\":\"pg_bar_state\",\"label\":\"pg_catalog.pg_bar_state\"},{\"id\":\"pg_depend\",\"label\":\"pg_catalog.pg_depend\"},{\"id\":\"pg_highwatermark\",\"label\":\"pg_catalog.pg_highwatermark\"},{\"id\":\"pg_resize\",\"label\":\"pg_catalog.pg_resize\"},{\"id\":\"pg_attrdef\",\"label\":\"pg_catalog.pg_attrdef\"},{\"id\":\"pg_constraint\",\"label\":\"pg_catalog.pg_constraint\"},{\"id\":\"pg_database\",\"label\":\"pg_catalog.pg_database\"},{\"id\":\"pg_description\",\"label\":\"pg_catalog.pg_description\"},{\"id\":\"pg_group\",\"label\":\"pg_catalog.pg_group\"},{\"id\":\"pg_proc\",\"label\":\"pg_catalog.pg_proc\"},{\"id\":\"pg_rewrite\",\"label\":\"pg_catalog.pg_rewrite\"},{\"id\":\"pg_bar_ddllog\",\"label\":\"pg_catalog.pg_bar_ddllog\"},{\"id\":\"pg_user\",\"label\":\"pg_catalog.pg_user\"},{\"id\":\"pg_rules\",\"label\":\"pg_catalog.pg_rules\"},{\"id\":\"pg_views\",\"label\":\"pg_catalog.pg_views\"},{\"id\":\"pg_tables\",\"label\":\"pg_catalog.pg_tables\"},{\"id\":\"pg_table_def\",\"label\":\"pg_catalog.pg_table_def\"},{\"id\":\"pg_indexes\",\"label\":\"pg_catalog.pg_indexes\"},{\"id\":\"pg_stats\",\"label\":\"pg_catalog.pg_stats\"},{\"id\":\"pg_stat_all_tables\",\"label\":\"pg_catalog.pg_stat_all_tables\"},{\"id\":\"pg_stat_sys_tables\",\"label\":\"pg_catalog.pg_stat_sys_tables\"},{\"id\":\"pg_stat_user_tables\",\"label\":\"pg_catalog.pg_stat_user_tables\"},{\"id\":\"pg_statio_all_tables\",\"label\":\"pg_catalog.pg_statio_all_tables\"},{\"id\":\"pg_statio_sys_tables\",\"label\":\"pg_catalog.pg_statio_sys_tables\"},{\"id\":\"pg_statio_user_tables\",\"label\":\"pg_catalog.pg_statio_user_tables\"},{\"id\":\"pg_stat_all_indexes\",\"label\":\"pg_catalog.pg_stat_all_indexes\"},{\"id\":\"pg_stat_sys_indexes\",\"label\":\"pg_catalog.pg_stat_sys_indexes\"},{\"id\":\"pg_stat_user_indexes\",\"label\":\"pg_catalog.pg_stat_user_indexes\"},{\"id\":\"pg_statio_all_indexes\",\"label\":\"pg_catalog.pg_statio_all_indexes\"},{\"id\":\"pg_statio_sys_indexes\",\"label\":\"pg_catalog.pg_statio_sys_indexes\"},{\"id\":\"pg_statio_user_indexes\",\"label\":\"pg_catalog.pg_statio_user_indexes\"},{\"id\":\"pg_statio_all_sequences\",\"label\":\"pg_catalog.pg_statio_all_sequences\"},{\"id\":\"pg_statio_sys_sequences\",\"label\":\"pg_catalog.pg_statio_sys_sequences\"},{\"id\":\"pg_statio_user_sequences\",\"label\":\"pg_catalog.pg_statio_user_sequences\"},{\"id\":\"pg_stat_activity\",\"label\":\"pg_catalog.pg_stat_activity\"},{\"id\":\"pg_stat_database\",\"label\":\"pg_catalog.pg_stat_database\"},{\"id\":\"pg_locks\",\"label\":\"pg_catalog.pg_locks\"},{\"id\":\"pg_test\",\"label\":\"pg_catalog.pg_test\"},{\"id\":\"information_schema_catalog_name\",\"label\":\"information_schema.information_schema_catalog_name\"},{\"id\":\"applicable_roles\",\"label\":\"information_schema.applicable_roles\"},{\"id\":\"check_constraints\",\"label\":\"information_schema.check_constraints\"},{\"id\":\"column_domain_usage\",\"label\":\"information_schema.column_domain_usage\"},{\"id\":\"column_privileges\",\"label\":\"information_schema.column_privileges\"},{\"id\":\"column_udt_usage\",\"label\":\"information_schema.column_udt_usage\"},{\"id\":\"columns\",\"label\":\"information_schema.columns\"},{\"id\":\"constraint_column_usage\",\"label\":\"information_schema.constraint_column_usage\"},{\"id\":\"constraint_table_usage\",\"label\":\"information_schema.constraint_table_usage\"},{\"id\":\"domain_constraints\",\"label\":\"information_schema.domain_constraints\"},{\"id\":\"domain_udt_usage\",\"label\":\"information_schema.domain_udt_usage\"},{\"id\":\"domains\",\"label\":\"information_schema.domains\"},{\"id\":\"enabled_roles\",\"label\":\"information_schema.enabled_roles\"},{\"id\":\"key_column_usage\",\"label\":\"information_schema.key_column_usage\"},{\"id\":\"parameters\",\"label\":\"information_schema.parameters\"},{\"id\":\"referential_constraints\",\"label\":\"information_schema.referential_constraints\"},{\"id\":\"role_column_grants\",\"label\":\"information_schema.role_column_grants\"},{\"id\":\"role_routine_grants\",\"label\":\"information_schema.role_routine_grants\"},{\"id\":\"role_table_grants\",\"label\":\"information_schema.role_table_grants\"},{\"id\":\"role_usage_grants\",\"label\":\"information_schema.role_usage_grants\"},{\"id\":\"routine_privileges\",\"label\":\"information_schema.routine_privileges\"},{\"id\":\"routines\",\"label\":\"information_schema.routines\"},{\"id\":\"schemata\",\"label\":\"information_schema.schemata\"},{\"id\":\"sql_features\",\"label\":\"information_schema.sql_features\"},{\"id\":\"sql_implementation_info\",\"label\":\"information_schema.sql_implementation_info\"},{\"id\":\"sql_languages\",\"label\":\"information_schema.sql_languages\"},{\"id\":\"sql_packages\",\"label\":\"information_schema.sql_packages\"},{\"id\":\"sql_sizing\",\"label\":\"information_schema.sql_sizing\"},{\"id\":\"sql_sizing_profiles\",\"label\":\"information_schema.sql_sizing_profiles\"},{\"id\":\"table_constraints\",\"label\":\"information_schema.table_constraints\"},{\"id\":\"table_privileges\",\"label\":\"information_schema.table_privileges\"},{\"id\":\"tables\",\"label\":\"information_schema.tables\"},{\"id\":\"triggered_update_columns\",\"label\":\"information_schema.triggered_update_columns\"},{\"id\":\"triggers\",\"label\":\"information_schema.triggers\"},{\"id\":\"usage_privileges\",\"label\":\"information_schema.usage_privileges\"},{\"id\":\"view_column_usage\",\"label\":\"information_schema.view_column_usage\"},{\"id\":\"view_table_usage\",\"label\":\"information_schema.view_table_usage\"},{\"id\":\"views\",\"label\":\"information_schema.views\"},{\"id\":\"data_type_privileges\",\"label\":\"information_schema.data_type_privileges\"},{\"id\":\"element_types\",\"label\":\"information_schema.element_types\"},{\"id\":\"pg_statistic_indicator\",\"label\":\"pg_catalog.pg_statistic_indicator\"},{\"id\":\"pg_proc_info\",\"label\":\"pg_catalog.pg_proc_info\"},{\"id\":\"stl_commit_stats\",\"label\":\"pg_catalog.stl_commit_stats\"},{\"id\":\"stl_connection_log\",\"label\":\"pg_catalog.stl_connection_log\"},{\"id\":\"stl_userlog\",\"label\":\"pg_catalog.stl_userlog\"},{\"id\":\"stl_alert_event_log\",\"label\":\"pg_catalog.stl_alert_event_log\"},{\"id\":\"stl_ddltext\",\"label\":\"pg_catalog.stl_ddltext\"},{\"id\":\"stl_error\",\"label\":\"pg_catalog.stl_error\"},{\"id\":\"stl_explain\",\"label\":\"pg_catalog.stl_explain\"},{\"id\":\"stl_file_scan\",\"label\":\"pg_catalog.stl_file_scan\"},{\"id\":\"stl_load_commits\",\"label\":\"pg_catalog.stl_load_commits\"},{\"id\":\"stl_loaderror_detail\",\"label\":\"pg_catalog.stl_loaderror_detail\"},{\"id\":\"stl_load_errors\",\"label\":\"pg_catalog.stl_load_errors\"},{\"id\":\"stl_load_trace\",\"label\":\"pg_catalog.stl_load_trace\"},{\"id\":\"stl_plan_info\",\"label\":\"pg_catalog.stl_plan_info\"},{\"id\":\"stl_querytext\",\"label\":\"pg_catalog.stl_querytext\"},{\"id\":\"stl_replacements\",\"label\":\"pg_catalog.stl_replacements\"},{\"id\":\"stl_s3client\",\"label\":\"pg_catalog.stl_s3client\"},{\"id\":\"stl_s3client_error\",\"label\":\"pg_catalog.stl_s3client_error\"},{\"id\":\"stl_sshclient_error\",\"label\":\"pg_catalog.stl_sshclient_error\"},{\"id\":\"stl_sessions\",\"label\":\"pg_catalog.stl_sessions\"},{\"id\":\"stl_stream_segs\",\"label\":\"pg_catalog.stl_stream_segs\"},{\"id\":\"stl_tr_conflict\",\"label\":\"pg_catalog.stl_tr_conflict\"},{\"id\":\"stl_udf_compile_error\",\"label\":\"pg_catalog.stl_udf_compile_error\"},{\"id\":\"stl_undone\",\"label\":\"pg_catalog.stl_undone\"},{\"id\":\"stl_utilitytext\",\"label\":\"pg_catalog.stl_utilitytext\"},{\"id\":\"stl_vacuum_detail\",\"label\":\"pg_catalog.stl_vacuum_detail\"},{\"id\":\"stl_vacuum\",\"label\":\"pg_catalog.stl_vacuum\"},{\"id\":\"stl_warning\",\"label\":\"pg_catalog.stl_warning\"},{\"id\":\"stl_wlm_error\",\"label\":\"pg_catalog.stl_wlm_error\"},{\"id\":\"stl_wlm_query\",\"label\":\"pg_catalog.stl_wlm_query\"},{\"id\":\"stl_restarted_sessions\",\"label\":\"pg_catalog.stl_restarted_sessions\"},{\"id\":\"stl_disk_full_diag\",\"label\":\"pg_catalog.stl_disk_full_diag\"},{\"id\":\"stv_blocklist\",\"label\":\"pg_catalog.stv_blocklist\"},{\"id\":\"stv_exec_state\",\"label\":\"pg_catalog.stv_exec_state\"},{\"id\":\"stv_inflight\",\"label\":\"pg_catalog.stv_inflight\"},{\"id\":\"stv_load_state\",\"label\":\"pg_catalog.stv_load_state\"},{\"id\":\"stv_locks\",\"label\":\"pg_catalog.stv_locks\"},{\"id\":\"stv_partitions\",\"label\":\"pg_catalog.stv_partitions\"},{\"id\":\"stv_proc_stat\",\"label\":\"pg_catalog.stv_proc_stat\"},{\"id\":\"stv_recents\",\"label\":\"pg_catalog.stv_recents\"},{\"id\":\"stv_sessions\",\"label\":\"pg_catalog.stv_sessions\"},{\"id\":\"stv_slices\",\"label\":\"pg_catalog.stv_slices\"},{\"id\":\"stv_table_partitions\",\"label\":\"pg_catalog.stv_table_partitions\"},{\"id\":\"stv_table_partition_summary\",\"label\":\"pg_catalog.stv_table_partition_summary\"},{\"id\":\"stv_tbl_perm\",\"label\":\"pg_catalog.stv_tbl_perm\"},{\"id\":\"stv_tbl_trans\",\"label\":\"pg_catalog.stv_tbl_trans\"},{\"id\":\"stv_underrepped_blocks\",\"label\":\"pg_catalog.stv_underrepped_blocks\"},{\"id\":\"stv_wlm_classification_config\",\"label\":\"pg_catalog.stv_wlm_classification_config\"},{\"id\":\"stv_wlm_query_queue_state\",\"label\":\"pg_catalog.stv_wlm_query_queue_state\"},{\"id\":\"stv_wlm_query_state\",\"label\":\"pg_catalog.stv_wlm_query_state\"},{\"id\":\"stv_wlm_query_task_state\",\"label\":\"pg_catalog.st', '[{\"id\":\"pg_class_info\",\"label\":\"pg_catalog.pg_class_info\"},{\"id\":\"pg_default_acl\",\"label\":\"pg_catalog.pg_default_acl\"},{\"id\":\"pg_conf\",\"label\":\"pg_catalog.pg_conf\"},{\"id\":\"pg_library\",\"label\":\"pg_catalog.pg_library\"},{\"id\":\"pg_shdepend\",\"label\":\"pg_catalog.pg_shdepend\"},{\"id\":\"systable_globaldict\",\"label\":\"pg_catalog.systable_globaldict\"},{\"id\":\"systable_topology\",\"label\":\"pg_catalog.systable_topology\"}]', 'SF', 'SnowFlake Dev', 'PUBLIC', 'Job354', 'completed'),
(7, '', '', '', '', '', '', '', '', '', 'Jongdas', 'process'),
(8, '', '', '', '', '', '', '', '', '', 'zXczAXc', 'process'),
(9, 'ORA2', 'Oracle', '[{\"id\":\"C2C1\",\"label\":\"C2C1\"},{\"id\":\"APEX_040200\",\"label\":\"APEX_040200\"},{\"id\":\"APEX_PUBLIC_USER\",\"label\":\"APEX_PUBLIC_USER\"},{\"id\":\"FLOWS_FILES\",\"label\":\"FLOWS_FILES\"},{\"id\":\"LBACSYS\",\"label\":\"LBACSYS\"},{\"id\":\"SPATIAL_CSW_ADMIN_USR\",\"label\":\"SPATIAL_CSW_ADMIN_USR\"},{\"id\":\"SPATIAL_WFS_ADMIN_USR\",\"label\":\"SPATIAL_WFS_ADMIN_USR\"},{\"id\":\"MDDATA\",\"label\":\"MDDATA\"},{\"id\":\"OLAPSYS\",\"label\":\"OLAPSYS\"},{\"id\":\"DVSYS\",\"label\":\"DVSYS\"},{\"id\":\"SI_INFORMTN_SCHEMA\",\"label\":\"SI_INFORMTN_SCHEMA\"},{\"id\":\"ORDPLUGINS\",\"label\":\"ORDPLUGINS\"},{\"id\":\"ORDDATA\",\"label\":\"ORDDATA\"},{\"id\":\"ORDSYS\",\"label\":\"ORDSYS\"},{\"id\":\"CTXSYS\",\"label\":\"CTXSYS\"},{\"id\":\"OJVMSYS\",\"label\":\"OJVMSYS\"},{\"id\":\"WMSYS\",\"label\":\"WMSYS\"},{\"id\":\"GSMCATUSER\",\"label\":\"GSMCATUSER\"},{\"id\":\"MDSYS\",\"label\":\"MDSYS\"},{\"id\":\"ANONYMOUS\",\"label\":\"ANONYMOUS\"},{\"id\":\"XDB\",\"label\":\"XDB\"},{\"id\":\"APPQOSSYS\",\"label\":\"APPQOSSYS\"},{\"id\":\"DBSNMP\",\"label\":\"DBSNMP\"},{\"id\":\"ORACLE_OCM\",\"label\":\"ORACLE_OCM\"},{\"id\":\"DIP\",\"label\":\"DIP\"},{\"id\":\"GSMUSER\",\"label\":\"GSMUSER\"},{\"id\":\"GSMADMIN_INTERNAL\",\"label\":\"GSMADMIN_INTERNAL\"},{\"id\":\"XS$NULL\",\"label\":\"XS$NULL\"},{\"id\":\"OUTLN\",\"label\":\"OUTLN\"},{\"id\":\"SYSKM\",\"label\":\"SYSKM\"},{\"id\":\"SYSDG\",\"label\":\"SYSDG\"},{\"id\":\"SYSBACKUP\",\"label\":\"SYSBACKUP\"},{\"id\":\"SYSTEM\",\"label\":\"SYSTEM\"},{\"id\":\"AUDSYS\",\"label\":\"AUDSYS\"},{\"id\":\"SYS\",\"label\":\"SYS\"}]', '[{\"id\":\"C2C\",\"label\":\"C2C\"},{\"id\":\"DEMO\",\"label\":\"DEMO\"},{\"id\":\"SCOTT\",\"label\":\"SCOTT\"},{\"id\":\"OE\",\"label\":\"OE\"},{\"id\":\"PM\",\"label\":\"PM\"},{\"id\":\"SH\",\"label\":\"SH\"},{\"id\":\"IX\",\"label\":\"IX\"},{\"id\":\"HR\",\"label\":\"HR\"},{\"id\":\"BI\",\"label\":\"BI\"},{\"id\":\"DVF\",\"label\":\"DVF\"}]', '[{\"id\":\"REGIONS\",\"label\":\"HR.REGIONS\"},{\"id\":\"TIMES\",\"label\":\"SH.TIMES\"},{\"id\":\"WAREHOUSES\",\"label\":\"OE.WAREHOUSES\"},{\"id\":\"GL\",\"label\":\"DEMO.GL\"},{\"id\":\"ACCOUNT_REP\",\"label\":\"C2C.ACCOUNT_REP\"},{\"id\":\"BILL_TO_SHIP_TO__C_REP\",\"label\":\"C2C.BILL_TO_SHIP_TO__C_REP\"},{\"id\":\"DEAL_DESK_REVIEW__C_REP\",\"label\":\"C2C.DEAL_DESK_REVIEW__C_REP\"},{\"id\":\"LEAD_REP\",\"label\":\"C2C.LEAD_REP\"},{\"id\":\"OBJECT_ACTION__C_REP\",\"label\":\"C2C.OBJECT_ACTION__C_REP\"},{\"id\":\"OPPORTUNITYCONTACTROLE_REP\",\"label\":\"C2C.OPPORTUNITYCONTACTROLE_REP\"},{\"id\":\"PRODUCTS_REP\",\"label\":\"C2C.PRODUCTS_REP\"},{\"id\":\"VSOE_LINE_ITEM_REP\",\"label\":\"C2C.VSOE_LINE_ITEM_REP\"},{\"id\":\"COUNTRIES\",\"label\":\"HR.COUNTRIES\"},{\"id\":\"EMPLOYEES\",\"label\":\"HR.EMPLOYEES\"},{\"id\":\"AQ$_ORDERS_QUEUETABLE_L\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_L\"},{\"id\":\"AQ$_ORDERS_QUEUETABLE_S\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_S\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_I\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_I\"},{\"id\":\"COUNTRIES\",\"label\":\"SH.COUNTRIES\"},{\"id\":\"FWEEK_PSCAT_SALES_MV\",\"label\":\"SH.FWEEK_PSCAT_SALES_MV\"},{\"id\":\"TEXTDOCS_NESTEDTAB\",\"label\":\"PM.TEXTDOCS_NESTEDTAB\"},{\"id\":\"INVENTORIES\",\"label\":\"OE.INVENTORIES\"},{\"id\":\"ORDERS\",\"label\":\"OE.ORDERS\"},{\"id\":\"ORDER_ITEMS\",\"label\":\"OE.ORDER_ITEMS\"},{\"id\":\"PRODUCT_REF_LIST_NESTEDTAB\",\"label\":\"OE.PRODUCT_REF_LIST_NESTEDTAB\"},{\"id\":\"SUBCATEGORY_REF_LIST_NESTEDTAB\",\"label\":\"OE.SUBCATEGORY_REF_LIST_NESTEDTAB\"},{\"id\":\"BONUS\",\"label\":\"SCOTT.BONUS\"},{\"id\":\"SALGRADE\",\"label\":\"SCOTT.SALGRADE\"},{\"id\":\"VSOE_LINE_ITEM_REP\",\"label\":\"DEMO.VSOE_LINE_ITEM_REP\"},{\"id\":\"APTTUS_CONFIG2_ASTLNITM__C_REP\",\"label\":\"C2C.APTTUS_CONFIG2_ASTLNITM__C_REP\"},{\"id\":\"APTTUS_PRODATTRB_VALUE_REP\",\"label\":\"C2C.APTTUS_PRODATTRB_VALUE_REP\"},{\"id\":\"CONTACT_REP\",\"label\":\"C2C.CONTACT_REP\"},{\"id\":\"DEAL_DESK_PROPOSAL_REP\",\"label\":\"C2C.DEAL_DESK_PROPOSAL_REP\"},{\"id\":\"OPPORTUNITY_TEAMMEMBER_REP\",\"label\":\"C2C.OPPORTUNITY_TEAMMEMBER_REP\"},{\"id\":\"STAGE_OBJECTIVE__C_REP\",\"label\":\"C2C.STAGE_OBJECTIVE__C_REP\"},{\"id\":\"USERROLE_REP\",\"label\":\"C2C.USERROLE_REP\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_L\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_L\"},{\"id\":\"DR$SUP_TEXT_IDX$N\",\"label\":\"SH.DR$SUP_TEXT_IDX$N\"},{\"id\":\"SALES_TRANSACTIONS_EXT\",\"label\":\"SH.SALES_TRANSACTIONS_EXT\"},{\"id\":\"SUPPLEMENTARY_DEMOGRAPHICS\",\"label\":\"SH.SUPPLEMENTARY_DEMOGRAPHICS\"},{\"id\":\"PRINT_MEDIA\",\"label\":\"PM.PRINT_MEDIA\"},{\"id\":\"EMP\",\"label\":\"SCOTT.EMP\"},{\"id\":\"APPTTUS_APRVL_APRVL_RQST_C_REP\",\"label\":\"C2C.APPTTUS_APRVL_APRVL_RQST_C_REP\"},{\"id\":\"CAMPAIGN_REP\",\"label\":\"C2C.CAMPAIGN_REP\"},{\"id\":\"GROUP_REP\",\"label\":\"C2C.GROUP_REP\"},{\"id\":\"RECORDTYPE_REP\",\"label\":\"C2C.RECORDTYPE_REP\"},{\"id\":\"WHAT_IF_HIERARCHYDATA_0912\",\"label\":\"C2C.WHAT_IF_HIERARCHYDATA_0912\"},{\"id\":\"DEPARTMENTS\",\"label\":\"HR.DEPARTMENTS\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_S\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_S\"},{\"id\":\"DIMENSION_EXCEPTIONS\",\"label\":\"SH.DIMENSION_EXCEPTIONS\"},{\"id\":\"PRODUCT_INFORMATION\",\"label\":\"OE.PRODUCT_INFORMATION\"},{\"id\":\"PURCHASEORDER\",\"label\":\"OE.PURCHASEORDER\"},{\"id\":\"DEPT\",\"label\":\"SCOTT.DEPT\"},{\"id\":\"CONFIGSNOWFLAKEEBP\",\"label\":\"DEMO.CONFIGSNOWFLAKEEBP\"},{\"id\":\"GL_BALANCE_DATA\",\"label\":\"DEMO.GL_BALANCE_DATA\"},{\"id\":\"APPTUS_PROPSL2_LINEITM_C_REP\",\"label\":\"C2C.APPTUS_PROPSL2_LINEITM_C_REP\"},{\"id\":\"LOCATIONS\",\"label\":\"HR.LOCATIONS\"},{\"id\":\"AQ$_ORDERS_QUEUETABLE_T\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_T\"},{\"id\":\"CAL_MONTH_SALES_MV\",\"label\":\"SH.CAL_MONTH_SALES_MV\"},{\"id\":\"COSTS\",\"label\":\"SH.COSTS\"},{\"id\":\"DR$SUP_TEXT_IDX$I\",\"label\":\"SH.DR$SUP_TEXT_IDX$I\"},{\"id\":\"CONFIG_TABLE_COPY_EBP\",\"label\":\"DEMO.CONFIG_TABLE_COPY_EBP\"},{\"id\":\"APTTUS_PROPOSAL2_C_REP\",\"label\":\"C2C.APTTUS_PROPOSAL2_C_REP\"},{\"id\":\"EVENT_REP\",\"label\":\"C2C.EVENT_REP\"},{\"id\":\"OPPORTUNITYFIELDHISTORY_REP\",\"label\":\"C2C.OPPORTUNITYFIELDHISTORY_REP\"},{\"id\":\"OPPORTUNITYSPLITTYPE_REP\",\"label\":\"C2C.OPPORTUNITYSPLITTYPE_REP\"},{\"id\":\"OPPORTUNITYSPLIT_REP\",\"label\":\"C2C.OPPORTUNITYSPLIT_REP\"},{\"id\":\"OPPORTUNITY_REP\",\"label\":\"C2C.OPPORTUNITY_REP\"},{\"id\":\"PARTNER_REP\",\"label\":\"C2C.PARTNER_REP\"}]', '[{\"id\":\"AQ$_ORDERS_QUEUETABLE_H\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_H\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_G\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_G\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_T\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_T\"},{\"id\":\"ONLINE_MEDIA\",\"label\":\"PM.ONLINE_MEDIA\"},{\"id\":\"CATEGORIES_TAB\",\"label\":\"OE.CATEGORIES_TAB\"},{\"id\":\"PROMOTIONS\",\"label\":\"OE.PROMOTIONS\"},{\"id\":\"OPPORTUNITYSTAGE_REP\",\"label\":\"C2C.OPPORTUNITYSTAGE_REP\"},{\"id\":\"TASK_REP\",\"label\":\"C2C.TASK_REP\"},{\"id\":\"WHAT_IF_HIERARCHYDATA_BKP\",\"label\":\"C2C.WHAT_IF_HIERARCHYDATA_BKP\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_C\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_C\"},{\"id\":\"ORDERS_QUEUETABLE\",\"label\":\"IX.ORDERS_QUEUETABLE\"},{\"id\":\"CHANNELS\",\"label\":\"SH.CHANNELS\"},{\"id\":\"DR$SUP_TEXT_IDX$R\",\"label\":\"SH.DR$SUP_TEXT_IDX$R\"},{\"id\":\"PRODUCTS\",\"label\":\"SH.PRODUCTS\"},{\"id\":\"SALES\",\"label\":\"SH.SALES\"},{\"id\":\"CUSTOMERS\",\"label\":\"OE.CUSTOMERS\"},{\"id\":\"PRODUCT_DESCRIPTIONS\",\"label\":\"OE.PRODUCT_DESCRIPTIONS\"},{\"id\":\"OPPORTUNITYLINEITEM_REP\",\"label\":\"C2C.OPPORTUNITYLINEITEM_REP\"},{\"id\":\"WHAT_IF_HIERARCHYDATA\",\"label\":\"C2C.WHAT_IF_HIERARCHYDATA\"},{\"id\":\"JOBS\",\"label\":\"HR.JOBS\"},{\"id\":\"JOB_HISTORY\",\"label\":\"HR.JOB_HISTORY\"},{\"id\":\"AQ$_ORDERS_QUEUETABLE_I\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_I\"},{\"id\":\"AQ$_STREAMS_QUEUE_TABLE_H\",\"label\":\"IX.AQ$_STREAMS_QUEUE_TABLE_H\"},{\"id\":\"STREAMS_QUEUE_TABLE\",\"label\":\"IX.STREAMS_QUEUE_TABLE\"},{\"id\":\"SYS_IOT_OVER_92380\",\"label\":\"IX.SYS_IOT_OVER_92380\"},{\"id\":\"ACTION_TABLE\",\"label\":\"OE.ACTION_TABLE\"},{\"id\":\"LINEITEM_TABLE\",\"label\":\"OE.LINEITEM_TABLE\"},{\"id\":\"APTTUS_CON_PRICELISTITEM_REP\",\"label\":\"C2C.APTTUS_CON_PRICELISTITEM_REP\"},{\"id\":\"CAMPAIGNMEMBER_REP\",\"label\":\"C2C.CAMPAIGNMEMBER_REP\"},{\"id\":\"CUSTOMER_IMPLEMENTATION_REP\",\"label\":\"C2C.CUSTOMER_IMPLEMENTATION_REP\"},{\"id\":\"SC_ACTIVITY_REP\",\"label\":\"C2C.SC_ACTIVITY_REP\"},{\"id\":\"USER_REP\",\"label\":\"C2C.USER_REP\"},{\"id\":\"VERSION_COMMENTS\",\"label\":\"C2C.VERSION_COMMENTS\"},{\"id\":\"AQ$_ORDERS_QUEUETABLE_G\",\"label\":\"IX.AQ$_ORDERS_QUEUETABLE_G\"},{\"id\":\"SYS_IOT_OVER_92391\",\"label\":\"IX.SYS_IOT_OVER_92391\"},{\"id\":\"DR$SUP_TEXT_IDX$K\",\"label\":\"SH.DR$SUP_TEXT_IDX$K\"}]', 'SF', 'SnowFlake Dev', 'PUBLIC', 'asdfasdf', 'completed'),
(10, '', '', '', '', '', '', '', '', '', 'Job-demo', 'process'),
(11, '', '', '', '', '', '', '', '', '', 'sfasfsdfa', 'process'),
(12, '', '', '', '', '', '', '', '', '', 'asdfasd', 'process'),
(13, '', '', '', '', '', '', '', '', '', 'zxcvzxcv', 'process'),
(14, 'RS', 'Amazon RedShift', '[{\"id\":\"test\",\"label\":\"test\"},{\"id\":\"information_schema\",\"label\":\"information_schema\"}]', '[{\"id\":\"pg_toast\",\"label\":\"pg_toast\"},{\"id\":\"pg_internal\",\"label\":\"pg_internal\"},{\"id\":\"pg_temp_1\",\"label\":\"pg_temp_1\"},{\"id\":\"pg_catalog\",\"label\":\"pg_catalog\"},{\"id\":\"public\",\"label\":\"public\"}]', '[{\"id\":\"pg_user_info\",\"label\":\"pg_catalog.pg_user_info\"},{\"id\":\"pg_statistic\",\"label\":\"pg_catalog.pg_statistic\"},{\"id\":\"pg_settings\",\"label\":\"pg_catalog.pg_settings\"},{\"id\":\"pg_type\",\"label\":\"pg_catalog.pg_type\"},{\"id\":\"pg_attribute\",\"label\":\"pg_catalog.pg_attribute\"},{\"id\":\"pg_class\",\"label\":\"pg_catalog.pg_class\"},{\"id\":\"pg_tablespace\",\"label\":\"pg_catalog.pg_tablespace\"},{\"id\":\"pg_inherits\",\"label\":\"pg_catalog.pg_inherits\"},{\"id\":\"pg_index\",\"label\":\"pg_catalog.pg_index\"},{\"id\":\"pg_operator\",\"label\":\"pg_catalog.pg_operator\"},{\"id\":\"pg_opclass\",\"label\":\"pg_catalog.pg_opclass\"},{\"id\":\"pg_am\",\"label\":\"pg_catalog.pg_am\"},{\"id\":\"pg_amop\",\"label\":\"pg_catalog.pg_amop\"},{\"id\":\"pg_amproc\",\"label\":\"pg_catalog.pg_amproc\"},{\"id\":\"pg_language\",\"label\":\"pg_catalog.pg_language\"},{\"id\":\"pg_largeobject\",\"label\":\"pg_catalog.pg_largeobject\"},{\"id\":\"pg_aggregate\",\"label\":\"pg_catalog.pg_aggregate\"},{\"id\":\"pg_statistic_multicol\",\"label\":\"pg_catalog.pg_statistic_multicol\"},{\"id\":\"pg_trigger\",\"label\":\"pg_catalog.pg_trigger\"},{\"id\":\"pg_listener\",\"label\":\"pg_catalog.pg_listener\"},{\"id\":\"pg_cast\",\"label\":\"pg_catalog.pg_cast\"},{\"id\":\"pg_namespace\",\"label\":\"pg_catalog.pg_namespace\"},{\"id\":\"pg_conversion\",\"label\":\"pg_catalog.pg_conversion\"},{\"id\":\"pg_udf\",\"label\":\"pg_catalog.pg_udf\"},{\"id\":\"pg_bar_repos\",\"label\":\"pg_catalog.pg_bar_repos\"},{\"id\":\"pg_bar_state\",\"label\":\"pg_catalog.pg_bar_state\"},{\"id\":\"pg_depend\",\"label\":\"pg_catalog.pg_depend\"},{\"id\":\"pg_highwatermark\",\"label\":\"pg_catalog.pg_highwatermark\"},{\"id\":\"pg_resize\",\"label\":\"pg_catalog.pg_resize\"},{\"id\":\"pg_attrdef\",\"label\":\"pg_catalog.pg_attrdef\"},{\"id\":\"pg_constraint\",\"label\":\"pg_catalog.pg_constraint\"},{\"id\":\"pg_database\",\"label\":\"pg_catalog.pg_database\"},{\"id\":\"pg_description\",\"label\":\"pg_catalog.pg_description\"},{\"id\":\"pg_group\",\"label\":\"pg_catalog.pg_group\"},{\"id\":\"pg_proc\",\"label\":\"pg_catalog.pg_proc\"},{\"id\":\"pg_rewrite\",\"label\":\"pg_catalog.pg_rewrite\"},{\"id\":\"pg_bar_ddllog\",\"label\":\"pg_catalog.pg_bar_ddllog\"},{\"id\":\"pg_user\",\"label\":\"pg_catalog.pg_user\"},{\"id\":\"pg_rules\",\"label\":\"pg_catalog.pg_rules\"},{\"id\":\"pg_views\",\"label\":\"pg_catalog.pg_views\"},{\"id\":\"pg_tables\",\"label\":\"pg_catalog.pg_tables\"},{\"id\":\"pg_table_def\",\"label\":\"pg_catalog.pg_table_def\"},{\"id\":\"pg_indexes\",\"label\":\"pg_catalog.pg_indexes\"},{\"id\":\"pg_stats\",\"label\":\"pg_catalog.pg_stats\"},{\"id\":\"pg_stat_all_tables\",\"label\":\"pg_catalog.pg_stat_all_tables\"},{\"id\":\"pg_stat_sys_tables\",\"label\":\"pg_catalog.pg_stat_sys_tables\"},{\"id\":\"pg_stat_user_tables\",\"label\":\"pg_catalog.pg_stat_user_tables\"},{\"id\":\"pg_statio_all_tables\",\"label\":\"pg_catalog.pg_statio_all_tables\"},{\"id\":\"pg_statio_sys_tables\",\"label\":\"pg_catalog.pg_statio_sys_tables\"},{\"id\":\"pg_statio_user_tables\",\"label\":\"pg_catalog.pg_statio_user_tables\"},{\"id\":\"pg_stat_all_indexes\",\"label\":\"pg_catalog.pg_stat_all_indexes\"},{\"id\":\"pg_stat_sys_indexes\",\"label\":\"pg_catalog.pg_stat_sys_indexes\"},{\"id\":\"pg_stat_user_indexes\",\"label\":\"pg_catalog.pg_stat_user_indexes\"},{\"id\":\"pg_statio_all_indexes\",\"label\":\"pg_catalog.pg_statio_all_indexes\"},{\"id\":\"pg_statio_sys_indexes\",\"label\":\"pg_catalog.pg_statio_sys_indexes\"},{\"id\":\"pg_statio_user_indexes\",\"label\":\"pg_catalog.pg_statio_user_indexes\"},{\"id\":\"pg_statio_all_sequences\",\"label\":\"pg_catalog.pg_statio_all_sequences\"},{\"id\":\"pg_statio_sys_sequences\",\"label\":\"pg_catalog.pg_statio_sys_sequences\"},{\"id\":\"pg_statio_user_sequences\",\"label\":\"pg_catalog.pg_statio_user_sequences\"},{\"id\":\"pg_stat_activity\",\"label\":\"pg_catalog.pg_stat_activity\"},{\"id\":\"pg_stat_database\",\"label\":\"pg_catalog.pg_stat_database\"},{\"id\":\"pg_locks\",\"label\":\"pg_catalog.pg_locks\"},{\"id\":\"pg_test\",\"label\":\"pg_catalog.pg_test\"},{\"id\":\"pg_statistic_indicator\",\"label\":\"pg_catalog.pg_statistic_indicator\"},{\"id\":\"pg_proc_info\",\"label\":\"pg_catalog.pg_proc_info\"},{\"id\":\"stl_commit_stats\",\"label\":\"pg_catalog.stl_commit_stats\"},{\"id\":\"stl_connection_log\",\"label\":\"pg_catalog.stl_connection_log\"},{\"id\":\"stl_userlog\",\"label\":\"pg_catalog.stl_userlog\"},{\"id\":\"stl_alert_event_log\",\"label\":\"pg_catalog.stl_alert_event_log\"},{\"id\":\"stl_ddltext\",\"label\":\"pg_catalog.stl_ddltext\"},{\"id\":\"stl_error\",\"label\":\"pg_catalog.stl_error\"},{\"id\":\"stl_explain\",\"label\":\"pg_catalog.stl_explain\"},{\"id\":\"stl_file_scan\",\"label\":\"pg_catalog.stl_file_scan\"},{\"id\":\"stl_load_commits\",\"label\":\"pg_catalog.stl_load_commits\"},{\"id\":\"stl_loaderror_detail\",\"label\":\"pg_catalog.stl_loaderror_detail\"},{\"id\":\"stl_load_errors\",\"label\":\"pg_catalog.stl_load_errors\"},{\"id\":\"stl_load_trace\",\"label\":\"pg_catalog.stl_load_trace\"},{\"id\":\"stl_plan_info\",\"label\":\"pg_catalog.stl_plan_info\"},{\"id\":\"stl_querytext\",\"label\":\"pg_catalog.stl_querytext\"},{\"id\":\"stl_replacements\",\"label\":\"pg_catalog.stl_replacements\"},{\"id\":\"stl_s3client\",\"label\":\"pg_catalog.stl_s3client\"},{\"id\":\"stl_s3client_error\",\"label\":\"pg_catalog.stl_s3client_error\"},{\"id\":\"stl_sshclient_error\",\"label\":\"pg_catalog.stl_sshclient_error\"},{\"id\":\"stl_sessions\",\"label\":\"pg_catalog.stl_sessions\"},{\"id\":\"stl_stream_segs\",\"label\":\"pg_catalog.stl_stream_segs\"},{\"id\":\"stl_tr_conflict\",\"label\":\"pg_catalog.stl_tr_conflict\"},{\"id\":\"stl_udf_compile_error\",\"label\":\"pg_catalog.stl_udf_compile_error\"},{\"id\":\"stl_undone\",\"label\":\"pg_catalog.stl_undone\"},{\"id\":\"stl_utilitytext\",\"label\":\"pg_catalog.stl_utilitytext\"},{\"id\":\"stl_vacuum_detail\",\"label\":\"pg_catalog.stl_vacuum_detail\"},{\"id\":\"stl_vacuum\",\"label\":\"pg_catalog.stl_vacuum\"},{\"id\":\"stl_warning\",\"label\":\"pg_catalog.stl_warning\"},{\"id\":\"stl_wlm_error\",\"label\":\"pg_catalog.stl_wlm_error\"},{\"id\":\"stl_wlm_query\",\"label\":\"pg_catalog.stl_wlm_query\"},{\"id\":\"stl_restarted_sessions\",\"label\":\"pg_catalog.stl_restarted_sessions\"},{\"id\":\"stl_disk_full_diag\",\"label\":\"pg_catalog.stl_disk_full_diag\"},{\"id\":\"stv_blocklist\",\"label\":\"pg_catalog.stv_blocklist\"},{\"id\":\"stv_exec_state\",\"label\":\"pg_catalog.stv_exec_state\"},{\"id\":\"stv_inflight\",\"label\":\"pg_catalog.stv_inflight\"},{\"id\":\"stv_load_state\",\"label\":\"pg_catalog.stv_load_state\"},{\"id\":\"stv_locks\",\"label\":\"pg_catalog.stv_locks\"},{\"id\":\"stv_partitions\",\"label\":\"pg_catalog.stv_partitions\"},{\"id\":\"stv_proc_stat\",\"label\":\"pg_catalog.stv_proc_stat\"},{\"id\":\"stv_recents\",\"label\":\"pg_catalog.stv_recents\"},{\"id\":\"stv_sessions\",\"label\":\"pg_catalog.stv_sessions\"},{\"id\":\"stv_slices\",\"label\":\"pg_catalog.stv_slices\"},{\"id\":\"stv_table_partitions\",\"label\":\"pg_catalog.stv_table_partitions\"},{\"id\":\"stv_table_partition_summary\",\"label\":\"pg_catalog.stv_table_partition_summary\"},{\"id\":\"stv_tbl_perm\",\"label\":\"pg_catalog.stv_tbl_perm\"},{\"id\":\"stv_tbl_trans\",\"label\":\"pg_catalog.stv_tbl_trans\"},{\"id\":\"stv_underrepped_blocks\",\"label\":\"pg_catalog.stv_underrepped_blocks\"},{\"id\":\"stv_wlm_classification_config\",\"label\":\"pg_catalog.stv_wlm_classification_config\"},{\"id\":\"stv_wlm_query_queue_state\",\"label\":\"pg_catalog.stv_wlm_query_queue_state\"},{\"id\":\"stv_wlm_query_state\",\"label\":\"pg_catalog.stv_wlm_query_state\"},{\"id\":\"stv_wlm_query_task_state\",\"label\":\"pg_catalog.stv_wlm_query_task_state\"},{\"id\":\"stv_wlm_service_class_config\",\"label\":\"pg_catalog.stv_wlm_service_class_config\"},{\"id\":\"stv_wlm_service_class_state\",\"label\":\"pg_catalog.stv_wlm_service_class_state\"},{\"id\":\"stv_disk_extents\",\"label\":\"pg_catalog.stv_disk_extents\"},{\"id\":\"stl_leader_snapshot\",\"label\":\"pg_catalog.stl_leader_snapshot\"},{\"id\":\"stv_pg_wal_length\",\"label\":\"pg_catalog.stv_pg_wal_length\"},{\"id\":\"stl_aggr\",\"label\":\"pg_catalog.stl_aggr\"},{\"id\":\"stl_bcast\",\"label\":\"pg_catalog.stl_bcast\"},{\"id\":\"stl_delete\",\"label\":\"pg_catalog.stl_delete\"},{\"id\":\"stl_dist\",\"label\":\"pg_catalog.stl_dist\"},{\"id\":\"stl_rpc\",\"label\":\"pg_catalog.stl_rpc\"},{\"id\":\"stl_window\",\"label\":\"pg_catalog.stl_window\"},{\"id\":\"stl_hashjoin\",\"label\":\"pg_catalog.stl_hashjoin\"},{\"id\":\"stl_hash\",\"label\":\"pg_catalog.stl_hash\"},{\"id\":\"stl_insert\",\"label\":\"pg_catalog.stl_insert\"},{\"id\":\"stl_metadata_step\",\"label\":\"pg_catalog.stl_metadata_step\"},{\"id\":\"stl_unique\",\"label\":\"pg_catalog.stl_unique\"},{\"id\":\"stl_limit\",\"label\":\"pg_catalog.stl_limit\"},{\"id\":\"stl_mergejoin\",\"label\":\"pg_catalog.stl_mergejoin\"},{\"id\":\"stl_merge\",\"label\":\"pg_catalog.stl_merge\"},{\"id\":\"stl_nestloop\",\"label\":\"pg_catalog.stl_nestloop\"},{\"id\":\"stl_parse\",\"label\":\"pg_catalog.stl_parse\"},{\"id\":\"stl_project\",\"label\":\"pg_catalog.stl_project\"},{\"id\":\"stl_query\",\"label\":\"pg_catalog.stl_query\"},{\"id\":\"stl_return\",\"label\":\"pg_catalog.stl_return\"},{\"id\":\"stl_save\",\"label\":\"pg_catalog.stl_save\"},{\"id\":\"stl_scan\",\"label\":\"pg_catalog.stl_scan\"},{\"id\":\"stl_sort\",\"label\":\"pg_catalog.stl_sort\"},{\"id\":\"stv_query_stats\",\"label\":\"pg_catalog.stv_query_stats\"},{\"id\":\"stl_unload_log\",\"label\":\"pg_catalog.stl_unload_log\"},{\"id\":\"stv_active_cursors\",\"label\":\"pg_catalog.stv_active_cursors\"},{\"id\":\"stv_block_reps\",\"label\":\"pg_catalog.stv_block_reps\"},{\"id\":\"stv_cursor_configuration\",\"label\":\"pg_catalog.stv_cursor_configuration\"},{\"id\":\"stv_interleaved_counts\",\"label\":\"pg_catalog.stv_interleaved_counts\"},{\"id\":\"stv_query_metrics\",\"label\":\"pg_catalog.stv_query_metrics\"},{\"id\":\"stl_query_metrics\",\"label\":\"pg_catalog.stl_query_metrics\"},{\"id\":\"stl_wlm_rule_action\",\"label\":\"pg_catalog.stl_wlm_rule_action\"},{\"id\":\"stv_startup_recovery_state\",\"label\":\"pg_catalog.stv_startup_recovery_state\"},{\"id\":\"stl_analyze\",\"label\":\"pg_catalog.stl_analyze\"},{\"id\":\"stl_analyze_compression\",\"label\":\"pg_catalog.stl_analyze_compression\"},{\"id\":\"stl_column_stats\",\"label\":\"pg_catalog.stl_column_stats\"},{\"id\":\"stv_wlm_qmr_config\",\"label\":\"pg_catalog.stv_wlm_qmr_config\"},{\"id\":\"stl_wlm_auto_concurrency\",\"label\":\"pg_catalog.stl_wlm_auto_concurrency\"},{\"id\":\"stl_rlf_scan\",\"label\":\"pg_catalog.stl_rlf_scan\"},{\"id\":\"stl_incremental_resize_state\",\"label\":\"pg_catalog.stl_incremental_resize_state\"},{\"id\":\"stl_commit_internal_stats\",\"label\":\"pg_catalog.stl_commit_internal_stats\"},{\"id\":\"stl_prefetch_stats\",\"label\":\"pg_catalog.stl_prefetch_stats\"},{\"id\":\"stl_tombstone\",\"label\":\"pg_catalog.stl_tombstone\"},{\"id\":\"svv_diskusage\",\"label\":\"pg_catalog.svv_diskusage\"},{\"id\":\"svl_qlog\",\"label\":\"pg_catalog.svl_qlog\"},{\"id\":\"svv_query_inflight\",\"label\":\"pg_catalog.svv_query_inflight\"},{\"id\":\"svl_quer', '[{\"id\":\"pg_database_info\",\"label\":\"pg_catalog.pg_database_info\"},{\"id\":\"pg_class_info\",\"label\":\"pg_catalog.pg_class_info\"},{\"id\":\"pg_default_acl\",\"label\":\"pg_catalog.pg_default_acl\"},{\"id\":\"pg_conf\",\"label\":\"pg_catalog.pg_conf\"},{\"id\":\"pg_library\",\"label\":\"pg_catalog.pg_library\"},{\"id\":\"pg_shdepend\",\"label\":\"pg_catalog.pg_shdepend\"},{\"id\":\"systable_globaldict\",\"label\":\"pg_catalog.systable_globaldict\"},{\"id\":\"systable_topology\",\"label\":\"pg_catalog.systable_topology\"},{\"id\":\"systable_schema\",\"label\":\"pg_catalog.systable_schema\"},{\"id\":\"padb_config_harvest\",\"label\":\"pg_catalog.padb_config_harvest\"},{\"id\":\"pg_external_schema\",\"label\":\"pg_catalog.pg_external_schema\"}]', 'SF', 'SnowFlake Dev', 'PUBLIC', 'asdfasd', 'completed'),
(15, '', '', '', '', '', '', '', '', '', 'asdfasd', 'process');

-- --------------------------------------------------------

--
-- Table structure for table `job_config`
--

CREATE TABLE `job_config` (
  `job_id` int(11) NOT NULL,
  `config_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 0, 1, '', ''),
(3, 0, 2, '', ''),
(4, 0, 3, '', ''),
(5, 0, 6, '', ''),
(6, 0, 9, '', ''),
(7, 0, 14, '', '');

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
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 6, 6),
(5, 6, 9),
(6, 6, 14);

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
(1, 'Amazon RedShift', 1),
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
(6, 'SnowFlake Dev', 1),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `create_job`
--
ALTER TABLE `create_job`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joblist`
--
ALTER TABLE `joblist`
  MODIFY `joblistid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `job_config`
--
ALTER TABLE `job_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_schema`
--
ALTER TABLE `job_schema`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
