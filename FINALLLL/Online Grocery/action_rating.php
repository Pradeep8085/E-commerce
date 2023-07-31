<?php
session_start();
require 'dbcon.php';
$findingQuery = "SELECT * FROM ratings WHERE uid = {$_POST['user_id']} AND pid = {$_POST['product_id']}";
$findingResult = $conn->query($findingQuery);

$query = "UPDATE ratings SET total_rating = {$_POST['total_rating']}  WHERE uid = {$_POST['user_id']} AND pid = {$_POST['product_id']}";

if($findingResult->num_rows == 0){
    $query = "INSERT INTO ratings(uid, pid, total_rating) VALUES({$_POST['user_id']}, {$_POST['product_id']}, {$_POST['total_rating']})";    
}
$result = $conn->query($query);
?>