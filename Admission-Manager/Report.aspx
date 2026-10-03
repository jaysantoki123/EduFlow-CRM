<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="EduFlow.Admission_Manager.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reports & Analytics - Education CRM
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
</asp:Content>
