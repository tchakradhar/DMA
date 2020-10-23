<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'welcome';

$route['new_crete_job']='welcome/new_crete_job';

$route['create-job']='welcome/create_job';
$route['create-job/(:any)']='welcome/create_job/$1';
$route['create-job/(:any)/(:any)']='welcome/create_job/$1/$2';
$route['check-conn']='welcome/check_conn';
$route['check-conn/(:any)']='welcome/check_conn/$1';


$route['config']='welcome/config';
$route['check-conn-target']='welcome/check_conn_target';
$route['check-conn-target/(:any)']='welcome/check_conn_target/$1';
$route['schema-lists']='welcome/Schema_Lists';
$route['add-schemas-session']='welcome/Adding_Schema_Sessions';
$route['table-with-schema']='welcome/table_with_schema';
$route['add-tables-session']='welcome/Adding_tables_Sessions';
$route['demo']='welcome/demo';
$route['schema-list']='welcome/schema_list';
$route['schema-list/(:any)']='welcome/schema_list/$1';
$route['schemas-update']='welcome/schemas_update';
$route['table-update']='welcome/table_update';
$route['schemas']='welcome/schemas';
$route['table-list/(:any)']='welcome/table_list/$1';
$route['table']='welcome/table';
$route['source_update/(:any)']='welcome/source_update/$1';
$route['preview']='welcome/preview';
$route['get_database_record/(:any)']='welcome/get_database_record/$1';
$route['update_connection']='welcome/config';
$route['insert_config']='welcome/config';
$route['config_delete_rec']='welcome/config';
$route['home']='welcome/home';
$route['target']='welcome/target';
$route['target/(:any)']='welcome/target/$1';
$route['get_connection_data/(:any)']='welcome/get_connection_data/$1';
$route['migration']='welcome/migration';
$route['migration/(:any)']='welcome/migration/$1';

/*New code*/
$route['migration-process/(:any)']='welcome/migration_process/$1';
$route['migration-process/(:any)/(:any)/(:any)/(:any)']='welcome/migration_process/$1/$2/$3/$4';
$route['migration-process']='welcome/migration_process';

$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
