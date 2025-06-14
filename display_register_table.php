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

if (!isset($_SESSION['role']) || !isset($_SESSION['lab_id'])) {
    echo json_encode(["error" => "Session variables missing"]);
    exit();
}
// Get Lab ID from session and CID from GET request
if (in_array($_SESSION['role'], ['lab assistant', 'lab faculty incharge'])){
    $lab_id = $_SESSION['lab_id'] ?? '';
}
else{
    $lab_id = isset($_GET['lab_id']) ? $_GET['lab_id'] : null;
}
$cid = $_GET['cid'] ?? '';

// Validate inputs
if (empty($lab_id) || empty($cid)) {
    echo "<p class='alert alert-warning text-center'>No records found: Lab ID or Category is missing</p>";
    exit;
}

// Fetch data based on lab_id and cid
$sql = "SELECT name_of_the_item, date, item_specification, indent_no, indent_date, 
               name_of_supplier, qty, bill_no, bill_date, price, used_qty, balance_qty, 
               la_sign, li_sign, hod_sign, remarks, asset_type 
        FROM register 
        WHERE lab_id = ? AND cid = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $lab_id, $cid);
$stmt->execute();
$result = $stmt->get_result();

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
    echo "<p class='alert alert-warning text-center'>No records found</p>";
}

$conn->close();
?>
