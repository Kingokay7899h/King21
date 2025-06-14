<?php
session_start();

$response = ['hide' => false];

if (isset($_SESSION['role'])) {
    $role = trim(strtolower($_SESSION['role']));
    $allowed_roles = ['hod', 'lab faculty incharge']; // Lowercase comparison

    if (in_array($role, $allowed_roles)) {
        $response['hide'] = true;
    }
}

header('Content-Type: application/json');
echo json_encode($response);
?>
