<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="FollowUps.aspx.cs" Inherits="EduFlow.Admin.FollowUps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Follow-ups List - EduFlow CRM
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

        /* Filter Tabs Bar */
        .status-tabs {
            display: flex;
            gap: 8px;
            margin-bottom: var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            padding-bottom: 8px;
            overflow-x: auto;
        }

        .status-tab-btn {
            padding: 8px 16px;
            border: none;
            background: transparent;
            border-radius: var(--radius-md);
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface-variant);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .status-tab-btn.active {
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
        }

        .status-badge-count {
            padding: 2px 8px;
            border-radius: var(--radius-full);
            font-size: 11px;
        }

        /* Kanban Board */
        .kanban-board {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
            min-height: 500px;
        }

        .kanban-board.hidden { display: none; }

        .kanban-column {
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            display: flex;
            flex-direction: column;
        }

        .kanban-header {
            padding: var(--spacing-md) var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .kanban-title { display: flex; align-items: center; gap: 10px; }
        .kanban-dot { width: 10px; height: 10px; border-radius: 50%; }
        .kanban-dot.overdue { background: var(--danger); }
        .kanban-dot.today { background: var(--warning); }
        .kanban-dot.upcoming { background: var(--primary); }
        .kanban-dot.completed { background: var(--success); }

        .kanban-count { background: var(--surface-container); padding: 2px 10px; border-radius: var(--radius-full); font-size: 12px; font-weight: 600; }

        .kanban-body { padding: var(--spacing-md); display: flex; flex-direction: column; gap: var(--spacing-sm); }

        /* Follow-up Card */
        .followup-card {
            background: white;
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-md);
            transition: all 0.2s ease;
        }

        .followup-card.overdue { border-left: 4px solid var(--danger); }
        .followup-card.today { border-left: 4px solid var(--warning); }
        .followup-card.upcoming { border-left: 4px solid var(--primary); }
        .followup-card.completed { border-left: 4px solid var(--success); }

        .followup-card-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
        .followup-type-badge { display: inline-flex; align-items: center; gap: 4px; padding: 3px 10px; border-radius: var(--radius-full); font-size: 11px; font-weight: 600; }
        .followup-type-badge.call { background: rgba(79, 70, 229, 0.1); color: var(--primary); }
        .followup-type-badge.email { background: rgba(0, 81, 213, 0.1); color: var(--info); }
        .followup-type-badge.whatsapp { background: rgba(34, 197, 94, 0.1); color: var(--success); }

        .followup-student-name { font-size: 14px; font-weight: 600; margin: 0; }
        .followup-student-course { font-size: 12px; color: var(--on-surface-variant); margin: 0 0 8px; }
        .followup-note { font-size: 12px; color: var(--on-surface-variant); background: var(--surface-container-low); padding: 8px; border-radius: var(--radius-md); margin-bottom: 8px; }

        /* List & Counselor Activity Views */
        .list-view-container { display: none; }
        .list-view-container.active { display: block; }
        .counselor-activity-container { display: none; }
        .counselor-activity-container.active { display: block; }

        .followup-table-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
        }

        .followup-table { width: 100%; border-collapse: collapse; }
        .followup-table th { padding: 14px 16px; background: var(--surface-container-low); font-size: 12px; font-weight: 600; text-transform: uppercase; color: var(--on-surface-variant); border-bottom: 1px solid var(--border-subtle); }
        .followup-table td { padding: 14px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                    <div class="topbar-search"><i class="fas fa-search"></i><input type="text" placeholder="Search follow-ups..."></div>
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
                        <h1 class="headline-lg mb-1">Follow-up Monitoring & Oversight</h1>
                        <p class="text-muted mb-0">Monitor all pending & completed follow-ups and track counselor activity timelines</p>
                    </div>
                    <div class="d-flex gap-2 align-items-center flex-wrap">
                        <div class="view-toggle">
                            <button type="button" class="view-toggle-btn active" id="kanbanViewBtn"><i class="fas fa-columns"></i> Board</button>
                            <button type="button" class="view-toggle-btn" id="listViewBtn"><i class="fas fa-list"></i> Table List</button>
                            <button type="button" class="view-toggle-btn" id="counselorActivityBtn"><i class="fas fa-user-clock"></i> Counselor Activities</button>
                        </div>
                        <a href="followup-calendar.html" class="btn btn-outline-primary">
                            <i class="far fa-calendar-alt me-1"></i> Follow-up Calendar
                        </a>
                    </div>
                </div>

                <!-- Stats Overview -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary"><i class="fas fa-tasks"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Total Follow-ups</div>
                                <div class="stats-value">52</div>
                                <div class="stats-change positive"><i class="fas fa-arrow-up"></i> Across all counselors</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning"><i class="fas fa-hourglass-half"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Pending / Due Today</div>
                                <div class="stats-value">12</div>
                                <div class="stats-change positive"><i class="fas fa-clock"></i> 5 completed today</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon danger"><i class="fas fa-exclamation-triangle"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Overdue Follow-ups</div>
                                <div class="stats-value">7</div>
                                <div class="stats-change negative"><i class="fas fa-exclamation-circle"></i> Needs immediate action</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success"><i class="fas fa-check-circle"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Completed Follow-ups</div>
                                <div class="stats-value">33</div>
                                <div class="stats-change positive"><i class="fas fa-chart-line"></i> 82.5% Response Rate</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Status Filter Tabs -->
                <div class="status-tabs" id="statusFilterTabs">
                    <button class="status-tab-btn active" data-filter="all">
                        <i class="fas fa-layer-group"></i> All Follow-ups <span class="status-badge-count bg-secondary text-white">52</span>
                    </button>
                    <button class="status-tab-btn" data-filter="pending">
                        <i class="fas fa-clock text-warning"></i> Pending Follow-ups <span class="status-badge-count bg-warning text-dark">12</span>
                    </button>
                    <button class="status-tab-btn" data-filter="overdue">
                        <i class="fas fa-exclamation-triangle text-danger"></i> Overdue <span class="status-badge-count bg-danger text-white">7</span>
                    </button>
                    <button class="status-tab-btn" data-filter="completed">
                        <i class="fas fa-check-circle text-success"></i> Completed Follow-ups <span class="status-badge-count bg-success text-white">33</span>
                    </button>
                </div>

                <!-- 1. Board / Kanban View -->
                <div class="kanban-board" id="kanbanView">
                    <!-- Overdue Column -->
                    <div class="kanban-column" data-col="overdue">
                        <div class="kanban-header">
                            <div class="kanban-title"><div class="kanban-dot overdue"></div><h3>Overdue</h3></div>
                            <span class="kanban-count">7</span>
                        </div>
                        <div class="kanban-body">
                            <div class="followup-card overdue">
                                <div class="followup-card-top"><span class="followup-type-badge call"><i class="fas fa-phone"></i> Call</span><span class="badge bg-danger-subtle text-danger">2d overdue</span></div>
                                <p class="followup-student-name">Nikhil Kumar</p>
                                <p class="followup-student-course">M.Tech AI • Sarah Patel</p>
                                <div class="followup-note">Call student regarding missing marksheets for admission verification.</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-muted small"><i class="far fa-clock me-1"></i>Dec 14</span>
                                    <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye"></i> Details</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Due Today Column -->
                    <div class="kanban-column" data-col="today">
                        <div class="kanban-header">
                            <div class="kanban-title"><div class="kanban-dot today"></div><h3>Due Today</h3></div>
                            <span class="kanban-count">12</span>
                        </div>
                        <div class="kanban-body">
                            <div class="followup-card today">
                                <div class="followup-card-top"><span class="followup-type-badge call"><i class="fas fa-phone"></i> Call</span><span class="badge bg-warning-subtle text-warning">Due 3:00 PM</span></div>
                                <p class="followup-student-name">Rajesh Kumar</p>
                                <p class="followup-student-course">B.Tech CSE • Sarah Patel</p>
                                <div class="followup-note">Discuss application fee payment and final counseling schedule.</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-muted small"><i class="far fa-clock me-1"></i>Today</span>
                                    <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye"></i> Details</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Upcoming Column -->
                    <div class="kanban-column" data-col="upcoming">
                        <div class="kanban-header">
                            <div class="kanban-title"><div class="kanban-dot upcoming"></div><h3>Upcoming</h3></div>
                            <span class="kanban-count">28</span>
                        </div>
                        <div class="kanban-body">
                            <div class="followup-card upcoming">
                                <div class="followup-card-top"><span class="followup-type-badge whatsapp"><i class="fab fa-whatsapp"></i> WhatsApp</span><span class="badge bg-primary-subtle text-primary">Dec 18</span></div>
                                <p class="followup-student-name">Karan Malhotra</p>
                                <p class="followup-student-course">M.Tech AI • Rahul Gupta</p>
                                <div class="followup-note">Send course syllabus PDF and hostel accommodation fee structure.</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-muted small"><i class="far fa-calendar me-1"></i>Dec 18</span>
                                    <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye"></i> Details</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Completed Column -->
                    <div class="kanban-column" data-col="completed">
                        <div class="kanban-header">
                            <div class="kanban-title"><div class="kanban-dot completed"></div><h3>Completed</h3></div>
                            <span class="kanban-count">33</span>
                        </div>
                        <div class="kanban-body">
                            <div class="followup-card completed">
                                <div class="followup-card-top"><span class="followup-type-badge email"><i class="fas fa-envelope"></i> Email</span><span class="badge bg-success-subtle text-success">Completed</span></div>
                                <p class="followup-student-name">Priya Sharma</p>
                                <p class="followup-student-course">MBA Finance • Meera Patil</p>
                                <div class="followup-note">Followed up on application status; student confirmed document upload.</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-success small fw-semibold"><i class="fas fa-check me-1"></i>Today 10:30 AM</span>
                                    <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye"></i> Details</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 2. Table List View -->
                <div class="list-view-container" id="listView">
                    <div class="followup-table-card">
                        <div style="overflow-x:auto;">
                            <table class="followup-table">
                                <thead>
                                    <tr>
                                        <th>Student Name</th>
                                        <th>Contact Type</th>
                                        <th>Course Interest</th>
                                        <th>Due Date & Time</th>
                                        <th>Priority</th>
                                        <th>Assigned Counselor</th>
                                        <th>Status</th>
                                        <th>Logged Notes</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-status="overdue">
                                        <td><div class="fw-semibold">Nikhil Kumar</div><span class="text-muted small">+91 98765 00001</span></td>
                                        <td><span class="followup-type-badge call"><i class="fas fa-phone"></i> Call</span></td>
                                        <td>M.Tech AI</td>
                                        <td><span class="text-danger fw-semibold">Dec 14 (Overdue)</span></td>
                                        <td><span class="badge bg-danger">High</span></td>
                                        <td>Sarah Patel</td>
                                        <td><span class="badge bg-danger-subtle text-danger border border-danger-subtle">Overdue</span></td>
                                        <td>Missing marksheets call reminder</td>
                                        <td><button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye me-1"></i> View</button></td>
                                    </tr>
                                    <tr data-status="pending">
                                        <td><div class="fw-semibold">Rajesh Kumar</div><span class="text-muted small">+91 98765 43210</span></td>
                                        <td><span class="followup-type-badge call"><i class="fas fa-phone"></i> Call</span></td>
                                        <td>B.Tech CSE</td>
                                        <td>Today • 3:00 PM</td>
                                        <td><span class="badge bg-danger">High</span></td>
                                        <td>Sarah Patel</td>
                                        <td><span class="badge bg-warning-subtle text-warning border border-warning-subtle">Due Today</span></td>
                                        <td>Application fee discussion call</td>
                                        <td><button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye me-1"></i> View</button></td>
                                    </tr>
                                    <tr data-status="completed">
                                        <td><div class="fw-semibold">Priya Sharma</div><span class="text-muted small">+91 98765 43211</span></td>
                                        <td><span class="followup-type-badge email"><i class="fas fa-envelope"></i> Email</span></td>
                                        <td>MBA Finance</td>
                                        <td>Today • 10:30 AM</td>
                                        <td><span class="badge bg-info text-white">Medium</span></td>
                                        <td>Meera Patil</td>
                                        <td><span class="badge bg-success-subtle text-success border border-success-subtle">Completed</span></td>
                                        <td>Confirmed document upload via email</td>
                                        <td><button class="btn btn-sm btn-outline-primary" onclick="window.location.href='followup-details.html'"><i class="fas fa-eye me-1"></i> View</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 3. Monitor Counselor Activities View -->
                <div class="counselor-activity-container" id="counselorActivityView">
                    <div class="followup-table-card">
                        <div class="p-3 border-bottom d-flex justify-content-between align-items-center">
                            <div>
                                <h3 class="headline-sm mb-1"><i class="fas fa-user-clock text-primary me-2"></i>Counselor Activity Tracker</h3>
                                <p class="text-muted mb-0">Track counselor follow-up workload, completion SLA, and activity logs</p>
                            </div>
                            <button class="btn btn-sm btn-outline-secondary" onclick="alert('Exporting activity logs...');"><i class="fas fa-download me-1"></i> Export Logs</button>
                        </div>
                        <div style="overflow-x:auto;">
                            <table class="followup-table">
                                <thead>
                                    <tr>
                                        <th>Counselor</th>
                                        <th>Role</th>
                                        <th>Pending Follow-ups</th>
                                        <th>Completed Today</th>
                                        <th>Overdue Count</th>
                                        <th>SLA On-Time Rate</th>
                                        <th>Activity Status</th>
                                        <th>Last Active</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="width:32px;height:32px;border-radius:50%;background:var(--primary);color:white;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:11px">SP</div><span class="fw-semibold">Sarah Patel</span></div></td>
                                        <td>Senior Counselor</td>
                                        <td><span class="badge bg-warning-subtle text-dark fw-bold">5 Pending</span></td>
                                        <td><strong class="text-success">4 Done</strong></td>
                                        <td><span class="badge bg-danger">2 Overdue</span></td>
                                        <td><strong class="text-primary">88.5%</strong></td>
                                        <td><span class="badge bg-success">Optimal</span></td>
                                        <td>10 mins ago</td>
                                    </tr>
                                    <tr>
                                        <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="width:32px;height:32px;border-radius:50%;background:var(--info);color:white;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:11px">RG</div><span class="fw-semibold">Rahul Gupta</span></div></td>
                                        <td>Admission Counselor</td>
                                        <td><span class="badge bg-warning-subtle text-dark fw-bold">4 Pending</span></td>
                                        <td><strong class="text-success">3 Done</strong></td>
                                        <td><span class="badge bg-danger">1 Overdue</span></td>
                                        <td><strong class="text-primary">91.2%</strong></td>
                                        <td><span class="badge bg-success">Optimal</span></td>
                                        <td>25 mins ago</td>
                                    </tr>
                                    <tr>
                                        <td><div class="d-flex align-items-center gap-2"><div class="counselor-avatar-sm" style="width:32px;height:32px;border-radius:50%;background:var(--secondary);color:white;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:11px">MP</div><span class="fw-semibold">Meera Patil</span></div></td>
                                        <td>Senior Counselor</td>
                                        <td><span class="badge bg-warning-subtle text-dark fw-bold">3 Pending</span></td>
                                        <td><strong class="text-success">5 Done</strong></td>
                                        <td><span class="badge bg-success">0 Overdue</span></td>
                                        <td><strong class="text-primary">96.0%</strong></td>
                                        <td><span class="badge bg-success">Top Performer</span></td>
                                        <td>5 mins ago</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </main>


    <script>
        // Sidebar Toggle
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // View Toggles (Board / Table List / Counselor Activities)
        const kanbanViewBtn = document.getElementById('kanbanViewBtn');
        const listViewBtn = document.getElementById('listViewBtn');
        const counselorActivityBtn = document.getElementById('counselorActivityBtn');

        const kanbanView = document.getElementById('kanbanView');
        const listView = document.getElementById('listView');
        const counselorActivityView = document.getElementById('counselorActivityView');
        const statusFilterTabs = document.getElementById('statusFilterTabs');

        kanbanViewBtn.addEventListener('click', function() {
            [kanbanViewBtn, listViewBtn, counselorActivityBtn].forEach(b => b.classList.remove('active'));
            kanbanViewBtn.classList.add('active');
            kanbanView.classList.remove('hidden');
            listView.classList.remove('active');
            counselorActivityView.classList.remove('active');
            statusFilterTabs.style.display = 'flex';
        });

        listViewBtn.addEventListener('click', function() {
            [kanbanViewBtn, listViewBtn, counselorActivityBtn].forEach(b => b.classList.remove('active'));
            listViewBtn.classList.add('active');
            listView.classList.add('active');
            kanbanView.classList.add('hidden');
            counselorActivityView.classList.remove('active');
            statusFilterTabs.style.display = 'flex';
        });

        counselorActivityBtn.addEventListener('click', function() {
            [kanbanViewBtn, listViewBtn, counselorActivityBtn].forEach(b => b.classList.remove('active'));
            counselorActivityBtn.classList.add('active');
            counselorActivityView.classList.add('active');
            kanbanView.classList.add('hidden');
            listView.classList.remove('active');
            statusFilterTabs.style.display = 'none';
        });

        // Status Filter Tabs handling
        document.querySelectorAll('.status-tab-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.status-tab-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                const filter = this.getAttribute('data-filter');

                // Filter table rows
                document.querySelectorAll('#listView table tbody tr').forEach(row => {
                    const status = row.getAttribute('data-status');
                    if (filter === 'all' || status === filter) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>
</asp:Content>
