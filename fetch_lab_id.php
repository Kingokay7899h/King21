<?php
session_start();
include '../Authetication/db_config.php';
header('Content-Type: application/json');

if (!isset($_SESSION['lab_id'])) {
    echo json_encode(["error" => "Lab ID not found in session"]);
    exit();
}

echo json_encode(["lab_id" => $_SESSION['lab_id']]);
?>
