<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course_List.aspx.cs" Inherits="EduFlow.Admission_Manager.Course_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
        .view-toggle { display: flex; background: var(--surface-container); border-radius: var(--radius-full); padding: 4px; gap: 4px; }
        .view-toggle-btn { padding: 8px 16px; border: none; background: transparent; border-radius: var(--radius-full); font-size: 13px; font-weight: 500; color: var(--on-surface-variant); cursor: pointer; transition: all .2s; display: flex; align-items: center; gap: 6px; }
        .view-toggle-btn.active { background: var(--primary); color: white; box-shadow: 0 2px 8px rgba(79,70,229,.3); }

        .filter-bar { background: rgba(255,255,255,.8); backdrop-filter: blur(12px); border-radius: var(--radius-xl); border: 1px solid var(--border-subtle); padding: var(--spacing-lg); margin-bottom: var(--spacing-lg); }
        .filter-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: var(--spacing-md); }
        .filter-group { display: flex; flex-direction: column; gap: 6px; }
        .filter-label { font-size: 11px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; letter-spacing: .05em; }
        .filter-select, .filter-input { height: 40px; border: 1px solid var(--border-subtle); border-radius: var(--radius-md); padding: 0 12px; font-size: 13px; background: white; }
        .filter-select:focus, .filter-input:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(79,70,229,.1); }

        /* Course Grid */
        .course-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(340px, 1fr)); gap: var(--spacing-lg); }
        .course-card { background: rgba(255,255,255,.8); backdrop-filter: blur(12px); border-radius: var(--radius-xl); border: 1px solid var(--border-subtle); overflow: hidden; transition: all .3s; }
        .course-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-lg); }

        .course-card-banner { height: 100px; position: relative; overflow: hidden; display: flex; align-items: center; justify-content: center; }
        .course-card-banner.engineering { background: linear-gradient(135deg,#4f46e5,#0051d5); }
        .course-card-banner.management { background: linear-gradient(135deg,#0051d5,#006d62); }
        .course-card-banner.computer { background: linear-gradient(135deg,#6366f1,#8b5cf6); }

        .course-banner-icon { font-size: 42px; color: rgba(255,255,255,.18); position: absolute; right: 20px; bottom: 10px; }
        .course-banner-badge { position: absolute; top: 12px; left: 12px; background: rgba(255,255,255,.25); backdrop-filter: blur(10px); padding: 4px 12px; border-radius: var(--radius-full); font-size: 11px; font-weight: 600; color: white; }

        .course-card-body { padding: var(--spacing-lg); }
        .course-card-name { font-size: 17px; font-weight: 700; color: var(--on-surface); margin: 0 0 2px; }
        .course-card-code { font-size: 12px; color: var(--primary); font-weight: 600; margin: 0 0 8px; }

        .course-status { display: inline-flex; align-items: center; gap: 4px; padding: 4px 12px; border-radius: var(--radius-full); font-size: 11px; font-weight: 600; }
        .course-status.active { background: rgba(34,197,94,.1); color: var(--success); }
        .course-status.inactive { background: rgba(239,68,68,.1); color: var(--danger); }

        .table-view { display: none; }
        .table-view.active { display: block; }
        .grid-view.active { display: grid; }

        .course-table-card { background: rgba(255,255,255,.8); backdrop-filter: blur(12px); border-radius: var(--radius-xl); border: 1px solid var(--border-subtle); overflow: hidden; }
        .course-table { width: 100%; border-collapse: collapse; }
        .course-table thead { background: var(--surface-container-low); }
        .course-table th { padding: 14px 16px; font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; border-bottom: 1px solid var(--border-subtle); white-space: nowrap; }
        .course-table td { padding: 14px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; vertical-align: middle; }

        .action-btn-sm { width: 32px; height: 32px; border: 1px solid var(--border-subtle); background: white; border-radius: var(--radius-md); cursor: pointer; display: inline-flex; align-items: center; justify-content: center; }
        .action-btn-sm:hover { background: var(--primary); color: white; border-color: var(--primary); }
        .action-btn-sm.delete:hover { background: var(--danger); color: white; border-color: var(--danger); }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                    <div class="topbar-search"><i class="fas fa-search"></i><input type="text" id="courseSearchInput" placeholder="Search course name or code..."></div>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button>
                    <button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button>
                </div>
            </header>

            <div class="content-area">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h1 class="headline-lg mb-1">Course Management</h1>
                        <p class="text-muted mb-0">Manage academic programs, course codes, tuition fees, and status activation</p>
                    </div>
                    <div class="d-flex gap-2 align-items-center flex-wrap">
                        <div class="view-toggle">
                            <button class="view-toggle-btn active" id="gridViewBtn"><i class="fas fa-th-large"></i> Grid View</button>
                            <button class="view-toggle-btn" id="tableViewBtn"><i class="fas fa-list"></i> Table View</button>
                        </div>
                        <button class="btn btn-primary" onclick="openAddCourseModal()">
                            <i class="fas fa-plus me-1"></i> Add Course
                        </button>
                    </div>
                </div>

                <!-- Stats Overview -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary"><i class="fas fa-book-open"></i></div>
                            <div class="stats-content"><div class="stats-label">Total Courses</div><div class="stats-value">12</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success"><i class="fas fa-check-circle"></i></div>
                            <div class="stats-content"><div class="stats-label">Active Programs</div><div class="stats-value">10</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning"><i class="fas fa-pause-circle"></i></div>
                            <div class="stats-content"><div class="stats-label">Inactive Programs</div><div class="stats-value">2</div></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon info"><i class="fas fa-layer-group"></i></div>
                            <div class="stats-content"><div class="stats-label">Departments</div><div class="stats-value">5</div></div>
                        </div>
                    </div>
                </div>

                <!-- 1. Grid View (Cards with Actions) -->
                <div class="course-grid grid-view active" id="gridView">
                    <!-- Course 1 -->
                    <div class="course-card">
                        <div class="course-card-banner engineering">
                            <i class="fas fa-microchip course-banner-icon"></i>
                            <span class="course-banner-badge">UG • Engineering</span>
                        </div>
                        <div class="course-card-body">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h3 class="course-card-name">B.Tech Computer Science</h3>
                                    <p class="course-card-code">CSE-BTECH-001</p>
                                </div>
                                <span class="course-status active" id="cardStatus-1"><i class="fas fa-circle" style="font-size:6px"></i> Active</span>
                            </div>
                            <div class="row g-2 text-muted small my-2">
                                <div class="col-6"><i class="far fa-clock text-primary me-1"></i>4 Years</div>
                                <div class="col-6"><i class="fas fa-rupee-sign text-primary me-1"></i>₹3.8L / Year</div>
                                <div class="col-6"><i class="fas fa-chair text-primary me-1"></i>120 Seats</div>
                                <div class="col-6"><i class="fas fa-users text-primary me-1"></i>98 Enrolled</div>
                            </div>
                        </div>
                        <div class="p-3 bg-light border-top d-flex justify-content-between align-items-center">
                            <div class="form-check form-switch mb-0">
                                <input class="form-check-input" type="checkbox" checked id="statusSwitch-1" onchange="toggleCourseStatus(1, 'B.Tech Computer Science', this)">
                                <label class="form-check-label small text-muted" for="statusSwitch-1">Active</label>
                            </div>
                            <div class="d-flex gap-1">
                                <button class="btn btn-sm btn-outline-primary" title="Edit Course" onclick="openEditCourseModal(1, 'CSE-BTECH-001', 'B.Tech Computer Science', 'Engineering', 'Undergraduate', '4 Years', '380000', '120')"><i class="fas fa-edit me-1"></i> Edit</button>
                                <button class="btn btn-sm btn-outline-danger" title="Delete Course" onclick="openDeleteModal('B.Tech Computer Science')"><i class="fas fa-trash"></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- Course 2 -->
                    <div class="course-card">
                        <div class="course-card-banner management">
                            <i class="fas fa-chart-pie course-banner-icon"></i>
                            <span class="course-banner-badge">PG • Management</span>
                        </div>
                        <div class="course-card-body">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h3 class="course-card-name">MBA Finance</h3>
                                    <p class="course-card-code">MBA-FIN-001</p>
                                </div>
                                <span class="course-status active" id="cardStatus-2"><i class="fas fa-circle" style="font-size:6px"></i> Active</span>
                            </div>
                            <div class="row g-2 text-muted small my-2">
                                <div class="col-6"><i class="far fa-clock text-primary me-1"></i>2 Years</div>
                                <div class="col-6"><i class="fas fa-rupee-sign text-primary me-1"></i>₹5.0L / Year</div>
                                <div class="col-6"><i class="fas fa-chair text-primary me-1"></i>60 Seats</div>
                                <div class="col-6"><i class="fas fa-users text-primary me-1"></i>52 Enrolled</div>
                            </div>
                        </div>
                        <div class="p-3 bg-light border-top d-flex justify-content-between align-items-center">
                            <div class="form-check form-switch mb-0">
                                <input class="form-check-input" type="checkbox" checked id="statusSwitch-2" onchange="toggleCourseStatus(2, 'MBA Finance', this)">
                                <label class="form-check-label small text-muted" for="statusSwitch-2">Active</label>
                            </div>
                            <div class="d-flex gap-1">
                                <button class="btn btn-sm btn-outline-primary" title="Edit Course" onclick="openEditCourseModal(2, 'MBA-FIN-001', 'MBA Finance', 'Management', 'Postgraduate', '2 Years', '500000', '60')"><i class="fas fa-edit me-1"></i> Edit</button>
                                <button class="btn btn-sm btn-outline-danger" title="Delete Course" onclick="openDeleteModal('MBA Finance')"><i class="fas fa-trash"></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- Course 3 -->
                    <div class="course-card">
                        <div class="course-card-banner computer">
                            <i class="fas fa-laptop-code course-banner-icon"></i>
                            <span class="course-banner-badge">UG • Computer Apps</span>
                        </div>
                        <div class="course-card-body">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h3 class="course-card-name">BCA</h3>
                                    <p class="course-card-code">BCA-001</p>
                                </div>
                                <span class="course-status active" id="cardStatus-3"><i class="fas fa-circle" style="font-size:6px"></i> Active</span>
                            </div>
                            <div class="row g-2 text-muted small my-2">
                                <div class="col-6"><i class="far fa-clock text-primary me-1"></i>3 Years</div>
                                <div class="col-6"><i class="fas fa-rupee-sign text-primary me-1"></i>₹2.1L / Year</div>
                                <div class="col-6"><i class="fas fa-chair text-primary me-1"></i>90 Seats</div>
                                <div class="col-6"><i class="fas fa-users text-primary me-1"></i>75 Enrolled</div>
                            </div>
                        </div>
                        <div class="p-3 bg-light border-top d-flex justify-content-between align-items-center">
                            <div class="form-check form-switch mb-0">
                                <input class="form-check-input" type="checkbox" checked id="statusSwitch-3" onchange="toggleCourseStatus(3, 'BCA', this)">
                                <label class="form-check-label small text-muted" for="statusSwitch-3">Active</label>
                            </div>
                            <div class="d-flex gap-1">
                                <button class="btn btn-sm btn-outline-primary" title="Edit Course" onclick="openEditCourseModal(3, 'BCA-001', 'BCA', 'Computer Applications', 'Undergraduate', '3 Years', '210000', '90')"><i class="fas fa-edit me-1"></i> Edit</button>
                                <button class="btn btn-sm btn-outline-danger" title="Delete Course" onclick="openDeleteModal('BCA')"><i class="fas fa-trash"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 2. Table View -->
                <div class="table-view" id="tableView">
                    <div class="course-table-card">
                        <div style="overflow-x:auto">
                            <table class="course-table" id="courseTable">
                                <thead>
                                    <tr>
                                        <th>Course Name</th>
                                        <th>Code</th>
                                        <th>Department</th>
                                        <th>Duration</th>
                                        <th>Annual Fee</th>
                                        <th>Total Seats</th>
                                        <th>Status</th>
                                        <th>Actions (Edit / Delete / Toggle)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><strong class="text-dark">B.Tech Computer Science</strong></td>
                                        <td><span class="text-primary fw-bold">CSE-BTECH-001</span></td>
                                        <td>Engineering</td>
                                        <td>4 Years</td>
                                        <td>₹3,80,000</td>
                                        <td>120</td>
                                        <td><span class="course-status active"><i class="fas fa-circle" style="font-size:6px"></i> Active</span></td>
                                        <td>
                                            <div class="d-flex gap-1">
                                                <button class="action-btn-sm" title="Edit Course" onclick="openEditCourseModal(1, 'CSE-BTECH-001', 'B.Tech Computer Science', 'Engineering', 'Undergraduate', '4 Years', '380000', '120')"><i class="fas fa-edit"></i></button>
                                                <button class="action-btn-sm delete" title="Delete Course" onclick="openDeleteModal('B.Tech Computer Science')"><i class="fas fa-trash"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong class="text-dark">MBA Finance</strong></td>
                                        <td><span class="text-primary fw-bold">MBA-FIN-001</span></td>
                                        <td>Management</td>
                                        <td>2 Years</td>
                                        <td>₹5,00,000</td>
                                        <td>60</td>
                                        <td><span class="course-status active"><i class="fas fa-circle" style="font-size:6px"></i> Active</span></td>
                                        <td>
                                            <div class="d-flex gap-1">
                                                <button class="action-btn-sm" title="Edit Course" onclick="openEditCourseModal(2, 'MBA-FIN-001', 'MBA Finance', 'Management', 'Postgraduate', '2 Years', '500000', '60')"><i class="fas fa-edit"></i></button>
                                                <button class="action-btn-sm delete" title="Delete Course" onclick="openDeleteModal('MBA Finance')"><i class="fas fa-trash"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
