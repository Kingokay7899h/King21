<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "asset_management";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (in_array($_SESSION['role'], ['lab assistant', 'lab faculty incharge'])){
    $lab_id = $_SESSION['lab_id'] ?? '';
} else {
    $lab_id = isset($_POST['lab_id']) ? $_POST['lab_id'] : null;
}

$cid = $_POST['cid'] ?? '';
$name_of_the_item = $_POST['name_of_the_item'] ?? '';
date_default_timezone_set('Asia/Kolkata');
// var_dump($name_of_the_item);
$bill_no = $_POST['bill_no'] ?? '';
$indent_no = $_POST['indent_no'] ?? '';
$date = $_POST['date'] ?? '';
$time_filter = $_POST['time_range'] ?? '';
$custom_days = $_POST['time_unit'] ?? '';

if (empty($cid) || empty($lab_id)) {
    echo "<p class='alert alert-warning text-center'>Lab ID or Category is missing</p>";
    exit;
}


$sql = "SELECT * FROM register WHERE lab_id = ? AND cid = ?";
$types = "ss";
$params = [$lab_id, $cid];

if (!empty($name_of_the_item)) {
    $sql .= " AND name_of_the_item LIKE ?";
    $types .= "s";
    $params[] = "%$name_of_the_item%";
}

if (!empty($bill_no)) {
    $sql .= " AND bill_no = ?";
    $types .= "s";
    $params[] = $bill_no;
}

if (!empty($indent_no)) {
    $sql .= " AND indent_no = ?";
    $types .= "s";
    $params[] = $indent_no;
}

if (!empty($date)) {
    $sql .= " AND date = ?";
    $types .= "s";
    $params[] = $date;
}

if (!empty($time_filter)) {
    $current_date = date('Y-m-d');
    if ($time_filter == "7") {
        $start_date = date('Y-m-d', strtotime('-7 days'));
    } elseif ($time_filter == "30") {
        $start_date = date('Y-m-d', strtotime('-1 month'));
    } elseif ($time_filter == "60") {
        $start_date = date('Y-m-d', strtotime('-2 months'));
    } elseif ($time_filter == "custom" && !empty($custom_days)) {
        $start_date = date('Y-m-d', strtotime("-$custom_days days"));
    }
    if (isset($start_date)) {
        $sql .= " AND date BETWEEN ? AND ?";
        $types .= "ss";
        $params[] = $start_date;
        $params[] = $current_date;
    }
}

// var_dump($sql, $params);


$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$params);
$stmt->execute();
$result = $stmt->get_result();

// var_dump($result->num_rows);

if ($result->num_rows > 0) {
    echo '<div class="table-responsive pt-3">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Item Name</th><th>Date</th><th>Item Specification</th><th>Indent No</th>
                        <th>Indent Date</th><th>Supplier</th><th>Quantity</th><th>Bill No</th>
                        <th>Bill Date</th><th>Price</th><th>Used Qty</th><th>Balance Qty</th>
                        <th>LA Sign</th><th>LI Sign</th><th>HOD Sign</th><th>Remarks</th><th>Asset Type</th>
                    </tr>
                </thead>
                <tbody>';

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row["name_of_the_item"]) . "</td>
                <td>" . htmlspecialchars($row["date"]) . "</td>
                <td>" . htmlspecialchars($row["item_specification"]) . "</td>
                <td>" . htmlspecialchars($row["indent_no"]) . "</td>
                <td>" . htmlspecialchars($row["indent_date"]) . "</td>
                <td>" . htmlspecialchars($row["name_of_supplier"]) . "</td>
                <td>" . htmlspecialchars($row["qty"]) . "</td>
                <td>" . htmlspecialchars($row["bill_no"]) . "</td>
                <td>" . htmlspecialchars($row["bill_date"]) . "</td>
                <td>" . htmlspecialchars($row["price"]) . "</td>
                <td>" . htmlspecialchars($row["used_qty"]) . "</td>
                <td>" . htmlspecialchars($row["balance_qty"]) . "</td>
                <td>" . ($row["la_sign"] ? "✔" : "✘") . "</td>
                <td>" . ($row["li_sign"] ? "✔" : "✘") . "</td>
                <td>" . ($row["hod_sign"] ? "✔" : "✘") . "</td>
                <td>" . htmlspecialchars($row["remarks"]) . "</td>
                <td>" . htmlspecialchars($row["asset_type"]) . "</td>
              </tr>";
    }
    echo "</tbody></table></div>";
} else {
    echo "<p class='alert alert-warning text-center'>No matching records found</p>";
}

$conn->close();
?>