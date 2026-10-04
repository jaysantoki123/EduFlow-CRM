<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="EduFlow.Admin.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
      <style>
        .reports-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .reports-nav-tabs {
            display: flex;
            gap: 6px;
            overflow-x: auto;
            border-bottom: 2px solid var(--border-subtle);
            padding-bottom: 8px;
            margin-bottom: var(--spacing-lg);
        }

        .report-tab-btn {
            background: transparent;
            border: none;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 600;
            color: var(--on-surface-variant);
            border-radius: var(--radius-lg);
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .report-tab-btn:hover {
            background: var(--surface-container);
            color: var(--primary);
        }

        .report-tab-btn.active {
            background: var(--primary);
            color: white;
            box-shadow: 0 2px 8px rgba(79, 70, 229, 0.3);
        }

        /* Banner Header */
        .report-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .report-header h1 {
            font-size: 22px;
            font-weight: 700;
            margin: 0 0 4px;
        }

        .report-header p {
            font-size: 13px;
            opacity: .9;
            margin: 0;
        }

        .header-controls {
            display: flex;
            gap: var(--spacing-sm);
            flex-wrap: wrap;
        }

        .export-btn-pdf {
            background: rgba(239, 68, 68, 0.9);
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .export-btn-pdf:hover { background: #dc2626; transform: translateY(-1px); }

        .export-btn-excel {
            background: rgba(34, 197, 94, 0.9);
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .export-btn-excel:hover { background: #16a34a; transform: translateY(-1px); }

        .filter-bar {
            background: rgba(255, 255, 255, .8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .filter-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: var(--spacing-md);
        }

        .filter-group { display: flex; flex-direction: column; gap: 6px; }
        .filter-label { font-size: 11px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; }
        .filter-select, .filter-input { height: 40px; border: 1px solid var(--border-subtle); border-radius: var(--radius-md); padding: 0 12px; font-size: 13px; background: white; }

        .kpi-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .kpi-mini {
            background: rgba(255, 255, 255, .8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            text-align: center;
        }

        .kpi-mini-icon { width: 40px; height: 40px; border-radius: var(--radius-full); display: flex; align-items: center; justify-content: center; font-size: 18px; margin: 0 auto var(--spacing-sm); }
        .kpi-mini-value { font-size: 26px; font-weight: 700; margin: 0; }
        .kpi-mini-label { font-size: 11px; color: var(--on-surface-variant); text-transform: uppercase; letter-spacing: .05em; margin-top: 4px; }

        .report-table-card {
            background: rgba(255, 255, 255, .8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
            margin-bottom: var(--spacing-lg);
        }

        .report-table { width: 100%; border-collapse: collapse; }
        .report-table thead { background: var(--surface-container-low); }
        .report-table th { padding: 14px 16px; font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; border-bottom: 1px solid var(--border-subtle); white-space: nowrap; }
        .report-table td { padding: 14px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; vertical-align: middle; }
    </style>        
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                    <div class="topbar-search"><i class="fas fa-search"></i><input type="text" placeholder="Search analytics & reports..."></div>
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
                        <h1 class="headline-lg mb-1">Reports & Analytics Center</h1>
                        <p class="text-muted mb-0">Institutional analytics, conversion metrics, and downloadable executive reports</p>
                    </div>
                </div>

                <!-- 8 Interactive Report Navigation Tabs -->
                <div class="reports-nav-tabs" id="reportTabs">
                    <button class="report-tab-btn active" data-report="inquiry"><i class="fas fa-clipboard-list"></i> Inquiry Report</button>
                    <button class="report-tab-btn" data-report="counseling"><i class="fas fa-user-tie"></i> Counseling Report</button>
                    <button class="report-tab-btn" data-report="followup"><i class="fas fa-phone-alt"></i> Follow-up Report</button>
                    <button class="report-tab-btn" data-report="application"><i class="fas fa-file-alt"></i> Application Report</button>
                    <button class="report-tab-btn" data-report="admission"><i class="fas fa-user-check"></i> Admission Report</button>
                    <button class="report-tab-btn" data-report="student"><i class="fas fa-user-graduate"></i> Student Report</button>
                    <button class="report-tab-btn" data-report="course"><i class="fas fa-book"></i> Course Report</button>
                    <button class="report-tab-btn" data-report="counselor-performance"><i class="fas fa-award"></i> Counselor Performance</button>
                </div>

                <!-- Active Report Content Body -->
                <div class="reports-container">
                    <!-- Dynamic Report Banner -->
                    <div class="report-header">
                        <div>
                            <h1 id="reportBannerTitle"><i class="fas fa-clipboard-list me-2"></i>Inquiry Analytics Report</h1>
                            <p id="reportBannerSub">Detailed breakdown of lead generation channels, conversion rates, and inquiry statuses</p>
                        </div>
                        <div class="header-controls">
                            <button class="export-btn-pdf" onclick="exportPDF()"><i class="fas fa-file-pdf"></i> Export PDF</button>
                            <button class="export-btn-excel" onclick="exportExcel()"><i class="fas fa-file-excel"></i> Export Excel</button>
                        </div>
                    </div>

                    <!-- Filter Bar -->
                    <div class="filter-bar">
                        <div class="filter-row">
                            <div class="filter-group">
                                <label class="filter-label">Date Range</label>
                                <select class="filter-select"><option>This Month</option><option>Last 30 Days</option><option>Last Quarter</option><option>Academic Year 2024</option></select>
                            </div>
                            <div class="filter-group">
                                <label class="filter-label">Department / Course</label>
                                <select class="filter-select"><option>All Departments</option><option>B.Tech CSE</option><option>MBA Finance</option><option>BCA</option></select>
                            </div>
                            <div class="filter-group">
                                <label class="filter-label">Assigned Staff / Counselor</label>
                                <select class="filter-select"><option>All Counselors</option><option>Sarah Patel</option><option>Rahul Gupta</option><option>Meera Patil</option></select>
                            </div>
                            <div class="filter-group">
                                <label class="filter-label">Status Filter</label>
                                <select class="filter-select"><option>All Statuses</option><option>Active / Converted</option><option>Pending</option><option>Lost / Closed</option></select>
                            </div>
                        </div>
                    </div>

                    <!-- KPI Metric Cards Container -->
                    <div class="kpi-row" id="kpiContainer">
                        <div class="kpi-mini">
                            <div class="kpi-mini-icon" style="background:rgba(79,70,229,.1);color:var(--primary)"><i class="fas fa-inbox"></i></div>
                            <p class="kpi-mini-value" style="color:var(--primary)">1,284</p>
                            <p class="kpi-mini-label">Total Inquiries</p>
                        </div>
                        <div class="kpi-mini">
                            <div class="kpi-mini-icon" style="background:rgba(0,81,213,.1);color:var(--info)"><i class="fas fa-star"></i></div>
                            <p class="kpi-mini-value" style="color:var(--info)">342</p>
                            <p class="kpi-mini-label">New This Month</p>
                        </div>
                        <div class="kpi-mini">
                            <div class="kpi-mini-icon" style="background:rgba(34,197,94,.1);color:var(--success)"><i class="fas fa-check-circle"></i></div>
                            <p class="kpi-mini-value" style="color:var(--success)">856</p>
                            <p class="kpi-mini-label">Converted Leads</p>
                        </div>
                        <div class="kpi-mini">
                            <div class="kpi-mini-icon" style="background:rgba(0,109,98,.1);color:var(--tertiary)"><i class="fas fa-percentage"></i></div>
                            <p class="kpi-mini-value" style="color:var(--tertiary)">66.7%</p>
                            <p class="kpi-mini-label">Conversion Rate</p>
                        </div>
                    </div>

                    <!-- Report Table Breakdown -->
                    <div class="report-table-card">
                        <div class="p-3 border-bottom d-flex justify-content-between align-items-center">
                            <h3 class="headline-sm mb-0" id="tableTitle">Report Data Matrix</h3>
                            <span class="text-muted small">Generated on Dec 16, 2024</span>
                        </div>
                        <div style="overflow-x:auto">
                            <table class="report-table" id="reportTable">
                                <thead id="reportTableHead">
                                    <tr>
                                        <th>Program / Category</th>
                                        <th>Total Count</th>
                                        <th>In Progress</th>
                                        <th>Completed / Converted</th>
                                        <th>Success Rate %</th>
                                    </tr>
                                </thead>
                                <tbody id="reportTableBody">
                                    <tr><td class="fw-semibold">B.Tech Computer Science</td><td>320</td><td>45</td><td>225</td><td><span class="badge bg-success-subtle text-success">70.3%</span></td></tr>
                                    <tr><td class="fw-semibold">MBA Finance</td><td>245</td><td>38</td><td>172</td><td><span class="badge bg-success-subtle text-success">70.2%</span></td></tr>
                                    <tr><td class="fw-semibold">BCA</td><td>198</td><td>32</td><td>128</td><td><span class="badge bg-warning-subtle text-warning">64.6%</span></td></tr>
                                    <tr><td class="fw-semibold">M.Tech Artificial Intelligence</td><td>125</td><td>22</td><td>82</td><td><span class="badge bg-success-subtle text-success">65.6%</span></td></tr>
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

        // Report Data Dictionary
        const reportsData = {
            'inquiry': {
                title: '<i class="fas fa-clipboard-list me-2"></i>Inquiry Analytics Report',
                sub: 'Detailed breakdown of lead generation channels, conversion rates, and inquiry statuses',
                kpis: [
                    { label: 'Total Inquiries', val: '1,284', icon: 'fas fa-inbox', color: 'var(--primary)' },
                    { label: 'New This Month', val: '342', icon: 'fas fa-star', color: 'var(--info)' },
                    { label: 'Converted Leads', val: '856', icon: 'fas fa-check-circle', color: 'var(--success)' },
                    { label: 'Conversion Rate', val: '66.7%', icon: 'fas fa-percentage', color: 'var(--tertiary)' }
                ],
                tableHead: '<tr><th>Channel / Program</th><th>Inquiries Received</th><th>Contacted</th><th>Converted</th><th>Conversion Rate</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Website Direct Inquiries</td><td>480</td><td>420</td><td>320</td><td><span class="badge bg-success">66.6%</span></td></tr>
                    <tr><td class="fw-semibold">Social Media Campaigns</td><td>350</td><td>290</td><td>210</td><td><span class="badge bg-success">60.0%</span></td></tr>
                    <tr><td class="fw-semibold">Campus Walk-ins</td><td>280</td><td>280</td><td>230</td><td><span class="badge bg-success">82.1%</span></td></tr>
                    <tr><td class="fw-semibold">Referrals & Alumni</td><td>174</td><td>170</td><td>152</td><td><span class="badge bg-success">87.3%</span></td></tr>
                `
            },
            'counseling': {
                title: '<i class="fas fa-user-tie me-2"></i>Counseling Performance Report',
                sub: 'Analysis of scheduled sessions, completion rates, counselor feedback, and conversion',
                kpis: [
                    { label: 'Sessions Conducted', val: '412', icon: 'fas fa-calendar-check', color: 'var(--primary)' },
                    { label: 'Completed Rate', val: '88.2%', icon: 'fas fa-check-double', color: 'var(--success)' },
                    { label: 'Avg Rating', val: '4.8 / 5', icon: 'fas fa-star', color: 'var(--warning)' },
                    { label: 'Lead Conversion', val: '64.1%', icon: 'fas fa-chart-line', color: 'var(--info)' }
                ],
                tableHead: '<tr><th>Counselor Name</th><th>Sessions Conducted</th><th>Completion Rate</th><th>Avg Rating</th><th>Conversions</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Sarah Patel</td><td>142</td><td>92.4%</td><td>★ 4.9</td><td>88 Admissions</td></tr>
                    <tr><td class="fw-semibold">Rahul Gupta</td><td>130</td><td>86.1%</td><td>★ 4.7</td><td>74 Admissions</td></tr>
                    <tr><td class="fw-semibold">Meera Patil</td><td>140</td><td>89.3%</td><td>★ 4.8</td><td>82 Admissions</td></tr>
                `
            },
            'followup': {
                title: '<i class="fas fa-phone-alt me-2"></i>Follow-up Efficiency Report',
                sub: 'Metrics on follow-up tasks, turnaround response times, SLA adherence, and overdue resolution',
                kpis: [
                    { label: 'Follow-ups Logged', val: '890', icon: 'fas fa-tasks', color: 'var(--primary)' },
                    { label: 'Completed Today', val: '45', icon: 'fas fa-check-circle', color: 'var(--success)' },
                    { label: 'Overdue Count', val: '7', icon: 'fas fa-exclamation-triangle', color: 'var(--danger)' },
                    { label: 'SLA Adherence', val: '94.2%', icon: 'fas fa-clock', color: 'var(--info)' }
                ],
                tableHead: '<tr><th>Follow-up Channel</th><th>Total Logged</th><th>Completed On-Time</th><th>Overdue</th><th>Response Rate</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Phone Calls</td><td>450</td><td>425</td><td>5</td><td><span class="badge bg-success">94.4%</span></td></tr>
                    <tr><td class="fw-semibold">WhatsApp Messages</td><td>310</td><td>300</td><td>2</td><td><span class="badge bg-success">96.7%</span></td></tr>
                    <tr><td class="fw-semibold">Email Outreach</td><td>130</td><td>120</td><td>0</td><td><span class="badge bg-success">92.3%</span></td></tr>
                `
            },
            'application': {
                title: '<i class="fas fa-file-alt me-2"></i>Application Pipeline Report',
                sub: 'Comprehensive audit of application submissions, document verifications, approvals, and fees',
                kpis: [
                    { label: 'Total Applications', val: '253', icon: 'fas fa-file-import', color: 'var(--primary)' },
                    { label: 'Under Review', val: '18', icon: 'fas fa-search', color: 'var(--warning)' },
                    { label: 'Approved', val: '98', icon: 'fas fa-check-circle', color: 'var(--success)' },
                    { label: 'Enrolled Students', val: '72', icon: 'fas fa-user-graduate', color: 'var(--tertiary)' }
                ],
                tableHead: '<tr><th>Course Program</th><th>Submitted</th><th>Doc Verified</th><th>Approved</th><th>Enrolled</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">B.Tech Computer Science</td><td>98</td><td>85</td><td>42</td><td>34</td></tr>
                    <tr><td class="fw-semibold">MBA Finance</td><td>65</td><td>58</td><td>30</td><td>22</td></tr>
                    <tr><td class="fw-semibold">BCA</td><td>50</td><td>44</td><td>16</td><td>12</td></tr>
                `
            },
            'admission': {
                title: '<i class="fas fa-user-check me-2"></i>Admission Yield & Conversion Report',
                sub: 'Analysis of offer letters issued, confirmed enrollments, fee collections, and student intake',
                kpis: [
                    { label: 'Total Admissions', val: '170', icon: 'fas fa-award', color: 'var(--primary)' },
                    { label: 'Offer Letters Issued', val: '198', icon: 'fas fa-envelope-open-text', color: 'var(--info)' },
                    { label: 'Fees Deposited', val: '₹1.85 Cr', icon: 'fas fa-rupee-sign', color: 'var(--success)' },
                    { label: 'Admission Yield', val: '85.8%', icon: 'fas fa-chart-pie', color: 'var(--tertiary)' }
                ],
                tableHead: '<tr><th>Department</th><th>Applications</th><th>Admissions Offered</th><th>Confirmed Enrolled</th><th>Total Revenue (₹)</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Engineering Department</td><td>120</td><td>98</td><td>85</td><td>₹3.23 Cr</td></tr>
                    <tr><td class="fw-semibold">Management Department</td><td>80</td><td>60</td><td>52</td><td>₹2.60 Cr</td></tr>
                    <tr><td class="fw-semibold">Computer Applications</td><td>70</td><td>50</td><td>33</td><td>₹69.3 Lacs</td></tr>
                `
            },
            'student': {
                title: '<i class="fas fa-user-graduate me-2"></i>Student Demographics & Directory Report',
                sub: 'Enrolled student breakdown by course, gender, batch year, and state demographics',
                kpis: [
                    { label: 'Active Students', val: '412', icon: 'fas fa-users', color: 'var(--primary)' },
                    { label: 'New Batch 2024', val: '128', icon: 'fas fa-user-plus', color: 'var(--info)' },
                    { label: 'Alumni Network', val: '44', icon: 'fas fa-graduation-cap', color: 'var(--warning)' },
                    { label: 'Retention Rate', val: '97.2%', icon: 'fas fa-shield-alt', color: 'var(--success)' }
                ],
                tableHead: '<tr><th>Batch Year</th><th>Enrolled Students</th><th>Active</th><th>Alumni</th><th>Attendance Rate</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Batch 2024 - 2028</td><td>128</td><td>128</td><td>0</td><td>91.4%</td></tr>
                    <tr><td class="fw-semibold">Batch 2023 - 2027</td><td>142</td><td>142</td><td>0</td><td>89.6%</td></tr>
                    <tr><td class="fw-semibold">Batch 2022 - 2026</td><td>142</td><td>142</td><td>0</td><td>92.1%</td></tr>
                    <tr><td class="fw-semibold">Batch 2020 - 2024</td><td>44</td><td>0</td><td>44</td><td>100.0%</td></tr>
                `
            },
            'course': {
                title: '<i class="fas fa-book me-2"></i>Course Performance & Seat Capacity Report',
                sub: 'Analysis of course seat utilization, faculty allocations, tuition revenue, and course popularity',
                kpis: [
                    { label: 'Total Programs', val: '12', icon: 'fas fa-book-open', color: 'var(--primary)' },
                    { label: 'Active Courses', val: '10', icon: 'fas fa-check-circle', color: 'var(--success)' },
                    { label: 'Seat Occupancy', val: '86.4%', icon: 'fas fa-chair', color: 'var(--warning)' },
                    { label: 'Total Intake Capacity', val: '520 Seats', icon: 'fas fa-layer-group', color: 'var(--info)' }
                ],
                tableHead: '<tr><th>Course Code</th><th>Program Name</th><th>Total Capacity</th><th>Seats Occupied</th><th>Occupancy %</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold text-primary">CSE-BTECH-001</td><td>B.Tech Computer Science</td><td>120</td><td>98</td><td><span class="badge bg-success">81.6%</span></td></tr>
                    <tr><td class="fw-semibold text-primary">MBA-FIN-001</td><td>MBA Finance</td><td>60</td><td>52</td><td><span class="badge bg-success">86.6%</span></td></tr>
                    <tr><td class="fw-semibold text-primary">BCA-001</td><td>BCA</td><td>90</td><td>75</td><td><span class="badge bg-success">83.3%</span></td></tr>
                `
            },
            'counselor-performance': {
                title: '<i class="fas fa-award me-2"></i>Counselor Performance & Productivity Report',
                sub: 'Comprehensive audit of individual counselor metrics, lead resolution SLAs, and conversion output',
                kpis: [
                    { label: 'Active Counselors', val: '8', icon: 'fas fa-user-tie', color: 'var(--primary)' },
                    { label: 'Leads Handled', val: '1,284', icon: 'fas fa-clipboard-list', color: 'var(--info)' },
                    { label: 'Top Performer', val: 'Sarah Patel', icon: 'fas fa-crown', color: 'var(--warning)' },
                    { label: 'Avg Conversion', val: '64.1%', icon: 'fas fa-chart-bar', color: 'var(--success)' }
                ],
                tableHead: '<tr><th>Counselor Name</th><th>Leads Assigned</th><th>Sessions Held</th><th>Students Enrolled</th><th>Satisfaction Score</th></tr>',
                tableBody: `
                    <tr><td class="fw-semibold">Sarah Patel</td><td>420</td><td>142</td><td>88</td><td>★ 4.9 / 5.0</td></tr>
                    <tr><td class="fw-semibold">Rahul Gupta</td><td>380</td><td>130</td><td>74</td><td>★ 4.7 / 5.0</td></tr>
                    <tr><td class="fw-semibold">Meera Patil</td><td>410</td><td>140</td><td>82</td><td>★ 4.8 / 5.0</td></tr>
                `
            }
        };

        // Report Switching Logic
        document.querySelectorAll('.report-tab-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.report-tab-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');

                const reportKey = this.getAttribute('data-report');
                const data = reportsData[reportKey];
                if (!data) return;

                // Update Banner Title & Subtitle
                document.getElementById('reportBannerTitle').innerHTML = data.title;
                document.getElementById('reportBannerSub').innerText = data.sub;

                // Update KPI Cards
                const kpiContainer = document.getElementById('kpiContainer');
                kpiContainer.innerHTML = data.kpis.map(kpi => `
                    <div class="kpi-mini">
                        <div class="kpi-mini-icon" style="background:rgba(79,70,229,.1);color:${kpi.color}"><i class="${kpi.icon}"></i></div>
                        <p class="kpi-mini-value" style="color:${kpi.color}">${kpi.val}</p>
                        <p class="kpi-mini-label">${kpi.label}</p>
                    </div>
                `).join('');

                // Update Table
                document.getElementById('reportTableHead').innerHTML = data.tableHead;
                document.getElementById('reportTableBody').innerHTML = data.tableBody;
            });
        });

        // Export PDF Function
        function exportPDF() {
            alert('Generating PDF Document...\nOpening print/PDF export preview window.');
            window.print();
        }

        // Export Excel Function
        function exportExcel() {
            alert('Generating Excel Spreadsheet (.xlsx)...\nReport dataset downloaded successfully.');
        }
    </script>
</asp:Content>
