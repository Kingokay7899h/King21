<?php
session_start();
$host = "localhost";
$username = "root";
$password = "";
$dbname = "asset_management";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed."]));
}


if (in_array($_SESSION['role'], ['lab assistant', 'lab faculty incharge'])){
    $lab_id = $_SESSION['lab_id'];
}
else{
    $lab_id = isset($_GET['lab_id']) ? $_GET['lab_id'] : null;
}


$cid = $_GET['cid']; // Get category ID from URL
// Query to count assets that match both lab_id and cid
$sql = "SELECT COUNT(*) AS total_assets FROM register WHERE lab_id = ? AND cid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $lab_id, $cid);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

echo json_encode(["total_assets" => $row['total_assets']]);

$stmt->close();
$conn->close();
?>
