<?php
session_start();
$host = "localhost";
$username = "root";
$password = "";
$dbname = "asset_management";

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$lab_id = null;

// Determine lab_id based on role
if (in_array($_SESSION['role'], ['lab assistant', 'lab faculty incharge'])) {
    if (!isset($_SESSION['lab_id'])) {
        echo json_encode(["error" => "Lab ID is not set"]);
        exit();
    }
    $lab_id = $_SESSION['lab_id'];
    $sql = "SELECT COUNT(*) AS total_assets FROM register WHERE lab_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $lab_id);
} elseif ($_SESSION['role'] == 'hod') {
    if (!isset($_GET['lab_id']) || empty($_GET['lab_id'])) {
        // If no lab_id is provided in the URL, fetch total assets for all labs
        $sql = "SELECT COUNT(*) AS total_assets FROM register";
        $stmt = $conn->prepare($sql);
    } else {
        // If lab_id is provided in the URL, fetch assets for that specific lab
        $lab_id = $_GET['lab_id'];
        $sql = "SELECT COUNT(*) AS total_assets FROM register WHERE lab_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $lab_id);
    }
} else {
    echo json_encode(["error" => "Unauthorized role"]);
    exit();
}

// Execute the query
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

echo json_encode(["total_assets" => $row['total_assets']]);

$stmt->close();
$conn->close();
?>
