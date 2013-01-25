<?php
require '../config.php';
require 'leonarte.php';

$link = mysql_connect($db_host, $db_user, $db_password);
if (!$link) {
    die();
}
mysql_select_db($db_name, $link);
mysql_query("SET CHARACTER SET utf8");
mysql_query("SET NAMES utf8");

$gal = new Leonarte($link);


$request = explode('/', $_SERVER['QUERY_STRING']);
$params = count($request);

$thumbnails = array();
$creation = array();
$display_image = 0;
$category = '';
if ($params > 1) {
    $categories = array('pintura' => 1, 'piedras' => 3, 'escultura' => 2);
    if (array_key_exists($request[1], $categories)) {
        $category = $request[1] . '/';
        $thumbnails = $gal->thumbnails($categories[$request[1]]);
    }

    if ($params == 4) {
        $creation = $gal->image($request[2]);
        $display_image = $request[3];
    }

    if ($params == 3 AND is_numeric($request[1])) {
        $creation = $gal->image($request[1]);
        $display_image = $request[2];
    }
}



$page_title = 'Galer&iacute;a';
$include = 'galeria';

require '../includes/layout.php';
