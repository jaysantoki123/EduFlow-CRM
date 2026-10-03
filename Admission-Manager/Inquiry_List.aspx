<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquiry_List.aspx.cs" Inherits="EduFlow.Admission_Manager.inquiry_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Inquiry Monitoring & Analytics - EduFlow
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
           <style>
        .filter-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .filter-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-md);
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .filter-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;Admission-Manager/Inquiry-Timeline
        }

        .filter-select,
        .filter-input {
            height: 40px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 0 12px;
            font-size: 14px;
            background: white;
            transition: all 0.2s ease;
        }

        .filter-select:focus,
        .filter-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .inquiry-table-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
        }

        .table-header {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .table-actions {
            display: flex;
            gap: var(--spacing-sm);
            align-items: center;
        }

        .search-box {
            position: relative;
            width: 300px;
        }

        .search-box input {
            width: 100%;
            height: 40px;
            padding: 0 16px 0 40px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-full);
            font-size: 14px;
            background: white;
        }

        .search-box i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--on-surface-variant);
        }

        .inquiry-table {
            width: 100%;
            border-collapse: collapse;
        }

        .inquiry-table thead {
            background: var(--surface-container-low);
        }

        .inquiry-table th {
            padding: 16px;
            text-align: left;
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 1px solid var(--border-subtle);
            white-space: nowrap;
        }

        .inquiry-table td {
            padding: 16px;
            border-bottom: 1px solid var(--border-subtle);
            font-size: 14px;
            color: var(--on-surface);
        }

        .inquiry-table tbody tr {
            transition: all 0.2s ease;
        }

        .inquiry-table tbody tr:hover {
            background: var(--surface-container-low);
        }

        .inquiry-id {
            font-weight: 600;
            color: var(--primary);
            cursor: pointer;
        }

        .inquiry-id:hover {
            text-decoration: underline;
        }

        .student-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .student-avatar {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 13px;
            flex-shrink: 0;
        }

        .student-details {
            display: flex;
            flex-direction: column;
        }

        .student-name {
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .student-contact {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 4px 12px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 500;
            gap: 6px;
        }

        .status-badge i { font-size: 8px; }
        .status-badge.new { background: rgba(79, 70, 229, 0.1); color: var(--primary); }
        .status-badge.contacted { background: rgba(0, 81, 213, 0.1); color: var(--info); }
        .status-badge.qualified { background: rgba(34, 197, 94, 0.1); color: var(--success); }
        .status-badge.converted { background: rgba(0, 109, 98, 0.1); color: var(--tertiary); }
        .status-badge.lost { background: rgba(239, 68, 68, 0.1); color: var(--danger); }

        .priority-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 6px;
        }

        .priority-indicator.high { background: var(--danger); }
        .priority-indicator.medium { background: var(--warning); }
        .priority-indicator.low { background: var(--success); }

        .action-btn {
            width: 34px;
            height: 34px;
            border: 1px solid var(--border-subtle);
            background: white;
            color: var(--on-surface-variant);
            cursor: pointer;
            border-radius: var(--radius-md);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
            margin-right: 4px;
        }

        .action-btn:hover {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .action-btn.timeline-btn:hover {
            background: var(--info);
            color: white;
            border-color: var(--info);
        }

        .pagination {
            padding: var(--spacing-lg);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--border-subtle);
        }

        .pagination-info { font-size: 14px; color: var(--on-surface-variant); }
        .pagination-controls { display: flex; gap: 8px; }

        .page-btn {
            width: 36px;
            height: 36px;
            border: 1px solid var(--border-subtle);
            background: white;
            color: var(--on-surface);
            border-radius: var(--radius-md);
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .page-btn:hover { border-color: var(--primary); color: var(--primary); }
        .page-btn.active { background: var(--primary); color: white; border-color: var(--primary); }

        .checkbox-cell { width: 40px; padding: 16px 16px 16px 24px; }
        .custom-checkbox { width: 18px; height: 18px; cursor: pointer; accent-color: var(--primary); }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <main class="main-content" id="mainContent">
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
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h1 class="headline-lg mb-1">Inquiry Monitoring & Analytics</h1>
                        <p class="text-muted mb-0">System Admin Inquiry Oversight — Read-Only Monitoring & Activity Metrics</p>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-3 py-2 rounded-pill fw-semibold" style="font-size:13px">
                            <i class="fas fa-shield-alt me-1"></i> Admin Monitoring Mode (Read-Only)
                        </span>
                        <button class="btn btn-outline-secondary" onclick="alert('Exporting full inquiry log CSV...');">
                            <i class="fas fa-download me-1"></i> Export Data
                        </button>
                    </div>
                </div>

                <!-- Inquiry Statistics Overview (5 Cards) -->
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon primary"><i class="fas fa-inbox"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Total Inquiries</div>
                                <div class="stats-value">284</div>
                                <div class="stats-change positive"><i class="fas fa-arrow-up"></i> <span>+12% this month</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon info"><i class="fas fa-star"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">New Today</div>
                                <div class="stats-value">42</div>
                                <div class="stats-change positive"><i class="fas fa-clock"></i> <span>8 added last 2 hrs</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon warning"><i class="fas fa-hourglass-half"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Counseling Pending</div>
                                <div class="stats-value">58</div>
                                <div class="stats-change negative"><i class="fas fa-user-clock"></i> <span>Requires assignment</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card">
                            <div class="stats-icon success"><i class="fas fa-check-circle"></i></div>
                            <div class="stats-content">
                                <div class="stats-label">Converted Admissions</div>
                                <div class="stats-value">156</div>
                                <div class="stats-change positive"><i class="fas fa-chart-line"></i> <span>55% Conversion Rate</span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Filters Section -->
                <div class="filter-section">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="headline-sm mb-0">Search & Filter Inquiries</h3>
                        <button class="btn btn-sm btn-secondary" id="resetFilters"><i class="fas fa-redo"></i> Reset Filters</button>
                    </div>
                    <div class="filter-row">
                        <div class="filter-group">
                            <label class="filter-label">Status</label>
                            <select class="filter-select" id="filterStatus">
                                <option value="">All Status</option>
                                <option value="new">New</option>
                                <option value="contacted">Contacted</option>
                                <option value="qualified">Qualified</option>
                                <option value="converted">Converted</option>
                                <option value="lost">Lost</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Course Interest</label>
                            <select class="filter-select" id="filterCourse">
                                <option value="">All Courses</option>
                                <option value="btech">B.Tech CSE</option>
                                <option value="mba">MBA Finance</option>
                                <option value="bca">BCA</option>
                                <option value="bsc">B.Sc Data Science</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Source</label>
                            <select class="filter-select" id="filterSource">
                                <option value="">All Sources</option>
                                <option value="website">Website</option>
                                <option value="referral">Referral</option>
                                <option value="social">Social Media</option>
                                <option value="walkin">Walk-in</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Date Range</label>
                            <input type="date" class="filter-input" id="filterDate">
                        </div>
                    </div>
                </div>

                <!-- Inquiry Table Card (Initial Table View) -->
                <div class="inquiry-table-card">
                    <div class="table-header">
                        <div class="table-actions">
                            <button class="btn btn-sm btn-secondary" onclick="alert('Exporting inquiry CSV...');"><i class="fas fa-download"></i> Export</button>
                            <button class="btn btn-sm btn-secondary" onclick="window.print();"><i class="fas fa-print"></i> Print</button>
                        </div>
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" placeholder="Search by name, email, phone..." id="tableSearch">
                        </div>
                    </div>

                    <div style="overflow-x: auto;">
                        <table class="inquiry-table">
                            <thead>
                                <tr>
                                    <th class="checkbox-cell"><input type="checkbox" class="custom-checkbox" id="selectAllHeader"></th>
                                    <th>Inquiry ID</th>
                                    <th>Student Details</th>
                                    <th>Course Interest</th>
                                    <th>Source</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Assigned Counselor</th>
                                    <th>Inquiry Date</th>
                                    <th>Actions (Monitoring)</th>
                                </tr>
                            </thead>
                            <tbody id="inquiryTableBody">
                                <tr>
                                    <td class="checkbox-cell"><input type="checkbox" class="custom-checkbox row-checkbox"></td>
                                    <td><span class="inquiry-id" onclick="window.location.href='inquiry-details.html'">#INQ-2024-001</span></td>
                                    <td>
                                        <div class="student-info">
                                            <div class="student-avatar">RK</div>
                                            <div class="student-details">
                                                <p class="student-name">Rajesh Kumar</p>
                                                <p class="student-contact">+91 98765 43210</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>B.Tech CSE</td>
                                    <td>Website</td>
                                    <td><span class="status-badge new"><i class="fas fa-circle"></i> New</span></td>
                                    <td><span class="priority-indicator high"></span> High</td>
                                    <td>Sarah Patel</td>
                                    <td>Dec 15, 2024</td>
                                    <td>
                                        <a class="action-btn" title="View Details" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                         <a class="action-btn timeline-btn" title="View Timeline" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Timeline.aspx") %>"><i class="fas fa-history"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="checkbox-cell"><input type="checkbox" class="custom-checkbox row-checkbox"></td>
                                    <td><span class="inquiry-id" onclick="window.location.href='inquiry-details.html'">#INQ-2024-002</span></td>
                                    <td>
                                        <div class="student-info">
                                            <div class="student-avatar">PS</div>
                                            <div class="student-details">
                                                <p class="student-name">Priya Sharma</p>
                                                <p class="student-contact">+91 98765 43211</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>MBA Finance</td>
                                    <td>Referral</td>
                                    <td><span class="status-badge contacted"><i class="fas fa-circle"></i> Contacted</span></td>
                                    <td><span class="priority-indicator medium"></span> Medium</td>
                                    <td>Rahul Gupta</td>
                                    <td>Dec 14, 2024</td>
                                    <td>
                                       <a class="action-btn" title="View Details" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                        <a class="action-btn timeline-btn" title="View Timeline" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Timeline.aspx") %>"><i class="fas fa-history"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="checkbox-cell"><input type="checkbox" class="custom-checkbox row-checkbox"></td>
                                    <td><span class="inquiry-id" onclick="window.location.href='inquiry-details.html'">#INQ-2024-003</span></td>
                                    <td>
                                        <div class="student-info">
                                            <div class="student-avatar">AV</div>
                                            <div class="student-details">
                                                <p class="student-name">Amit Verma</p>
                                                <p class="student-contact">+91 98765 43212</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>BCA</td>
                                    <td>Social Media</td>
                                    <td><span class="status-badge qualified"><i class="fas fa-circle"></i> Qualified</span></td>
                                    <td><span class="priority-indicator high"></span> High</td>
                                    <td>Meera Patil</td>
                                    <td>Dec 14, 2024</td>
                                    <td>
                                        <a class="action-btn" title="View Details" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                        <a class="action-btn timeline-btn" title="View Timeline" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Timeline.aspx") %>"><i class="fas fa-history"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="checkbox-cell"><input type="checkbox" class="custom-checkbox row-checkbox"></td>
                                    <td><span class="inquiry-id" onclick="window.location.href='inquiry-details.html'">#INQ-2024-004</span></td>
                                    <td>
                                        <div class="student-info">
                                            <div class="student-avatar">SK</div>
                                            <div class="student-details">
                                                <p class="student-name">Sneha Kapoor</p>
                                                <p class="student-contact">+91 98765 43213</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>B.Sc Data Science</td>
                                    <td>Walk-in</td>
                                    <td><span class="status-badge converted"><i class="fas fa-circle"></i> Converted</span></td>
                                    <td><span class="priority-indicator low"></span> Low</td>
                                    <td>Sarah Patel</td>
                                    <td>Dec 13, 2024</td>
                                    <td>
                                        <a class="action-btn" title="View Details" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                      <a class="action-btn timeline-btn" title="View Timeline" href="<%= ResolveUrl("~/Admission-Manager/Inquiry-Timeline.aspx") %>"><i class="fas fa-history"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="pagination">
                        <div class="pagination-info">Showing <strong>1-4</strong> of <strong>284</strong> inquiries</div>
                        <div class="pagination-controls">
                            <button class="page-btn" disabled><i class="fas fa-chevron-left"></i></button>
                            <button class="page-btn active">1</button>
                            <button class="page-btn">2</button>
                            <button class="page-btn">3</button>
                            <button class="page-btn"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

</asp:Content>
