<?php

$db_host = 'localhost';
$db_name = 'leonarte';
$db_user = 'root';
$db_password = '';

if ($_SERVER['HTTP_HOST'] == 'leonarte.com'
    or
    $_SERVER['HTTP_HOST'] == 'www.leonarte.com') {
    $db_name = 'leonarte';
    $db_user = 'leonarte';
    $db_password = '93NZWPHvrC6XjhSt';
}

$web_path = '/';
$base_title = 'LEONARTE. Percepciones de una artista.';
