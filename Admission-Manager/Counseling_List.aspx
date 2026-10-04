<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Counseling_List.aspx.cs" Inherits="EduFlow.Admission_Manager.Counseling_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Counseling List - EduFlow
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

        /* Tabs Navigation */
        .tabs-nav {
            display: flex;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: 8px;
            gap: 4px;
            margin-bottom: var(--spacing-lg);
            overflow-x: auto;
        }

        .tab-btn {
            padding: 10px 20px;
            border: none;
            background: transparent;
            border-radius: var(--radius-lg);
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface-variant);
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.2s ease;
            position: relative;
        }

        .tab-btn:hover {
            background: var(--surface-container);
        }

        .tab-btn.active {
            background: var(--primary);
            color: white;
        }

        .tab-count {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 22px;
            height: 22px;
            padding: 0 6px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 600;
            margin-left: 8px;
        }

        .tab-btn .tab-count {
            background: rgba(255, 255, 255, 0.2);
            color: inherit;
        }

        .tab-btn:not(.active) .tab-count {
            background: var(--surface-container-high);
            color: var(--on-surface-variant);
        }

        /* Sessions Grid */
        .sessions-grid {
            display: none;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: var(--spacing-lg);
        }

        .sessions-grid.active { display: grid; }

        .session-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .session-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .session-card-stripe { height: 4px; }
        .session-card-stripe.scheduled { background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%); }
        .session-card-stripe.completed { background: linear-gradient(90deg, var(--success) 0%, #16a34a 100%); }
        .session-card-stripe.cancelled { background: linear-gradient(90deg, var(--danger) 0%, #dc2626 100%); }
        .session-card-stripe.ongoing { background: linear-gradient(90deg, var(--warning) 0%, #d97706 100%); }
        .session-card-stripe.rescheduled { background: linear-gradient(90deg, var(--info) 0%, #0041a8 100%); }

        .session-card-body { padding: var(--spacing-lg); }

        .session-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .session-id { font-size: 13px; font-weight: 700; color: var(--primary); }

        .session-status {
            font-size: 12px;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: var(--radius-full);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .session-status.scheduled { background: rgba(79, 70, 229, 0.1); color: var(--primary); }
        .session-status.completed { background: rgba(34, 197, 94, 0.1); color: var(--success); }
        .session-status.ongoing { background: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .session-status.cancelled { background: rgba(239, 68, 68, 0.1); color: var(--danger); }
        .session-status.rescheduled { background: rgba(0, 81, 213, 0.1); color: var(--info); }

        .session-student {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
        }

        .session-avatar {
            width: 44px;
            height: 44px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 15px;
        }

        .session-student-name { font-size: 16px; font-weight: 700; color: var(--on-surface); margin: 0 0 2px; }
        .session-student-course { font-size: 13px; color: var(--on-surface-variant); margin: 0; }

        .session-details-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            background: var(--surface-container-low);
            padding: 12px;
            border-radius: var(--radius-lg);
            margin-bottom: 16px;
        }

        .session-detail {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        .session-detail i { color: var(--primary); width: 14px; }

        .session-counselor {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-top: 12px;
            border-top: 1px solid var(--border-subtle);
        }

        .counselor-avatar-sm {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            font-size: 11px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .counselor-name-sm { font-size: 13px; font-weight: 600; margin: 0; color: var(--on-surface); }
        .counselor-role-sm { font-size: 11px; color: var(--on-surface-variant); margin: 0; }

        .session-card-footer {
            padding: 12px var(--spacing-lg);
            background: var(--surface-container-low);
            border-top: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            gap: 8px;
        }

        /* Performance Section */
        .performance-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
            margin-top: var(--spacing-lg);
            display: none;
        }

        .performance-section.active { display: block; }

        .performance-header {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-view { display: none; }
        .table-view.active { display: block; }

        .sessions-table-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
        }

        .sessions-table { width: 100%; border-collapse: collapse; }
        .sessions-table th { padding: 14px 16px; background: var(--surface-container-low); font-size: 12px; font-weight: 600; text-transform: uppercase; color: var(--on-surface-variant); border-bottom: 1px solid var(--border-subtle); }
        .sessions-table td { padding: 14px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; }
        .table-footer { padding: var(--spacing-md) var(--spacing-lg); display: flex; justify-content: space-between; align-items: center; }

        .action-btn { width: 32px; height: 32px; border: 1px solid var(--border-subtle); background: white; border-radius: var(--radius-md); cursor: pointer; display: inline-flex; align-items: center; justify-content: center; }
        .action-btn:hover { background: var(--primary); color: white; border-color: var(--primary); }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                    <div class="topbar-search"><i class="fas fa-search"></i><input type="text" placeholder="Search counseling sessions..."></div>
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
                        <h1 class="headline-lg mb-1">Counseling Monitoring</h1>
                        <p class="text-muted mb-0">Monitor all student counseling sessions, counselor ratings, and appointment schedules</p>
                    </div>
                    <div class="d-flex gap-2 align-items-center flex-wrap">
                        <div class="view-toggle">
                            <button type="button" class="view-toggle-btn active" id="cardViewBtn"><i class="fas fa-th-large"></i> Cards</button>
                            <button type="button" class="view-toggle-btn" id="tableViewBtn"><i class="fas fa-list"></i> Table</button>
                            <button type="button" class="view-toggle-btn" id="perfViewBtn"><i class="fas fa-chart-bar"></i> Performance</button>
                        </div>
                        <a href="counselor-calendar.html" class="btn btn-outline-primary">
                            <i class="far fa-calendar-alt me-1"></i> Counseling Calendar
                        </a>
                    </div>
                </div>

                <!-- Stats Overview -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary"><i class="fas fa-calendar-check"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Today's Sessions</div>
                                <div class="stats-value">8</div>
                                <div class="stats-change positive"><i class="fas fa-arrow-up"></i> 3 scheduled today</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success"><i class="fas fa-check-double"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Completed Sessions</div>
                                <div class="stats-value">124</div>
                                <div class="stats-change positive"><i class="fas fa-chart-line"></i> 85% completion rate</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning"><i class="fas fa-star"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Avg Counselor Rating</div>
                                <div class="stats-value">4.8 / 5.0</div>
                                <div class="stats-change positive"><i class="fas fa-smile"></i> High student feedback</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon info"><i class="fas fa-user-friends"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Active Counselors</div>
                                <div class="stats-value">8 Counselors</div>
                                <div class="stats-change positive"><i class="fas fa-check-circle"></i> 100% capacity</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Session Filters Tabs -->
                <div class="tabs-nav" id="sessionsTabs">
                    <button class="tab-btn active" data-tab="all">All Sessions <span class="tab-count">148</span></button>
                    <button class="tab-btn" data-tab="scheduled">Scheduled <span class="tab-count">18</span></button>
                    <button class="tab-btn" data-tab="ongoing">Ongoing <span class="tab-count">3</span></button>
                    <button class="tab-btn" data-tab="completed">Completed <span class="tab-count">124</span></button>
                    <button class="tab-btn" data-tab="rescheduled">Rescheduled <span class="tab-count">5</span></button>
                </div>

                <!-- 1. Card View -->
                <div class="sessions-grid active" id="cardView">
                    <!-- Session Card 1 -->
                    <div class="session-card">
                        <div class="session-card-stripe scheduled"></div>
                        <div class="session-card-body">
                            <div class="session-top">
                                <span class="session-id">#COU-2024-0045</span>
                                <span class="session-status scheduled"><i class="fas fa-circle" style="font-size:8px"></i> Scheduled</span>
                            </div>
                            <div class="session-student">
                                <div class="session-avatar">RK</div>
                                <div>
                                    <p class="session-student-name">Rajesh Kumar</p>
                                    <p class="session-student-course">B.Tech Computer Science</p>
                                </div>
                            </div>
                            <div class="session-details-row">
                                <div class="session-detail"><i class="far fa-calendar"></i><span>Dec 18, 2024</span></div>
                                <div class="session-detail"><i class="far fa-clock"></i><span>10:00 AM - 11:00 AM</span></div>
                                <div class="session-detail"><i class="fas fa-video"></i><span>Online (Zoom)</span></div>
                                <div class="session-detail"><i class="fas fa-tag"></i><span>First Counseling</span></div>
                            </div>
                            <div class="session-counselor">
                                <div class="counselor-avatar-sm">SP</div>
                                <div>
                                    <p class="counselor-name-sm">Sarah Patel</p>
                                    <p class="counselor-role-sm">Senior Counselor</p>
                                </div>
                            </div>
                        </div>
                        <div class="session-card-footer">
                            <a class="btn btn-sm btn-primary w-100" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> View Session Details</a>
                        </div>
                    </div>

                    <!-- Session Card 2 -->
                    <div class="session-card">
                        <div class="session-card-stripe ongoing"></div>
                        <div class="session-card-body">
                            <div class="session-top">
                                <span class="session-id">#COU-2024-0044</span>
                                <span class="session-status ongoing"><i class="fas fa-circle" style="font-size:8px"></i> Ongoing</span>
                            </div>
                            <div class="session-student">
                                <div class="session-avatar">PS</div>
                                <div>
                                    <p class="session-student-name">Priya Sharma</p>
                                    <p class="session-student-course">MBA Finance</p>
                                </div>
                            </div>
                            <div class="session-details-row">
                                <div class="session-detail"><i class="far fa-calendar"></i><span>Dec 16, 2024</span></div>
                                <div class="session-detail"><i class="far fa-clock"></i><span>2:00 PM - 3:00 PM</span></div>
                                <div class="session-detail"><i class="fas fa-building"></i><span>Office - Room 205</span></div>
                                <div class="session-detail"><i class="fas fa-tag"></i><span>Career Guidance</span></div>
                            </div>
                            <div class="session-counselor">
                                <div class="counselor-avatar-sm">RG</div>
                                <div>
                                    <p class="counselor-name-sm">Rahul Gupta</p>
                                    <p class="counselor-role-sm">Counselor</p>
                                </div>
                            </div>
                        </div>
                        <div class="session-card-footer">
                           <a class="btn btn-sm btn-primary w-100" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> View Session Details</a>
                        </div>
                    </div>

                    <!-- Session Card 3 -->
                    <div class="session-card">
                        <div class="session-card-stripe completed"></div>
                        <div class="session-card-body">
                            <div class="session-top">
                                <span class="session-id">#COU-2024-0043</span>
                                <span class="session-status completed"><i class="fas fa-circle" style="font-size:8px"></i> Completed</span>
                            </div>
                            <div class="session-student">
                                <div class="session-avatar">AV</div>
                                <div>
                                    <p class="session-student-name">Amit Verma</p>
                                    <p class="session-student-course">BCA</p>
                                </div>
                            </div>
                            <div class="session-details-row">
                                <div class="session-detail"><i class="far fa-calendar"></i><span>Dec 15, 2024</span></div>
                                <div class="session-detail"><i class="far fa-clock"></i><span>11:00 AM - 12:00 PM</span></div>
                                <div class="session-detail"><i class="fas fa-video"></i><span>Online (Meet)</span></div>
                                <div class="session-detail"><i class="fas fa-tag"></i><span>Follow-up</span></div>
                            </div>
                            <div class="session-counselor">
                                <div class="counselor-avatar-sm">MP</div>
                                <div>
                                    <p class="counselor-name-sm">Meera Patil</p>
                                    <p class="counselor-role-sm">Senior Counselor</p>
                                </div>
                            </div>
                        </div>
                        <div class="session-card-footer">
                           <a class="btn btn-sm btn-primary w-100" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> View Session Details</a>
                        </div>
                    </div>
                </div>

                <!-- 2. Table View -->
                <div class="table-view" id="tableView">
                    <div class="sessions-table-card">
                        <div style="overflow-x:auto;">
                            <table class="sessions-table">
                                <thead>
                                    <tr>
                                        <th>Session ID</th>
                                        <th>Student Name</th>
                                        <th>Counselor</th>
                                        <th>Date & Time</th>
                                        <th>Mode</th>
                                        <th>Session Type</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><span style="color:var(--primary);font-weight:600;cursor:pointer" onclick="window.location.href='counseling-details.html'">#COU-2024-0045</span></td>
                                        <td><div class="d-flex align-items-center gap-2"><div class="session-avatar" style="width:32px;height:32px;font-size:12px">RK</div><span>Rajesh Kumar</span></div></td>
                                        <td>Sarah Patel</td>
                                        <td>Dec 18 • 10:00 AM</td>
                                        <td>Online (Zoom)</td>
                                        <td>First Counseling</td>
                                        <td><span class="session-status scheduled"><i class="fas fa-circle" style="font-size:8px"></i> Scheduled</span></td>
                                        <td><a class="btn btn-sm btn-outline-primary" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> Details</a></td>
                                    </tr>
                                    <tr>
                                        <td><span style="color:var(--primary);font-weight:600;cursor:pointer" onclick="window.location.href='counseling-details.html'">#COU-2024-0044</span></td>
                                        <td><div class="d-flex align-items-center gap-2"><div class="session-avatar" style="width:32px;height:32px;font-size:12px">PS</div><span>Priya Sharma</span></div></td>
                                        <td>Rahul Gupta</td>
                                        <td>Dec 16 • 2:00 PM</td>
                                        <td>Office - Room 205</td>
                                        <td>Career Guidance</td>
                                        <td><span class="session-status ongoing"><i class="fas fa-circle" style="font-size:8px"></i> Ongoing</span></td>
                                        <td><a class="btn btn-sm btn-outline-primary" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> Details</a></td>
                                    </tr>
                                    <tr>
                                        <td><span style="color:var(--primary);font-weight:600;cursor:pointer" onclick="window.location.href='counseling-details.html'">#COU-2024-0043</span></td>
                                        <td><div class="d-flex align-items-center gap-2"><div class="session-avatar" style="width:32px;height:32px;font-size:12px">AV</div><span>Amit Verma</span></div></td>
                                        <td>Meera Patil</td>
                                        <td>Dec 15 • 11:00 AM</td>
                                        <td>Online (Meet)</td>
                                        <td>Follow-up</td>
                                        <td><span class="session-status completed"><i class="fas fa-circle" style="font-size:8px"></i> Completed</span></td>
                                        <td><a class="btn btn-sm btn-outline-primary" href="<%= ResolveUrl("~/Admission-Manager/Counseling-Details.aspx") %>"><i class="fas fa-eye me-1"></i> Details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 3. Counselor Performance Section -->
                <div class="performance-section" id="perfView">
                    <div class="performance-header">
                        <div>
                            <h3 class="headline-sm mb-1"><i class="fas fa-award text-warning me-2"></i>Counselor Performance Monitoring</h3>
                            <p class="text-muted mb-0">Real-time breakdown of assigned leads, sessions completed, student ratings & conversion rates</p>
                        </div>
                        <button class="btn btn-sm btn-outline-secondary" onclick="alert('Exporting Performance Report...');"><i class="fas fa-download me-1"></i> Export Report</button>
                    </div>
                    <div style="overflow-x:auto;">
                        <table class="sessions-table">
                            <thead>
                                <tr>
                                    <th>Counselor Name</th>
                                    <th>Designation</th>
                                    <th>Assigned Students</th>
                                    <th>Sessions Conducted</th>
                                    <th>Completion Rate</th>
                                    <th>Avg Rating</th>
                                    <th>Conversion Rate</th>
                                    <th>Performance Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="background:var(--primary)">SP</div><span class="fw-semibold">Sarah Patel</span></div></td>
                                    <td>Senior Counselor</td>
                                    <td>42 Students</td>
                                    <td>38 Sessions</td>
                                    <td><span class="badge bg-success-subtle text-success">90.4%</span></td>
                                    <td><span class="text-warning fw-bold"><i class="fas fa-star me-1"></i>4.9</span> / 5.0</td>
                                    <td><strong class="text-primary">68.2%</strong></td>
                                    <td><span class="badge bg-success text-white">Top Performer</span></td>
                                </tr>
                                <tr>
                                    <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="background:var(--info)">RG</div><span class="fw-semibold">Rahul Gupta</span></div></td>
                                    <td>Admission Counselor</td>
                                    <td>36 Students</td>
                                    <td>30 Sessions</td>
                                    <td><span class="badge bg-success-subtle text-success">83.3%</span></td>
                                    <td><span class="text-warning fw-bold"><i class="fas fa-star me-1"></i>4.7</span> / 5.0</td>
                                    <td><strong class="text-primary">58.5%</strong></td>
                                    <td><span class="badge bg-info text-white">On Track</span></td>
                                </tr>
                                <tr>
                                    <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="background:var(--secondary)">MP</div><span class="fw-semibold">Meera Patil</span></div></td>
                                    <td>Senior Counselor</td>
                                    <td>39 Students</td>
                                    <td>35 Sessions</td>
                                    <td><span class="badge bg-success-subtle text-success">89.7%</span></td>
                                    <td><span class="text-warning fw-bold"><i class="fas fa-star me-1"></i>4.8</span> / 5.0</td>
                                    <td><strong class="text-primary">64.1%</strong></td>
                                    <td><span class="badge bg-success text-white">Top Performer</span></td>
                                </tr>
                                <tr>
                                    <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="background:var(--warning)">VK</div><span class="fw-semibold">Vikram Kumar</span></div></td>
                                    <td>Junior Counselor</td>
                                    <td>28 Students</td>
                                    <td>21 Sessions</td>
                                    <td><span class="badge bg-warning-subtle text-warning">75.0%</span></td>
                                    <td><span class="text-warning fw-bold"><i class="fas fa-star me-1"></i>4.5</span> / 5.0</td>
                                    <td><strong class="text-primary">46.4%</strong></td>
                                    <td><span class="badge bg-warning text-dark">Needs Support</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </main>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Sidebar Toggle
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // View Toggles (Cards / Table / Performance)
        const cardViewBtn = document.getElementById('cardViewBtn');
        const tableViewBtn = document.getElementById('tableViewBtn');
        const perfViewBtn = document.getElementById('perfViewBtn');

        const cardView = document.getElementById('cardView');
        const tableView = document.getElementById('tableView');
        const perfView = document.getElementById('perfView');
        const sessionsTabs = document.getElementById('sessionsTabs');

        cardViewBtn.addEventListener('click', function() {
            [cardViewBtn, tableViewBtn, perfViewBtn].forEach(b => b.classList.remove('active'));
            cardViewBtn.classList.add('active');
            cardView.classList.add('active');
            tableView.classList.remove('active');
            perfView.classList.remove('active');
            sessionsTabs.style.display = 'flex';
        });

        tableViewBtn.addEventListener('click', function() {
            [cardViewBtn, tableViewBtn, perfViewBtn].forEach(b => b.classList.remove('active'));
            tableViewBtn.classList.add('active');
            tableView.classList.add('active');
            cardView.classList.remove('active');
            perfView.classList.remove('active');
            sessionsTabs.style.display = 'flex';
        });

        perfViewBtn.addEventListener('click', function() {
            [cardViewBtn, tableViewBtn, perfViewBtn].forEach(b => b.classList.remove('active'));
            perfViewBtn.classList.add('active');
            perfView.classList.add('active');
            cardView.classList.remove('active');
            tableView.classList.remove('active');
            sessionsTabs.style.display = 'none';
        });

        // Tab Navigation Filtering
        document.querySelectorAll('.tab-btn').forEach(tab => {
            tab.addEventListener('click', function() {
                document.querySelectorAll('.tab-btn').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</asp:Content>
