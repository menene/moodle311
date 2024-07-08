<?php // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'db';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'moodleuser';
$CFG->dbpass    = 'moodlepassword';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = [
    'dbcollation' => 'utf8mb4_unicode_ci',
];

$CFG->wwwroot  = 'http://localhost:8080';
$CFG->dataroot = '/var/www/moodledata';
$CFG->admin    = 'admin';

$CFG->directorypermissions = 0777;

require_once __DIR__ . '/lib/setup.php';
