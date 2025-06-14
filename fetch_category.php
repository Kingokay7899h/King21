<?php
$servername = "localhost"; // Change if needed
$username = "root"; // Your database username
$password = ""; // Your database password
$dbname = "asset_management"; // Database name
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$cid = $_GET['cid']; // Get cid from GET request

if ($cid) {
    $sql = "SELECT category_name FROM category WHERE cid = '$cid'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo json_encode(["category_name" => "Category Not Found"]);
    }
} else {
    echo json_encode(["category_name" => "Lab Inventory"]); // Default if no cid
}

$conn->close();
?>