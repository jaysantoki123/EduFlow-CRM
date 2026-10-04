<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="EduFlow.Admin.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Student list - EduFlow CRM
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
        /* View Toggle */
        .view-toggle {
            display: flex;
            background: var(--surface-container);
            border-radius: var(--radius-full);
            padding: 4px;
            gap: 4px;
        }

        .view-toggle-btn {
            padding: 8px 16px;
            border: none;
            background: transparent;
            border-radius: var(--radius-full);
            font-size: 13px;
            font-weight: 500;
            color: var(--on-surface-variant);
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .view-toggle-btn.active {
            background: var(--primary);
            color: white;
            box-shadow: 0 2px 8px rgba(79, 70, 229, 0.3);
        }

        /* Filter & Search Bar */
        .filter-bar {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .filter-row {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr auto;
            gap: var(--spacing-md);
            align-items: flex-end;
        }

        .filter-group { display: flex; flex-direction: column; gap: 6px; }
        .filter-label { font-size: 11px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; }
        .filter-select, .filter-input { height: 40px; border: 1px solid var(--border-subtle); border-radius: var(--radius-md); padding: 0 12px; font-size: 13px; background: white; }
        .filter-select:focus, .filter-input:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1); }

        /* Grid View */
        .students-grid { display: none; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: var(--spacing-lg); }
        .students-grid.active { display: grid; }

        .student-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .student-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-lg); }

        .student-card-banner {
            height: 70px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            position: relative;
        }

        .student-card-avatar {
            width: 64px;
            height: 64px;
            border-radius: var(--radius-full);
            background: white;
            border: 3px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: 700;
            color: var(--primary);
            position: absolute;
            bottom: -32px;
            left: var(--spacing-lg);
            box-shadow: var(--shadow-md);
        }

        .student-card-body { padding: 40px var(--spacing-lg) var(--spacing-lg); }
        .student-card-name { font-size: 16px; font-weight: 700; color: var(--on-surface); margin: 0 0 2px; }
        .student-card-id { font-size: 12px; color: var(--primary); font-weight: 600; margin: 0 0 8px; }

        .student-card-footer {
            padding: 12px var(--spacing-lg);
            background: var(--surface-container-low);
            border-top: 1px solid var(--border-subtle);
            display: flex;
            gap: 8px;
        }

        /* Table View */
        .table-view { display: none; }
        .table-view.active { display: block; }

        .student-table-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
        }

        .student-table { width: 100%; border-collapse: collapse; }
        .student-table thead { background: var(--surface-container-low); }
        .student-table th { padding: 14px 16px; text-align: left; font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; border-bottom: 1px solid var(--border-subtle); white-space: nowrap; }
        .student-table td { padding: 14px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; vertical-align: middle; }

        .table-student { display: flex; align-items: center; gap: 12px; }
        .table-avatar { width: 36px; height: 36px; border-radius: var(--radius-full); background: linear-gradient(135deg, var(--primary), var(--secondary)); color: white; display: flex; align-items: center; justify-content: center; font-weight: 600; font-size: 13px; }

        .status-badge { display: inline-flex; align-items: center; gap: 6px; padding: 4px 12px; border-radius: var(--radius-full); font-size: 12px; font-weight: 600; }
        .status-badge.active { background: rgba(34, 197, 94, 0.1); color: var(--success); }
        .status-badge.alumni { background: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .status-badge.suspended { background: rgba(239, 68, 68, 0.1); color: var(--danger); }

        .action-btn-sm { width: 32px; height: 32px; border: 1px solid var(--border-subtle); background: white; border-radius: var(--radius-md); cursor: pointer; display: inline-flex; align-items: center; justify-content: center; }
        .action-btn-sm:hover { background: var(--primary); color: white; border-color: var(--primary); }

        .table-footer { padding: var(--spacing-md) var(--spacing-lg); display: flex; justify-content: space-between; align-items: center; border-top: 1px solid var(--border-subtle); }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                    <div class="topbar-search"><i class="fas fa-search"></i><input type="text" id="globalStudentSearch" placeholder="Search student name, ID, roll number..."></div>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button>
                    <button class="topbar-i
                    
                    
                    
                    con-btn"><i class="fas fa-user-circle"></i></button>
                </div>
            </header>

            <div class="content-area">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h1 class="headline-lg mb-1">Student Management</h1>
                        <p class="text-muted mb-0">Manage enrolled student profiles, academic records, and admission lifecycles</p>
                    </div>
                    <div class="d-flex gap-2 align-items-center flex-wrap">
                        <div class="view-toggle">
                            <button type="button" class="view-toggle-btn active" id="tableViewBtn"><i class="fas fa-list"></i> Table View</button>
                            <button type="button" class="view-toggle-btn" id="gridViewBtn"><i class="fas fa-th-large"></i> Grid View</button>
                        </div>
                        <button class="btn btn-outline-secondary" onclick="alert('Exporting student directory CSV...');">
                            <i class="fas fa-download me-1"></i> Export Students
                        </button>
                    </div>
                </div>

                <!-- Stats Overview -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary"><i class="fas fa-user-graduate"></i></div>
                            <div class="stats-content"><div class="stats-label">Total Enrolled</div><div class="stats-value">456</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success"><i class="fas fa-user-check"></i></div>
                            <div class="stats-content"><div class="stats-label">Active Students</div><div class="stats-value">412</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning"><i class="fas fa-user-clock"></i></div>
                            <div class="stats-content"><div class="stats-label">New Batch 2024</div><div class="stats-value">128</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon info"><i class="fas fa-award"></i></div>
                            <div class="stats-content"><div class="stats-label">Alumni</div><div class="stats-value">44</div></div>
                        </div>
                    </div>
                </div>

                <!-- Search & Filters Bar -->
                <div class="filter-bar">
                    <div class="filter-row">
                        <div class="filter-group">
                            <label class="filter-label">Search Students</label>
                            <input type="text" class="filter-input" id="studentSearchInput" placeholder="Search by name, roll no, STU-ID or phone...">
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Course</label>
                            <select class="filter-select" id="courseFilter">
                                <option value="all">All Courses</option>
                                <option value="btech">B.Tech CSE</option>
                                <option value="mba">MBA Finance</option>
                                <option value="bca">BCA</option>
                                <option value="bsc">B.Sc Physics</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Batch Year</label>
                            <select class="filter-select" id="batchFilter">
                                <option value="all">All Batches</option>
                                <option value="2024">2024 - 2028</option>
                                <option value="2023">2023 - 2027</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Status</label>
                            <select class="filter-select" id="statusFilter">
                                <option value="all">All Status</option>
                                <option value="active">Active</option>
                                <option value="alumni">Alumni</option>
                            </select>
                        </div>
                        <button class="btn btn-secondary" style="height:40px" onclick="resetFilters()"><i class="fas fa-redo"></i> Reset</button>
                    </div>
                </div>

                <!-- 1. Table View (Primary) -->
                <div class="table-view active" id="tableView">
                    <div class="student-table-card">
                        <div style="overflow-x:auto">
                            <table class="student-table" id="studentTable">
                                <thead>
                                    <tr>
                                        <th>Student Name</th>
                                        <th>Student ID</th>
                                        <th>Roll Number</th>
                                        <th>Enrolled Course</th>
                                        <th>Contact / Email</th>
                                        <th>Admission Date</th>
                                        <th>Status</th>
                                        <th>Actions (Details & History)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-name="Priya Sharma" data-id="STU-2024-0347">
                                        <td>
                                            <div class="table-student">
                                                <div class="table-avatar">PS</div>
                                                <div>
                                                    <div class="fw-semibold">Priya Sharma</div>
                                                    <div class="text-muted small">Reg: #REG-2024-884</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="text-primary fw-bold">STU-2024-0347</span></td>
                                        <td><span class="badge bg-light text-dark border">24CSE042</span></td>
                                        <td>MBA Finance</td>
                                        <td><div>+91 98765 43211</div><div class="text-muted small">priya@email.com</div></td>
                                        <td>Dec 10, 2024</td>
                                        <td><span class="status-badge active"><i class="fas fa-circle" style="font-size:8px"></i> Active</span></td>
                                        <td>
                                            <div class="d-flex gap-1">
                                                <button class="btn btn-sm btn-outline-primary" title="View Student Details" onclick="window.location.href='student-details.html'"><i class="fas fa-eye me-1"></i> Details</button>
                                                <button class="btn btn-sm btn-outline-secondary" title="View Admission History" onclick="openAdmissionHistoryModal('Priya Sharma', 'STU-2024-0347')"><i class="fas fa-history me-1"></i> History</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr data-name="Rajesh Kumar" data-id="STU-2024-0348">
                                        <td>
                                            <div class="table-student">
                                                <div class="table-avatar">RK</div>
                                                <div>
                                                    <div class="fw-semibold">Rajesh Kumar</div>
                                                    <div class="text-muted small">Reg: #REG-2024-885</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="text-primary fw-bold">STU-2024-0348</span></td>
                                        <td><span class="badge bg-light text-dark border">24CSE043</span></td>
                                        <td>B.Tech CSE</td>
                                        <td><div>+91 98765 43210</div><div class="text-muted small">rajesh@email.com</div></td>
                                        <td>Dec 12, 2024</td>
                                        <td><span class="status-badge active"><i class="fas fa-circle" style="font-size:8px"></i> Active</span></td>
                                        <td>
                                            <div class="d-flex gap-1">
                                                <button class="btn btn-sm btn-outline-primary" title="View Student Details" onclick="window.location.href='student-details.html'"><i class="fas fa-eye me-1"></i> Details</button>
                                                <button class="btn btn-sm btn-outline-secondary" title="View Admission History" onclick="openAdmissionHistoryModal('Rajesh Kumar', 'STU-2024-0348')"><i class="fas fa-history me-1"></i> History</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr data-name="Amit Verma" data-id="STU-2024-0349">
                                        <td>
                                            <div class="table-student">
                                                <div class="table-avatar">AV</div>
                                                <div>
                                                    <div class="fw-semibold">Amit Verma</div>
                                                    <div class="text-muted small">Reg: #REG-2024-886</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="text-primary fw-bold">STU-2024-0349</span></td>
                                        <td><span class="badge bg-light text-dark border">24BCA012</span></td>
                                        <td>BCA</td>
                                        <td><div>+91 98765 11111</div><div class="text-muted small">amit@email.com</div></td>
                                        <td>Dec 14, 2024</td>
                                        <td><span class="status-badge active"><i class="fas fa-circle" style="font-size:8px"></i> Active</span></td>
                                        <td>
                                            <div class="d-flex gap-1">
                                                <button class="btn btn-sm btn-outline-primary" title="View Student Details" onclick="window.location.href='student-details.html'"><i class="fas fa-eye me-1"></i> Details</button>
                                                <button class="btn btn-sm btn-outline-secondary" title="View Admission History" onclick="openAdmissionHistoryModal('Amit Verma', 'STU-2024-0349')"><i class="fas fa-history me-1"></i> History</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="table-footer">
                            <div class="pagination-info">Showing <strong>1-3</strong> of <strong>456</strong> students</div>
                            <div class="pagination-controls">
                                <button class="page-btn" disabled><i class="fas fa-chevron-left"></i></button>
                                <button class="page-btn active">1</button><button class="page-btn">2</button><button class="page-btn">3</button>
                                <button class="page-btn"><i class="fas fa-chevron-right"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 2. Grid View -->
                <div class="students-grid" id="gridView">
                    <div class="student-card">
                        <div class="student-card-banner">
                            <div class="student-card-avatar">PS</div>
                        </div>
                        <div class="student-card-body">
                            <p class="student-card-name">Priya Sharma</p>
                            <p class="student-card-id">STU-2024-0347</p>
                            <p class="text-muted small mb-3"><i class="fas fa-book me-1"></i>MBA Finance • Roll: 24CSE042</p>
                            <div class="d-flex justify-content-between text-muted small border-top pt-2">
                                <span><i class="far fa-envelope me-1"></i>priya@email.com</span>
                                <span class="badge bg-success-subtle text-success">Active</span>
                            </div>
                        </div>
                        <div class="student-card-footer">
                            <button class="btn btn-sm btn-primary w-50" onclick="window.location.href='student-details.html'"><i class="fas fa-eye me-1"></i> Details</button>
                            <button class="btn btn-sm btn-outline-secondary w-50" onclick="openAdmissionHistoryModal('Priya Sharma', 'STU-2024-0347')"><i class="fas fa-history me-1"></i> History</button>
                        </div>
                    </div>
                </div>

            </div>
        </main>


    <div class="modal fade" id="admissionHistoryModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content" style="border-radius:var(--radius-xl)">
                <div class="modal-header border-bottom">
                    <div>
                        <h5 class="modal-title fw-bold" id="modalStudentTitle"><i class="fas fa-history text-primary me-2"></i>Admission History & Lifecycle</h5>
                        <p class="text-muted small mb-0" id="modalStudentSub">Student ID: STU-2024-0347</p>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <!-- Vertical Admission Timeline -->
                    <div class="timeline" style="position:relative;padding-left:30px;border-left:2px solid var(--primary-light)">
                        <div class="timeline-item mb-4" style="position:relative">
                            <div style="position:absolute;left:-41px;top:0;width:24px;height:24px;border-radius:50%;background:var(--success);color:white;display:flex;align-items:center;justify-content:center;font-size:11px"><i class="fas fa-check"></i></div>
                            <div class="fw-bold text-dark">Step 6: Enrolled & Student ID Generated</div>
                            <div class="text-muted small">Dec 14, 2024 • Tuition fee deposit verified (₹4.1L paid) • STU-2024-0347 generated</div>
                        </div>
                        <div class="timeline-item mb-4" style="position:relative">
                            <div style="position:absolute;left:-41px;top:0;width:24px;height:24px;border-radius:50%;background:var(--primary);color:white;display:flex;align-items:center;justify-content:center;font-size:11px"><i class="fas fa-check"></i></div>
                            <div class="fw-bold text-dark">Step 5: Admission Offer Letter Approved</div>
                            <div class="text-muted small">Dec 10, 2024 • Approved by Admission Manager</div>
                        </div>
                        <div class="timeline-item mb-4" style="position:relative">
                            <div style="position:absolute;left:-41px;top:0;width:24px;height:24px;border-radius:50%;background:var(--info);color:white;display:flex;align-items:center;justify-content:center;font-size:11px"><i class="fas fa-check"></i></div>
                            <div class="fw-bold text-dark">Step 4: Documents Verified</div>
                            <div class="text-muted small">Dec 8, 2024 • Marksheets & ID verified by Counselor Sarah Patel</div>
                        </div>
                        <div class="timeline-item mb-4" style="position:relative">
                            <div style="position:absolute;left:-41px;top:0;width:24px;height:24px;border-radius:50%;background:var(--warning);color:white;display:flex;align-items:center;justify-content:center;font-size:11px"><i class="fas fa-check"></i></div>
                            <div class="fw-bold text-dark">Step 3: Counseling Completed</div>
                            <div class="text-muted small">Dec 5, 2024 • Completed 1-on-1 counseling session</div>
                        </div>
                        <div class="timeline-item" style="position:relative">
                            <div style="position:absolute;left:-41px;top:0;width:24px;height:24px;border-radius:50%;background:var(--secondary);color:white;display:flex;align-items:center;justify-content:center;font-size:11px"><i class="fas fa-check"></i></div>
                            <div class="fw-bold text-dark">Step 1: Inquiry Submitted</div>
                            <div class="text-muted small">Dec 1, 2024 • Web Portal Inquiry #INQ-2024-0891</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="window.location.href='student-details.html'"><i class="fas fa-external-link-alt me-1"></i> View Full Details</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        // Sidebar Toggle
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // View Toggles
        const tableViewBtn = document.getElementById('tableViewBtn');
        const gridViewBtn = document.getElementById('gridViewBtn');
        const tableView = document.getElementById('tableView');
        const gridView = document.getElementById('gridView');

        tableViewBtn.addEventListener('click', function() {
            tableViewBtn.classList.add('active');
            gridViewBtn.classList.remove('active');
            tableView.classList.add('active');
            gridView.classList.remove('active');
        });

        gridViewBtn.addEventListener('click', function() {
            gridViewBtn.classList.add('active');
            tableViewBtn.classList.remove('active');
            gridView.classList.add('active');
            tableView.classList.remove('active');
        });

       
        function openAdmissionHistoryModal(name, id) {
            document.getElementById('modalStudentTitle').innerHTML = `<i class="fas fa-history text-primary me-2"></i>Admission History - ${name}`;
            document.getElementById('modalStudentSub').innerText = `Student ID: ${id}`;
            const modal = new bootstrap.Modal(document.getElementById('admissionHistoryModal'));
            modal.show();
        }
    </script>
</asp:Content>
