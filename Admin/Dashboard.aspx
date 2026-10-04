<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EduFlow.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Admin Dashboard - EduFlow CRM
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
             .quick-action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .quick-action-card {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: var(--radius-xl);
            padding: var(--spacing-lg);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .quick-action-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 25px -5px rgba(79, 70, 229, 0.3);
        }

        .quick-action-card.secondary {
            background: linear-gradient(135deg, var(--secondary) 0%, #0041a8 100%);
        }

        .quick-action-card.success {
            background: linear-gradient(135deg, var(--success) 0%, #16a34a 100%);
        }

        .quick-action-card.warning {
            background: linear-gradient(135deg, var(--warning) 0%, #d97706 100%);
        }

        .quick-action-icon {
            width: 48px;
            height: 48px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            font-size: 24px;
        }

        .quick-action-title {
            font-size: 14px;
            font-weight: 600;
            margin: 0;
        }

        .chart-container {
            position: relative;
            height: 300px;
        }

        .activity-item {
            display: flex;
            gap: 12px;
            padding: 12px 0;
            border-bottom: 1px solid var(--border-subtle);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            flex-shrink: 0;
        }

        .activity-content {
            flex: 1;
        }

        .activity-title {
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface);
            margin: 0 0 4px 0;
        }

        .activity-time {
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        .user-list-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px;
            border-radius: var(--radius-lg);
            transition: all 0.2s ease;
        }

        .user-list-item:hover {
            background: var(--surface-container-low);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 14px;
            flex-shrink: 0;
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .user-role {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }
     
       .dashboard-wrapper {
            overflow-x: hidden;
        }

        /* Quick actions responsive adjustments */
        .quick-action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: var(--spacing-md);
        }

        /* Chart container responsive adjustments */
        .chart-container {
            position: relative;
            width: 100%;
        }

        /* Table responsive adjustments */
        .table-container {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        /* User avatar responsive */
        .user-avatar {
            flex-shrink: 0;
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
            /* Make columns stack properly */
            .col-lg-8, .col-lg-4 {
                width: 100% !important;
            }
        }
        @media (max-width: 576px) {
            .filter-row { grid-template-columns: 1fr !important; }
            .role-cards-grid { grid-template-columns: 1fr !important; }
            .quick-action-grid { grid-template-columns: repeat(2, 1fr) !important; gap: 12px !important; }
            .users-grid { grid-template-columns: 1fr !important; }
            .form-actions { flex-direction: column !important; }
            .form-actions .btn { width: 100% !important; justify-content: center !important; }
            .stats-grid-4 { grid-template-columns: 1fr 1fr !important; }
            /* Ensure stats cards stack properly */
            .row.g-3 .col-md-3 {
                width: 100% !important;
            }
        }
        @media (max-width: 480px) {
            .quick-action-grid {
                grid-template-columns: 1fr 1fr !important;
                gap: 10px !important;
            }
            .quick-action-card {
                padding: 16px !important;
            }
            .quick-action-title {
                font-size: 12px !important;
            }
            .content-area {
                padding: 12px !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <main class="main-content" id="mainContent">
            <!-- Topbar -->
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="topbar-search">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search students, inquiries, applications...">
                    </div>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn">
                        <i class="fas fa-bell"></i>
                        <span class="badge"></span>
                    </button>
                    <button class="topbar-icon-btn">
                        <i class="fas fa-envelope"></i>
                        <span class="badge"></span>
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
                        <h1 class="headline-lg mb-1">Welcome back, Admin!</h1>
                        <p class="text-muted">Here's what's happening with your institution today.</p>
                    </div>
                    <button class="btn btn-primary">
                        <i class="fas fa-download"></i>
                        Download Report
                    </button>
                </div>

                <!-- Quick Actions -->
                <div class="quick-action-grid">
                    <div class="quick-action-card">
                        <div class="quick-action-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <p class="quick-action-title">Add Inquiry</p>
                    </div>
                    <div class="quick-action-card secondary">
                        <div class="quick-action-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <p class="quick-action-title">Schedule Counseling</p>
                    </div>
                    <div class="quick-action-card success">
                        <div class="quick-action-icon">
                            <i class="fas fa-file-import"></i>
                        </div>
                        <p class="quick-action-title">New Application</p>
                    </div>
                    <div class="quick-action-card warning">
                        <div class="quick-action-icon">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <p class="quick-action-title">Add Student</p>
                    </div>
                </div>

                <!-- Stats Cards (7 System Statistics) -->
                <div class="row g-3 mb-4">
                    <!-- 1. Total Inquiries -->
                    <div class="col-xl-3 col-md-6">
                        <div class="stats-card" onclick="window.location.href='inquiry-list.html'" style="cursor: pointer;">
                            <div class="stats-icon primary">
                                <i class="fas fa-clipboard-list"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Inquiries</div>
                                <div class="stats-value">1,284</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>12.5% from last month</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 2. Total Applications -->
                    <div class="col-xl-3 col-md-6">
                        <div class="stats-card" onclick="window.location.href='application-list.html'" style="cursor: pointer;">
                            <div class="stats-icon info">
                                <i class="fas fa-file-alt"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Applications</div>
                                <div class="stats-value">964</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>9.4% from last month</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 3. Total Admissions -->
                    <div class="col-xl-3 col-md-6">
                        <div class="stats-card" onclick="window.location.href='application-list.html'" style="cursor: pointer;">
                            <div class="stats-icon success">
                                <i class="fas fa-user-check"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Admissions</div>
                                <div class="stats-value">856</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>8.3% from last month</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 4. Total Students -->
                    <div class="col-xl-3 col-md-6">
                        <div class="stats-card" onclick="window.location.href='student-list.html'" style="cursor: pointer;">
                            <div class="stats-icon purple" style="background: rgba(139, 92, 246, 0.1); color: #8b5cf6;">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Students</div>
                                <div class="stats-value">3,420</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>15.2% YoY Growth</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 5. Total Users -->
                    <div class="col-xl-4 col-md-6">
                        <div class="stats-card" onclick="window.location.href='manage-users.html'" style="cursor: pointer;">
                            <div class="stats-icon info">
                                <i class="fas fa-users-cog"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Users</div>
                                <div class="stats-value">48</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-user-shield"></i>
                                    <span>3 System Roles (Admin, Manager, Counselor)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 6. Total Counselors -->
                    <div class="col-xl-4 col-md-6">
                        <div class="stats-card" onclick="window.location.href='counseling-list.html'" style="cursor: pointer;">
                            <div class="stats-icon primary">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Total Counselors</div>
                                <div class="stats-value">24</div>
                                <div class="stats-change positive">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>2 new this week</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 7. Pending Follow-ups -->
                    <div class="col-xl-4 col-md-6">
                        <div class="stats-card" onclick="window.location.href='followup-list.html'" style="cursor: pointer;">
                            <div class="stats-icon warning">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stats-content">
                                <div class="stats-label">Pending Follow-ups</div>
                                <div class="stats-value">47</div>
                                <div class="stats-change negative">
                                    <i class="fas fa-arrow-down"></i>
                                    <span>3.2% from yesterday</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- System Analytics & Charts -->
                <div class="row g-3">
                    <div class="col-lg-8">
                        <div class="row g-3 mb-3">
                            <div class="col-lg-7">
                                <div class="glass-card h-100">
                                    <div class="card-header">
                                        <div>
                                            <h3 class="card-title">Inquiry & Admission Trends</h3>
                                            <p class="card-subtitle">Monthly overview of inquiries vs admissions</p>
                                        </div>
                                        <button class="card-action">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                    </div>
                                    <div class="chart-container">
                                        <canvas id="trendChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="glass-card h-100">
                                    <div class="card-header">
                                        <div>
                                            <h3 class="card-title">Pipeline Stage Breakdown</h3>
                                            <p class="card-subtitle">Current lead distribution across stages</p>
                                        </div>
                                    </div>
                                    <div class="chart-container" style="height: 240px;">
                                        <canvas id="stageChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="glass-card">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Recent Applications</h3>
                                    <p class="card-subtitle">Latest application submissions</p>
                                </div>
                                <a href="application-list.html" class="btn btn-sm btn-secondary">View All</a>
                            </div>
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Student Name</th>
                                            <th>Course</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="user-avatar">RK</div>
                                                    <span>Rajesh Kumar</span>
                                                </div>
                                            </td>
                                            <td>B.Tech CSE</td>
                                            <td><span class="badge badge-success">Approved</span></td>
                                            <td>Dec 15, 2024</td>
                                            <td>
                                                <a href="application-details.html" class="btn btn-sm btn-secondary">View</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="user-avatar">PS</div>
                                                    <span>Priya Sharma</span>
                                                </div>
                                            </td>
                                            <td>MBA Finance</td>
                                            <td><span class="badge badge-warning">Pending Review</span></td>
                                            <td>Dec 15, 2024</td>
                                            <td>
                                                <a href="application-details.html" class="btn btn-sm btn-secondary">View</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="user-avatar">AV</div>
                                                    <span>Amit Verma</span>
                                                </div>
                                            </td>
                                            <td>BCA</td>
                                            <td><span class="badge badge-info">Under Review</span></td>
                                            <td>Dec 14, 2024</td>
                                            <td>
                                                <a href="application-details.html" class="btn btn-sm btn-secondary">View</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="user-avatar">SK</div>
                                                    <span>Sneha Kapoor</span>
                                                </div>
                                            </td>
                                            <td>B.Sc Physics</td>
                                            <td><span class="badge badge-success">Approved</span></td>
                                            <td>Dec 14, 2024</td>
                                            <td>
                                                <a href="application-details.html" class="btn btn-sm btn-secondary">View</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="glass-card">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Recent Activity</h3>
                                    <p class="card-subtitle">Latest system activities</p>
                                </div>
                            </div>
                            <div>
                                <div class="activity-item">
                                    <div class="activity-icon" style="background: rgba(79, 70, 229, 0.1); color: var(--primary);">
                                        <i class="fas fa-user-plus"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p class="activity-title">New inquiry added</p>
                                        <p class="activity-time">2 minutes ago</p>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon" style="background: rgba(34, 197, 94, 0.1); color: var(--success);">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p class="activity-title">Application approved</p>
                                        <p class="activity-time">15 minutes ago</p>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon" style="background: rgba(245, 158, 11, 0.1); color: var(--warning);">
                                        <i class="fas fa-calendar"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p class="activity-title">Counseling scheduled</p>
                                        <p class="activity-time">1 hour ago</p>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon" style="background: rgba(0, 81, 213, 0.1); color: var(--info);">
                                        <i class="fas fa-file-alt"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p class="activity-title">Document uploaded</p>
                                        <p class="activity-time">2 hours ago</p>
                                    </div>
                                </div>
                                <div class="activity-item">
                                    <div class="activity-icon" style="background: rgba(79, 70, 229, 0.1); color: var(--primary);">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                    <div class="activity-content">
                                        <p class="activity-title">Follow-up completed</p>
                                        <p class="activity-time">3 hours ago</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="glass-card mt-3">
                            <div class="card-header">
                                <div>
                                    <h3 class="card-title">Top Performers</h3>
                                    <p class="card-subtitle">Best counselors this month</p>
                                </div>
                            </div>
                            <div>
                                <div class="user-list-item">
                                    <div class="user-avatar">SP</div>
                                    <div class="user-info">
                                        <p class="user-name">Sarah Patel</p>
                                        <p class="user-role">45 Conversions</p>
                                    </div>
                                    <span class="badge badge-success">Top</span>
                                </div>
                                <div class="user-list-item">
                                    <div class="user-avatar">RG</div>
                                    <div class="user-info">
                                        <p class="user-name">Rahul Gupta</p>
                                        <p class="user-role">38 Conversions</p>
                                    </div>
                                </div>
                                <div class="user-list-item">
                                    <div class="user-avatar">MP</div>
                                    <div class="user-info">
                                        <p class="user-name">Meera Patil</p>
                                        <p class="user-role">32 Conversions</p>
                                    </div>
                                </div>
                                <div class="user-list-item">
                                    <div class="user-avatar">VK</div>
                                    <div class="user-info">
                                        <p class="user-name">Vikram Kumar</p>
                                        <p class="user-role">28 Conversions</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
