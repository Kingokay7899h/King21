<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "asset_management";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the request is a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate required fields
    $required = ['labId', 'cid', 'itemName', 'quantity', 'assetType'];
    foreach ($required as $field) {
        if (empty($_POST[$field])) {
            die("<script>alert('$field is required'); window.history.back();</script>");
        }
    }
    
    if ($_POST["assetType"] === "Choose...") {
        die("<script>alert('Please select a valid asset type'); window.history.back();</script>");
    }

    // Retrieve and sanitize data
    $labId = $conn->real_escape_string($_POST["labId"]);
    $cid = $conn->real_escape_string($_POST["cid"]);
    $itemName = $conn->real_escape_string($_POST["itemName"]);
    $entryDate = !empty($_POST["entryDate"]) ? $conn->real_escape_string($_POST["entryDate"]) : NULL;
    $itemSpec = !empty($_POST["itemSpec"]) ? $conn->real_escape_string($_POST["itemSpec"]) : NULL;
    $indentNo = !empty($_POST["indentNo"]) ? $conn->real_escape_string($_POST["indentNo"]) : NULL;
    $indentDate = !empty($_POST["indentDate"]) ? $conn->real_escape_string($_POST["indentDate"]) : NULL;
    $supplier = !empty($_POST["supplier"]) ? $conn->real_escape_string($_POST["supplier"]) : NULL;
    $quantity = intval($_POST["quantity"]);
    $billNo = !empty($_POST["billNo"]) ? $conn->real_escape_string($_POST["billNo"]) : NULL;
    $billDate = !empty($_POST["billDate"]) ? $conn->real_escape_string($_POST["billDate"]) : NULL;
    $price = !empty($_POST["price"]) ? floatval($_POST["price"]) : 0;
    $usedQty = !empty($_POST["usedQty"]) ? intval($_POST["usedQty"]) : 0;
    $balance = !empty($_POST["balance"]) ? intval($_POST["balance"]) : $quantity;
    $la = isset($_POST["la"]) ? 1 : 0;
    $li = isset($_POST["li"]) ? 1 : 0;
    $hod = isset($_POST["hod"]) ? 1 : 0;
    $remarks = !empty($_POST["remarks"]) ? $conn->real_escape_string($_POST["remarks"]) : NULL;
    $assetType = $conn->real_escape_string($_POST["assetType"]);
    $status = "Pending";

    // SQL query - don't include primary key column
    $sql = "INSERT INTO register (
        lab_id, cid, name_of_the_item, date, item_specification, 
        indent_no, indent_date, name_of_supplier, qty, bill_no, 
        bill_date, price, used_qty, balance_qty, la_sign, li_sign, 
        hod_sign, remarks, asset_type, status
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("<script>alert('Prepare failed: " . $conn->error . "'); window.history.back();</script>");
    }

    $stmt->bind_param("sssssssssssiiiiiisss", 
        $labId, $cid, $itemName, $entryDate, $itemSpec, 
        $indentNo, $indentDate, $supplier, $quantity, $billNo, 
        $billDate, $price, $usedQty, $balance, $la, $li, 
        $hod, $remarks, $assetType, $status
    );

    if ($stmt->execute()) {
        $asset_id = $stmt->insert_id;
        $message = "New asset added: $itemName (assetId: $asset_id)";
        
        // Insert notification
        $notifStmt = $conn->prepare("INSERT INTO notifications (asset_id, lab_id, role, message) VALUES (?, ?, 'LI', ?)");
        $notifStmt->bind_param("iss", $asset_id, $labId, $message);
        $notifStmt->execute();
        $notifStmt->close();
        
        echo "<script>alert('Asset added successfully!'); window.location.href =  window.history.back();</script>";
    } else {
        echo "<script>alert('Error: " . addslashes($conn->error) . "'); window.history.back();</script>";
    }

    $stmt->close();
}

$conn->close();
?>