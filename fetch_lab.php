<?php
session_start();
include '../Authetication/db_config.php';
header('Content-Type: application/json');

$lab_id = null;

// Determine lab_id based on role
if (in_array($_SESSION['role'], ['lab assistant', 'lab faculty incharge'])) {
    if (!isset($_SESSION['lab_id'])) {
        echo json_encode(['error' => 'Lab ID not found in session']);
        exit();
    }
    $lab_id = $_SESSION['lab_id']; 
} elseif ($_SESSION['role'] == 'hod') {
    if (!isset($_GET['lab_id']) || empty($_GET['lab_id'])) {
        echo json_encode(['error' => 'Lab ID not provided in URL']);
        exit();
    }
    $lab_id = $_GET['lab_id']; 
}

// Fetch lab name
$sql = "SELECT lab_name FROM labs WHERE lab_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $lab_id);
$stmt->execute();
$stmt->bind_result($lab_name);
$stmt->fetch();
$stmt->close();
$conn->close();

echo json_encode(["lab_name" => $lab_name]);
exit();
?>
