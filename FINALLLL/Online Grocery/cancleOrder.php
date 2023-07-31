<?php 
session_start();

require 'dbcon.php';

if (!isset($_SESSION['USER_ID'])) {
    echo "login first";
    die();
}
$query = "DELETE FROM order_items WHERE uid = {$_SESSION['USER_ID']} AND item_id = " . $_POST['id'];
$result = $conn->query($query);
if($result){
    echo "success";
}else{
    echo "failed";
}
