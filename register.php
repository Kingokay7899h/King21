
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link rel="stylesheet" href="inventory.css">
    <!-- <link rel="stylesheet" href="/status_bar.css"> -->
    <!-- <script src="status_bar.js"></script> -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div id="dashboard-container" class="d-flex">
        <!-- Sidebar -->
        <div id="sidebar" class="d-flex flex-column   py-3 ">
            <h4 class="dams ps-4 pt-4 mb-5"><b>DAMS</b></h4>
            <ul class="nav nav-pills flex-column mb-auto">
                <li><a href="lab_assistant.html" class="nav-link link-hover" id="dashboard-link"><i class="fas fa-home pe-2 ps-2"></i> Dashboard</a></li>
                <li><a href="#" class="nav-link link-hover" id="inventory-link"><i class="fas fa-box pe-2 ps-2"></i> Inventory</a></li>
                <li><a href="#" class="nav-link link-hover" id="requisition-link"><i class="fas fa-file-alt pe-2 ps-2"></i> Requisition</a></li>
                <li><a href="#" class="nav-link link-hover" id="condemnation-link"><i class="fas fa-exclamation-triangle pe-2 ps-2"></i> Codemnation</a></li>
                <li><a href="#" class="nav-link link-hover" id="maintenance-link"><i class="fas fa-wrench pe-2 ps-2"></i> Maintenance</a></li>
            </ul>

            <!-- <a href="sign_in.html" class="nav-link link-hover mt-auto ms-3 mb-4">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a> -->
        </div>

        
        <!-- Main Content -->
        <div id="main-content" class="container-fluid">
            <div class="row mynav d-flex">
                <nav class="navbar w-100 navbar-light bg-custom d-flex justify-content-between">
                    <span class="ms-3" id="menu-toggle"><i class="fas fa-bars"></i></span>
                    <input class="form-control w-50 " type="search"  placeholder="Search assets...">
                    <div class="username">
                        <i class="far fa-user"></i>
                        <span class="ms-1 me-3">(Lab Assistant)</span>
                    </div>
                </nav>
            </div>

            <!-- <h4 class="my-4 ms-3"><b>Inventory</b></h4> -->
            
            
            <section class="inventory-overview" aria-label="Inventory Overview">
                <div class="inventory-card">
                    <h2 class="inventory-title" id="inventory-id"><b>Lab Inventory</b></h2>
                    <div class="inventory-content">
                        <div class="inventory-column">
                            <div class="stat-group">
                                <div class="stat-primary">Category</div>
                                <div class="stat-value">1</div>
                            </div>
                        </div>
            
                         
                        <div class="divider-1" aria-hidden="true"></div>
            
                        <!-- Total Assets Section -->
                        <div class="inventory-column">
                            <div class="stat-group">
                                <div class="stat-primary">Total Assets</div>
                                <div class="stat-value" id="category-count" >Loading...</div>
                                <div class="stat-period">Last 7 days</div>
                            </div>
                        </div>
                        <div class="divider-1" aria-hidden="true"></div>
                        
                    </div>

                    <div class="row pt-2">
                        <div>
                        <button class="btn btn-outline-secondary me-2" data-bs-toggle="modal" data-bs-target="#filterModal">
                            <i class="bi bi-funnel"></i> Filters
                        </button>
                            <button class="btn btn-primary remove" data-bs-toggle="modal" data-bs-target="#addAssetModal">Add Asset</button>
                        </div>
                    </div>
                </div>
            </section>


       <!-- Filter Modal -->
<div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="filterModalLabel">Filter Assets</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="filterForm" method="POST">
                        <div class="mb-3">
                            <label for="name_of_the_item" class="form-label">Item Name</label>
                            <input type="text" class="form-control" id="name_of_the_item" name="name_of_the_item">
                        </div>
                        <div class="mb-3">
                            <label for="bill_no" class="form-label">Bill Number</label>
                            <input type="text" class="form-control" id="bill_no" name="bill_no">
                        </div>
                        <div class="mb-3">
                            <label for="indent_no" class="form-label">Indent Number</label>
                            <input type="text" class="form-control" id="indent_no" name="indent_no">
                        </div>
                        <div class="mb-3">
                            <label for="date" class="form-label">Specific Date</label>
                            <input type="date" class="form-control" id="date" name="date">
                        </div>
                        <div class="mb-3">
                            <label for="time_range" class="form-label">Fetch Last (Weeks/Months)</label>
                            <input type="number" class="form-control" id="time_range" name="time_range" placeholder="Enter number">
                            <select class="form-select mt-2" id="time_unit" name="time_unit">
                                <option value="week">Week(s)</option>
                                <option value="month">Month(s)</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="redirectToSearch()">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
            
            <!-- Add Asset Modal -->
            <div class="modal fade" id="addAssetModal" tabindex="-1" aria-labelledby="addAssetModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addAssetModalLabel">Add Asset</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="add_asset.php" method="POST">
                                <div class="mb-3">
                                    <label for="labId" class="form-label">Lab ID</label>
                                    <input type="text" class="form-control" id="labId" name="labId" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="cid" class="form-label">Category</label>
                                    <input type="text" class="form-control" id="cid" name="cid" readonly>
                                </div>
                                <input type="hidden" id="hiddenLabId" name="labId">  <!-- Ensure hidden fields have the correct name -->
                                <input type="hidden" id="hiddenCid" name="cid">
                        
                                <div class="mb-3">
                                    <label for="assetType" class="form-label">Asset Type</label>
                                    <select class="form-select" id="type" name="assetType">
                                        <option selected>Choose...</option>
                                        <option>IC</option>
                                        <option>Printers</option>
                                        <option>PC</option>
                                        <option>CPU</option>
                                        <option>Toner</option>
                                        <option>Furniture</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="itemName" class="form-label">Item Name</label>
                                    <input type="text" class="form-control" id="itemName" name="itemName">
                                </div>
                                <div class="mb-3">
                                    <label for="entryDate" class="form-label">Entry Date</label>
                                    <input type="date" class="form-control" id="entryDate" name="entryDate">
                                </div>
                                <div class="mb-3">
                                    <label for="itemSpec" class="form-label">Item Specification</label>
                                    <input type="text" class="form-control" id="itemSpec" name="itemSpec">
                                </div>
                                <div class="mb-3">
                                    <label for="indentNo" class="form-label">Indent No</label>
                                    <input type="text" class="form-control" id="indentNo" name="indentNo">
                                </div>
                                <div class="mb-3">
                                    <label for="indentDate" class="form-label">Indent Date</label>
                                    <input type="date" class="form-control" id="indentDate" name="indentDate">
                                </div>
                                <div class="mb-3">
                                    <label for="supplier" class="form-label">Name of Supplier</label>
                                    <input type="text" class="form-control" id="supplier" name="supplier">
                                </div>
                                <div class="mb-3">
                                    <label for="quantity" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity">
                                </div>
                                <div class="mb-3">
                                    <label for="billNo" class="form-label">Bill No</label>
                                    <input type="text" class="form-control" id="billNo" name="billNo">
                                </div>
                                <div class="mb-3">
                                    <label for="billDate" class="form-label">Bill Date</label>
                                    <input type="date" class="form-control" id="billDate" name="billDate">
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price (Rs.)</label>
                                    <input type="number" class="form-control" id="price" name="price">
                                </div>
                                <div class="mb-3">
                                    <label for="usedQty" class="form-label">Used Qty</label>
                                    <input type="number" class="form-control" id="usedQty" name="usedQty">
                                </div>
                                <div class="mb-3">
                                    <label for="balance" class="form-label">Balance</label>
                                    <input type="number" class="form-control" id="balance" name="balance">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Approval Status</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="la" name="la" checked onclick="return false;">
                                        <label class="form-check-label" for="la">LA</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="li" name="li" onclick="return false;">
                                        <label class="form-check-label" for="li">LI</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="hod" name="hod" onclick="return false;">
                                        <label class="form-check-label" for="hod">HOD</label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="remarks" class="form-label">Remarks</label>
                                    <textarea class="form-control" id="remarks" rows="3" name="remarks"></textarea>
                                </div>
            
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save Asset</button>
                                </div>
                            </form>
                        </div>
            
                    </div>
                </div>
            </div>

            <div class="row">
                <div id="register-table"></div>

            </div>

                          
        </div>
    </div>

    <script>
        document.getElementById("menu-toggle").addEventListener("click", function() {
         document.getElementById("dashboard-container").classList.toggle("collapsed");
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll('.nav-link');
        
            // Get the last active link from localStorage
            const activeLink = localStorage.getItem('activeLink');
        
            if (activeLink) {
                // Remove active class from all links
                links.forEach(link => link.classList.remove('active'));
        
                // Add active class to the stored active link
                document.getElementById(activeLink)?.classList.add('active');
            } else {
                // If no stored active link, set Dashboard as default
                document.getElementById('dashboard-link').classList.add('active');
            }
        
            links.forEach(link => {
                link.addEventListener('click', function () {
                    // Remove active from all links
                    links.forEach(link => link.classList.remove('active'));
        
                    // Add active class to clicked link
                    this.classList.add('active');
        
                    // Store the clicked link's ID in localStorage
                    localStorage.setItem('activeLink', this.id);
                });
            });
        });
    </script>
     <script>
        
const one =document.querySelector(".one");
const two =document.querySelector(".two");
const three =document.querySelector(".three");
const four =document.querySelector(".four");
const five =document.querySelector(".five");
const six =document.querySelector(".six");

one.onclick =function(){
    one.classList.add("active");
    two.classList.remove("active");
    three.classList.remove("active");
    four.classList.remove("active");
    five.classList.remove("active");
    six.classList.remove("active");
}

two.onclick =function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.remove("active");
    four.classList.remove("active");
    five.classList.remove("active");
    six.classList.remove("active");

}

three.onclick =function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.remove("active");
    five.classList.remove("active");
    six.classList.remove("active");
}

four.onclick =function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.add("active");
    five.classList.remove("active");
    six.classList.remove("active");
}

five.onclick =function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.add("active");
    five.classList.add("active");
    six.classList.remove("active");
}

six.onclick =function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.add("active");
    five.classList.add("active");
    six.classList.add("active");
}

     </script>

<script>
    function redirectToDetails(url) {
        window.location.href = url;
    }
</script>

<!-- <script>

    document.addEventListener("DOMContentLoaded", function () {
        fetch("fetch_lab.php")  // Call the PHP script
            .then(response => response.json())
            .then(data => {
                // Update the Inventory Title
                document.getElementById("inventory-id").innerHTML = `<b>${data.category_name} Inventory</b>`;
            })
            .catch(error => console.error("Error fetching lab data:", error));
    });


</script> -->



<script>
    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const cid = getParameterByName('cid');
        if (cid) {
            fetch(`fetch_category.php?cid=${cid}`) // Send cid to PHP
                .then(response => response.json())
                .then(data => {
                    document.getElementById("inventory-id").innerHTML = `<b>${data.category_name} Register</b>`; //Update the title
                })
                .catch(error => console.error("Error fetching category data:", error));
        }

    });
</script>

<!-- 
    <script>
        function updateTotalAssets() {
        const cid = getParameterByName('cid'); // Get category ID from URL
        if (!cid) {
            document.getElementById("category-count").textContent = "Error: No Category ID";
            return;
        }

        fetch(`fetch_category_count.php?cid=${cid}`)
            .then(response => response.json())
            .then(data => {
                if (data.total_assets !== undefined) {
                    document.getElementById("category-count").textContent = data.total_assets;
                } else {
                    document.getElementById("category-count").textContent = "Error";
                }
            })
            .catch(error => {
                document.getElementById("category-count").textContent = "Error";
                console.error("Error fetching total assets:", error);
            });
    }

    // Fetch the data when the page loads
    document.addEventListener("DOMContentLoaded", updateTotalAssets);
</script> -->

<script>
        document.addEventListener("DOMContentLoaded", function () {
        // Get CID from URL
        const cid = getParameterByName('cid');
        if (cid) {
            document.getElementById("hiddenCid").value = cid; // Store in hidden field
            document.getElementById("cid").value = cid; // Show in input field
        }

        // Fetch Lab ID from PHP session
        fetch("fetch_lab_id.php")
            .then(response => response.json())
            .then(data => {
                if (data.lab_id) {
                    document.getElementById("hiddenLabId").value = data.lab_id; // Store in hidden field
                    document.getElementById("labId").value = data.lab_id; // Show in input field
                } else {
                    console.error("Error: Lab ID not found");
                }
            })
            .catch(error => console.error("Error fetching Lab ID:", error));
    });

</script> 


<!-- <script>
    document.addEventListener("DOMContentLoaded", function () {
    const cid = getParameterByName('cid'); // Get 'cid' from URL

    if (cid) {
        fetch(`display_register_table.php?cid=${cid}`) // Send cid to PHP
            .then(response => response.text()) // Get response as text (HTML table)
            .then(data => {
                document.getElementById("register-table").innerHTML = data; // Update the table dynamically
            })
            .catch(error => console.error("Error fetching table data:", error));
    }
});
</script> -->

 
<script>
    // Function to get query parameters from URL
function getParameterByName(name) {
    let urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

function updateTotalAssets() {
    const cid = getParameterByName('cid'); // Get category ID
    const labId = getParameterByName('lab_id'); // Get lab ID

    fetch(`fetch_category_count.php?cid=${cid}&lab_id=${labId}`)
        .then(response => response.json())
        .then(data => {
            if (data.total_assets !== undefined) {
                document.getElementById("category-count").textContent = data.total_assets;
            } else {
                document.getElementById("category-count").textContent = "Error";
            }
        })
        .catch(error => {
            document.getElementById("category-count").textContent = "Error";
            console.error("Error fetching total assets:", error);
        });
}

// Fetch the data when the page loads
document.addEventListener("DOMContentLoaded", function () {
    updateTotalAssets();

    const cid = getParameterByName('cid'); 
    const labId = getParameterByName('lab_id');


        fetch(`display_register_table.php?cid=${cid}&lab_id=${labId}`) // Send cid & lab_id
            .then(response => response.text())
            .then(data => {
                document.getElementById("register-table").innerHTML = data;
            })
            .catch(error => console.error("Error fetching table data:", error));

});

</script>

   

<script>
        document.addEventListener("DOMContentLoaded", function () {
            fetch('hide_button.php')
                .then(response => response.json())
                .then(data => {
                    if (data.hide) {
                        document.querySelector('.remove').style.display = 'none';
                    }
                })
                .catch(error => console.error('Error:', error));
        });
</script>


<script>
        function getParameterByName(name) {
            let urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        function redirectToSearch() {
            const nameOfItem = document.getElementById("name_of_the_item").value;
            const billNo = document.getElementById("bill_no").value;
            const indentNo = document.getElementById("indent_no").value;
            const date = document.getElementById("date").value;
            const timeRange = document.getElementById("time_range").value;
            const timeUnit = document.getElementById("time_unit").value;

            const cid = getParameterByName('cid');
            const labId = getParameterByName('lab_id');

            localStorage.setItem("name_of_the_item", nameOfItem);
            localStorage.setItem("bill_no", billNo);
            localStorage.setItem("indent_no", indentNo);
            localStorage.setItem("date", date);
            localStorage.setItem("time_range", timeRange);
            localStorage.setItem("time_unit", timeUnit);
            localStorage.setItem("cid", cid);
            localStorage.setItem("lab_id", labId);
            window.location.href = "search.html";
    }
</script>

 </body>
</html>
