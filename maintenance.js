document.addEventListener("DOMContentLoaded", function () {
  fetch("display_maintenance_table.php")
    .then(res => res.json())
    .then(data => populateTable("maintenanceBody", data, true));
});

function loadAlerts() {
  fetch("display_alerts_table.php")
    .then(res => res.json())
    .then(data => {
      document.getElementById("alertsTable").style.display = "table";
      populateTable("alertsBody", data, true, true);
    });
}

function populateTable(tbodyId, data, includeAction, isAlert = false) {
  const tbody = document.getElementById(tbodyId);
  tbody.innerHTML = "";
  data.forEach((row) => {
    const tr = document.createElement("tr");
    Object.values(row).forEach((val) => {
      const td = document.createElement("td");
      td.textContent = val;
      tr.appendChild(td);
    });
    if (includeAction) {
      const actionTd = document.createElement("td");
      const btn = document.createElement("button");
      btn.textContent = "Edit";
      btn.onclick = () => openModal(row, isAlert);
      actionTd.appendChild(btn);
      tr.appendChild(actionTd);
    }
    tbody.appendChild(tr);
  });
}

function openModal(row, isAlert = false) {
  document.getElementById("editItemId").value = row.name_of_the_item;
  document.getElementById("editLastMaintenance").value = row.last_maintenance;
  document.getElementById("editMaintenanceDue").value = row.maintenance_due;
  document.getElementById("editServiceProvider").value = row.service_provider;
  document.getElementById("editModal").dataset.alert = isAlert;
  document.getElementById("editModal").style.display = "block";
}

function closeModal() {
  document.getElementById("editModal").style.display = "none";
}

document.getElementById("editForm").addEventListener("submit", function (e) {
  e.preventDefault();

  const lastMaintenanceDate = document.getElementById("editLastMaintenance").value;
  const itemName = document.getElementById("editItemId").value;
  const serviceProvider = document.getElementById("editServiceProvider").value;
  const isAlert = document.getElementById("editModal").dataset.alert === "true";

  const data = new FormData();
  data.append("name_of_the_item", itemName);
  data.append("last_maintenance", lastMaintenanceDate);
  data.append("service_provider", serviceProvider);
  data.append("is_alert", isAlert);

  fetch("update_maintenance.php", {
    method: "POST",
    body: data,
  })
    .then((res) => res.json())
    .then((res) => {
      if (res.status === "success") {
        closeModal();
        alert("Maintenance updated successfully");
        location.reload();
      } else {
        alert("Update failed: " + res.message);
      }
    });
});

