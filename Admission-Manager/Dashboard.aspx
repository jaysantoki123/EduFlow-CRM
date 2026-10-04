<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EduFlow.Admission_Manager.Dashboard" %>
<asp:Content
    ID="Content1"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Dashboard | EduFlow CRM

</asp:Content>
<asp:Content
    ID="Content2"
    ContentPlaceHolderID="HeadContent"
    runat="server">

    <style>
         .application-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-md);
            transition: all 0.3s ease;
        }

        .application-card:hover {
            box-shadow: var(--shadow-lg);
            transform: translateX(4px);
        }

        .application-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-md);
        }

        .application-student {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .application-meta {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: var(--spacing-md);
            padding-top: var(--spacing-md);
            border-top: 1px solid var(--border-subtle);
        }

        .meta-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .meta-label {
            font-size: 11px;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.05em;
        }

        .meta-value {
            font-size: 14px;
            color: var(--on-surface);
            font-weight: 500;
        }

        .progress-container {
            margin-top: var(--spacing-md);
        }

        .progress-label {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            margin-bottom: 8px;
        }

        .progress-bar-custom {
            height: 6px;
            background: var(--border-subtle);
            border-radius: var(--radius-full);
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-full);
            transition: width 0.3s ease;
        }

        .task-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .task-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px;
            border-radius: var(--radius-lg);
            margin-bottom: 8px;
            background: var(--surface-container-low);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .task-item:hover {
            background: var(--surface-container);
        }

        .task-checkbox {
            width: 20px;
            height: 20px;
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-sm);
            cursor: pointer;
            flex-shrink: 0;
        }

        .task-checkbox.checked {
            background: var(--success);
            border-color: var(--success);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .task-checkbox.checked::after {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: white;
            font-size: 10px;
        }

        .task-content {
            flex: 1;
        }

        .task-title {
            font-size: 14px;
            color: var(--on-surface);
            margin: 0;
        }

        .task-item.completed .task-title {
            text-decoration: line-through;
            color: var(--on-surface-variant);
        }



        @media (max-width: 768px) {
            .calendar-layout { grid-template-columns: 1fr !important; }
            .search-box { width: 100% !important; }
            .filter-group { min-width: auto !important; width: 100% !important; }
            .table-container, .user-table-card, .inquiry-table-card, .counseling-table-card,
            .followup-table-card, .student-table-card, .application-table-card { overflow-x: auto !important; -webkit-overflow-scrolling: touch; }
            .table, .user-table, .matrix-table { min-width: 550px !important; }
            .matrix-table { min-width: 800px !important; }
            .card-header { flex-wrap: wrap !important; gap: 8px !important; }
            .table-header { flex-direction: column !important; align-items: flex-start !important; }
            .table-actions { width: 100% !important; flex-wrap: wrap !important; }
            .table-footer { flex-direction: column !important; gap: 12px !important; align-items: flex-start !important; }
            .permissions-detail-layout { grid-template-columns: 1fr !important; }
            .role-cards-grid { grid-template-columns: 1fr 1fr !important; }
        }
        @media (max-width: 576px) {
            .filter-row { grid-template-columns: 1fr !important; }
            .role-cards-grid { grid-template-columns: 1fr !important; }
            .quick-action-grid { grid-template-columns: repeat(2, 1fr) !important; }
            .users-grid { grid-template-columns: 1fr !important; }
            .form-actions { flex-direction: column !important; }
            .form-actions .btn { width: 100% !important; justify-content: center !important; }
            .stats-grid-4 { grid-template-columns: 1fr 1fr !important; }
        }
    </style>

</asp:Content>


<asp:Content
    ID="Content3"
    ContentPlaceHolderID="MainContent"
    runat="server">

             <main class="main-content" id="mainContent">
            <!-- Topbar -->
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="topbar-search">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search applications, students...">
                    </div>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn">
                        <i class="fas fa-bell"></i>
                        <span class="badge"></span>
                    </button>
                    <button class="topbar-icon-btn">
                        <i class="fas fa-envelope"></i>
                    </button>
                    <button class="topbar-icon-btn">
                        <i class="fas fa-user-circle"></i>
                    </button>
                </div>
            </header>

            <!-- Content Area -->
            <div class="content-area">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h1 class="headline-lg mb-1">Admission Management</h1>
                        <p class="text-muted">Manage and process student applications efficiently.</p>
                    </div>
                    <button class="btn btn-primary">
                        <i class="fas fa-filter"></i>
                        Filter Applications
                    </button>
                </div>

                <!-- Stats Cards -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning">
                                <i class="fas fa-hourglass-half"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Pending Review</div>
                                <div class="stats-value">28</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>5 new today</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success">
                                <i class="fas fa-check-double"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Approved</div>
                                <div class="stats-value">156</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>12 this week</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon danger">
                                <i class="fas fa-file-upload"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Doc Verification</div>
                                <div class="stats-value">12</div>
                                <div class="stats-change negative">
                                    <i class="fas fa-clock"></i>
                                    <span>Requires action</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary">
                                <i class="fas fa-percentage"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Conversion Rate</div>
                                <div class="stats-value">68%</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>4% from last month</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Content Grid -->
                <div class="row g-3">
                    <div class="col-lg-8">
                        <div class="glass-card">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Applications Requiring Action</h3>
                                    <p class="card-subtitle">Review and process these applications</p>
                                </div>
                            </div>

                            <!-- Application Card 1 -->
                            <div class="application-card">
                                <div class="application-header">
                                    <div class="application-student">
                                        <div class="user-avatar">AK</div>
                                        <div>
                                            <h4 style="margin: 0; font-size: 16px; font-weight: 600;">Arjun Kumar</h4>
                                            <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Application ID: #APP2024-1245</p>
                                        </div>
                                    </div>
                                    <span class="badge badge-warning">Pending Review</span>
                                </div>
                                <div class="application-meta">
                                    <div class="meta-item">
                                        <span class="meta-label">Course</span>
                                        <span class="meta-value">B.Tech Computer Science</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Applied Date</span>
                                        <span class="meta-value">Dec 15, 2024</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Contact</span>
                                        <span class="meta-value">+91 98765 43210</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Documents</span>
                                        <span class="meta-value">8/8 Uploaded</span>
                                    </div>
                                </div>
                                <div class="progress-container">
                                    <div class="progress-label">
                                        <span style="color: var(--on-surface-variant); font-weight: 500;">Application Progress</span>
                                        <span style="color: var(--primary); font-weight: 600;">75%</span>
                                    </div>
                                    <div class="progress-bar-custom">
                                        <div class="progress-fill" style="width: 75%;"></div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2 mt-3">
                                    <button class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i> Review
                                    </button>
                                    <button class="btn btn-secondary btn-sm">
                                        <i class="fas fa-check"></i> Approve
                                    </button>
                                    <button class="btn btn-secondary btn-sm">
                                        <i class="fas fa-times"></i> Reject
                                    </button>
                                </div>
                            </div>

                            <!-- Application Card 2 -->
                            <div class="application-card">
                                <div class="application-header">
                                    <div class="application-student">
                                        <div class="user-avatar">PM</div>
                                        <div>
                                            <h4 style="margin: 0; font-size: 16px; font-weight: 600;">Priya Malhotra</h4>
                                            <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Application ID: #APP2024-1244</p>
                                        </div>
                                    </div>
                                    <span class="badge badge-danger">Doc Pending</span>
                                </div>
                                <div class="application-meta">
                                    <div class="meta-item">
                                        <span class="meta-label">Course</span>
                                        <span class="meta-value">MBA Finance</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Applied Date</span>
                                        <span class="meta-value">Dec 14, 2024</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Contact</span>
                                        <span class="meta-value">+91 98765 43211</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Documents</span>
                                        <span class="meta-value">6/8 Uploaded</span>
                                    </div>
                                </div>
                                <div class="progress-container">
                                    <div class="progress-label">
                                        <span style="color: var(--on-surface-variant); font-weight: 500;">Application Progress</span>
                                        <span style="color: var(--warning); font-weight: 600;">50%</span>
                                    </div>
                                    <div class="progress-bar-custom">
                                        <div class="progress-fill" style="width: 50%; background: linear-gradient(90deg, var(--warning) 0%, #d97706 100%);"></div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2 mt-3">
                                    <button class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i> Review
                                    </button>
                                    <button class="btn btn-secondary btn-sm">
                                        <i class="fas fa-bell"></i> Send Reminder
                                    </button>
                                </div>
                            </div>

                            <!-- Application Card 3 -->
                            <div class="application-card">
                                <div class="application-header">
                                    <div class="application-student">
                                        <div class="user-avatar">RS</div>
                                        <div>
                                            <h4 style="margin: 0; font-size: 16px; font-weight: 600;">Rahul Singh</h4>
                                            <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Application ID: #APP2024-1243</p>
                                        </div>
                                    </div>
                                    <span class="badge badge-info">Under Review</span>
                                </div>
                                <div class="application-meta">
                                    <div class="meta-item">
                                        <span class="meta-label">Course</span>
                                        <span class="meta-value">BCA</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Applied Date</span>
                                        <span class="meta-value">Dec 14, 2024</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Contact</span>
                                        <span class="meta-value">+91 98765 43212</span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Documents</span>
                                        <span class="meta-value">8/8 Uploaded</span>
                                    </div>
                                </div>
                                <div class="progress-container">
                                    <div class="progress-label">
                                        <span style="color: var(--on-surface-variant); font-weight: 500;">Application Progress</span>
                                        <span style="color: var(--info); font-weight: 600;">85%</span>
                                    </div>
                                    <div class="progress-bar-custom">
                                        <div class="progress-fill" style="width: 85%; background: linear-gradient(90deg, var(--info) 0%, #0041a8 100%);"></div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2 mt-3">
                                    <button class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i> Review
                                    </button>
                                    <button class="btn btn-secondary btn-sm">
                                        <i class="fas fa-check"></i> Approve
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="glass-card">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Today's Tasks</h3>
                                    <p class="card-subtitle">12 tasks remaining</p>
                                </div>
                            </div>
                            <ul class="task-list">
                                <li class="task-item">
                                    <div class="task-checkbox"></div>
                                    <div class="task-content">
                                        <p class="task-title">Review 5 pending applications</p>
                                    </div>
                                </li>
                                <li class="task-item completed">
                                    <div class="task-checkbox checked"></div>
                                    <div class="task-content">
                                        <p class="task-title">Verify documents for Arjun Kumar</p>
                                    </div>
                                </li>
                                <li class="task-item">
                                    <div class="task-checkbox"></div>
                                    <div class="task-content">
                                        <p class="task-title">Send admission letters (10 students)</p>
                                    </div>
                                </li>
                                <li class="task-item">
                                    <div class="task-checkbox"></div>
                                    <div class="task-content">
                                        <p class="task-title">Follow up with incomplete applications</p>
                                    </div>
                                </li>
                                <li class="task-item completed">
                                    <div class="task-checkbox checked"></div>
                                    <div class="task-content">
                                        <p class="task-title">Update admission status report</p>
                                    </div>
                                </li>
                                <li class="task-item">
                                    <div class="task-checkbox"></div>
                                    <div class="task-content">
                                        <p class="task-title">Schedule interview for MBA candidates</p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="glass-card mt-3">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Document Status</h3>
                                    <p class="card-subtitle">Verification overview</p>
                                </div>
                            </div>
                            <div>
                                <div class="d-flex justify-content-between align-items-center mb-3 pb-3" style="border-bottom: 1px solid var(--border-subtle);">
                                    <div>
                                        <p style="margin: 0; font-size: 14px; font-weight: 500;">Verified Documents</p>
                                        <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">All documents approved</p>
                                    </div>
                                    <div class="stats-value" style="font-size: 24px; color: var(--success);">142</div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3 pb-3" style="border-bottom: 1px solid var(--border-subtle);">
                                    <div>
                                        <p style="margin: 0; font-size: 14px; font-weight: 500;">Pending Verification</p>
                                        <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Awaiting review</p>
                                    </div>
                                    <div class="stats-value" style="font-size: 24px; color: var(--warning);">12</div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p style="margin: 0; font-size: 14px; font-weight: 500;">Incomplete</p>
                                        <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Missing documents</p>
                                    </div>
                                    <div class="stats-value" style="font-size: 24px; color: var(--danger);">5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

</asp:Content>