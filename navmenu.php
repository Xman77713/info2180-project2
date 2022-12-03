<?php
session_start();

$host = 'localhost';
$dbusername = 'project2_user';
$dbpassword = 'password123';
$dbname = 'dolphin_crm';

$conn = new PDO("mysql:host={$host};dbname={$dbname};charset=utf8mb4", $dbusername, $dbpassword);


?>