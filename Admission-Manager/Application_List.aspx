<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application_List.aspx.cs" Inherits="EduFlow.Admission_Manager.Application_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* View Toggles */
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
                box-shadow: 0 2px 8px rgba(79,70,229,0.3);
            }

        /* Pipeline View */
        .pipeline-container {
            display: none;
            gap: var(--spacing-md);
            overflow-x: auto;
            padding-bottom: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

            .pipeline-container.active {
                display: flex;
            }

        .pipeline-stage {
            min-width: 270px;
            flex-shrink: 0;
            background: rgba(255,255,255,0.6);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            display: flex;
            flex-direction: column;
            max-height: calc(100vh - 320px);
        }

        .pipeline-header {
            padding: var(--spacing-md) var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .pipeline-title {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .pipeline-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }

            .pipeline-dot.submitted {
                background: var(--primary);
            }

            .pipeline-dot.review {
                background: var(--warning);
            }

            .pipeline-dot.verified {
                background: var(--info);
            }

            .pipeline-dot.approved {
                background: var(--success);
            }

            .pipeline-dot.rejected {
                background: var(--danger);
            }

            .pipeline-dot.enrolled {
                background: var(--tertiary);
            }

        .pipeline-count {
            background: var(--surface-container);
            padding: 2px 10px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 600;
        }

        .pipeline-body {
            flex: 1;
            overflow-y: auto;
            padding: var(--spacing-sm);
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm);
        }

        /* Application Mini Card */
        .app-mini-card {
            background: white;
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-md);
            cursor: pointer;
            transition: all 0.3s ease;
        }

            .app-mini-card:hover {
                box-shadow: var(--shadow-md);
                transform: translateY(-2px);
            }

        .app-mini-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-sm);
        }

        .app-mini-id {
            font-size: 11px;
            font-weight: 600;
            color: var(--primary);
        }

        .app-mini-date {
            font-size: 11px;
            color: var(--on-surface-variant);
        }

        .app-mini-student {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: var(--spacing-sm);
        }

        .app-mini-avatar {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 12px;
        }

        .app-mini-name {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .app-mini-course {
            font-size: 11px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        /* Table View */
        .table-view {
            display: none;
        }

            .table-view.active {
                display: block;
            }

        .app-table-card {
            background: rgba(255,255,255,0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
        }

        .app-table {
            width: 100%;
            border-collapse: collapse;
        }

            .app-table thead {
                background: var(--surface-container-low);
            }

            .app-table th {
                padding: 14px 16px;
                font-size: 12px;
                font-weight: 600;
                color: var(--on-surface-variant);
                text-transform: uppercase;
                border-bottom: 1px solid var(--border-subtle);
                white-space: nowrap;
            }

            .app-table td {
                padding: 14px 16px;
                border-bottom: 1px solid var(--border-subtle);
                font-size: 14px;
                vertical-align: middle;
            }

        .status-chip {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 12px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 600;
        }

            .status-chip.submitted {
                background: rgba(79,70,229,0.1);
                color: var(--primary);
            }

            .status-chip.review {
                background: rgba(245,158,11,0.1);
                color: var(--warning);
            }

            .status-chip.verified {
                background: rgba(0,81,213,0.1);
                color: var(--info);
            }

            .status-chip.approved {
                background: rgba(34,197,94,0.1);
                color: var(--success);
            }

            .status-chip.rejected {
                background: rgba(239,68,68,0.1);
                color: var(--danger);
            }

            .status-chip.enrolled {
                background: rgba(0,109,98,0.1);
                color: var(--tertiary);
            }

        .progress-bar-table {
            width: 100px;
            height: 6px;
            background: var(--border-subtle);
            border-radius: 3px;
            overflow: hidden;
            display: inline-block;
            vertical-align: middle;
            margin-right: 8px;
        }

        .progress-fill-table {
            height: 100%;
            border-radius: 3px;
        }

        .action-btn-sm {
            width: 32px;
            height: 32px;
            border: 1px solid var(--border-subtle);
            background: white;
            border-radius: var(--radius-md);
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

            .action-btn-sm:hover {
                background: var(--primary);
                color: white;
                border-color: var(--primary);
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
        <header class="topbar">
            <div class="topbar-left">
                <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                <div class="topbar-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search applications...">
                </div>
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
                    <h1 class="headline-lg mb-1">Application Monitoring & Pipeline</h1>
                    <p class="text-muted mb-0">Track all admission applications, document verification statuses, and approval metrics</p>
                </div>
                <div class="d-flex gap-2 align-items-center flex-wrap">
                    <div class="view-toggle">
                        <button type="button" class="view-toggle-btn active" id="pipelineViewBtn"><i class="fas fa-columns"></i>Pipeline</button>
                        <button type="button" class="view-toggle-btn" id="tableViewBtn"><i class="fas fa-list"></i>Table View</button>
                    </div>
                    <button class="btn btn-outline-secondary" onclick="alert('Exporting Admission Applications CSV...');">
                        <i class="fas fa-download me-1"></i>Export Data
                    </button>
                </div>
            </div>

            <!-- Admission Statistics Overview -->
            <div class="row g-3 mb-4">
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon primary"><i class="fas fa-file-import"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Total Applications</div>
                            <div class="stats-value">253</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon warning"><i class="fas fa-hourglass-half"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Under Review</div>
                            <div class="stats-value">18</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon info"><i class="fas fa-file-check"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Doc Verified</div>
                            <div class="stats-value">12</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon success"><i class="fas fa-check-circle"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Approved</div>
                            <div class="stats-value">98</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon danger"><i class="fas fa-times-circle"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Rejected</div>
                            <div class="stats-value">8</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: rgba(0,109,98,0.1); color: var(--tertiary)"><i class="fas fa-user-graduate"></i></div>
                        <div class="stats-content">
                            <div class="stats-label">Enrolled</div>
                            <div class="stats-value">72</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 1. Pipeline View (Status Stages) -->
            <div class="pipeline-container active" id="pipelineView">
                <!-- Stage 1: Submitted -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot submitted"></div>
                            <h3>Submitted</h3>
                        </div>
                        <span class="pipeline-count">8</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0098</span><span class="app-mini-date">Dec 16</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">RK</div>
                                    <div>
                                        <p class="app-mini-name">Rajesh Kumar</p>
                                        <p class="app-mini-course">B.Tech CSE</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-muted small"><i class="fas fa-file me-1"></i>5/8 docs</span><span class="badge bg-primary-subtle text-primary">30%</span></div>
                            </div>
                        </a>
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0097</span><span class="app-mini-date">Dec 15</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">NK</div>
                                    <div>
                                        <p class="app-mini-name">Nikhil Kumar</p>
                                        <p class="app-mini-course">M.Tech AI</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-muted small"><i class="fas fa-file me-1"></i>3/8 docs</span><span class="badge bg-primary-subtle text-primary">20%</span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Stage 2: Under Review -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot review"></div>
                            <h3>Under Review</h3>
                        </div>
                        <span class="pipeline-count">5</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0090</span><span class="app-mini-date">Dec 14</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">PS</div>
                                    <div>
                                        <p class="app-mini-name">Priya Sharma</p>
                                        <p class="app-mini-course">MBA Finance</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-muted small"><i class="fas fa-file me-1"></i>8/8 docs</span><span class="badge bg-warning-subtle text-dark">60%</span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Stage 3: Doc Verified -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot verified"></div>
                            <h3>Doc Verified</h3>
                        </div>
                        <span class="pipeline-count">4</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0082</span><span class="app-mini-date">Dec 12</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">AV</div>
                                    <div>
                                        <p class="app-mini-name">Amit Verma</p>
                                        <p class="app-mini-course">BCA</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-muted small"><i class="fas fa-check-circle text-info me-1"></i>Verified</span><span class="badge bg-info-subtle text-info">80%</span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Stage 4: Approved -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot approved"></div>
                            <h3>Approved</h3>
                        </div>
                        <span class="pipeline-count">6</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0075</span><span class="app-mini-date">Dec 10</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">SK</div>
                                    <div>
                                        <p class="app-mini-name">Sneha Kapoor</p>
                                        <p class="app-mini-course">B.Sc Physics</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-success small fw-semibold"><i class="fas fa-check-circle me-1"></i>Letter Issued</span><span class="badge bg-success-subtle text-success">95%</span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Stage 5: Enrolled -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot enrolled"></div>
                            <h3>Enrolled</h3>
                        </div>
                        <span class="pipeline-count">3</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0060</span><span class="app-mini-date">Dec 8</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">VK</div>
                                    <div>
                                        <p class="app-mini-name">Vikram Kumar</p>
                                        <p class="app-mini-course">B.Tech IT</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-tertiary small fw-semibold"><i class="fas fa-user-graduate me-1"></i>Enrolled</span><span class="badge bg-success">100%</span></div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Stage 6: Rejected -->
                <div class="pipeline-stage">
                    <div class="pipeline-header">
                        <div class="pipeline-title">
                            <div class="pipeline-dot rejected"></div>
                            <h3>Rejected</h3>
                        </div>
                        <span class="pipeline-count">2</span>
                    </div>
                    <div class="pipeline-body">
                        <a href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">
                            <div class="app-mini-card">
                                <div class="app-mini-top"><span class="app-mini-id">#APP-2024-0070</span><span class="app-mini-date">Dec 9</span></div>
                                <div class="app-mini-student">
                                    <div class="app-mini-avatar">SR</div>
                                    <div>
                                        <p class="app-mini-name">Suman Rao</p>
                                        <p class="app-mini-course">MBA HR</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center pt-2 border-top"><span class="text-danger small"><i class="fas fa-times-circle me-1"></i>Ineligible</span><span class="badge bg-danger">Rejected</span></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 2. Table View -->
            <div class="table-view" id="tableView">
                <div class="app-table-card">
                    <div style="overflow-x: auto">
                        <table class="app-table">
                            <thead>
                                <tr>
                                    <th>App ID</th>
                                    <th>Student Name</th>
                                    <th>Applied Course</th>
                                    <th>Applied Date</th>
                                    <th>Documents</th>
                                    <th>Progress</th>
                                    <th>Status</th>
                                    <th>Actions (Monitoring)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a style="color: var(--primary); font-weight: 600; cursor: pointer" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">#APP-2024-0098</a></td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="app-mini-avatar">RK</div>
                                            <span style="font-weight: 600">Rajesh Kumar</span>
                                        </div>
                                    </td>
                                    <td>B.Tech CSE</td>
                                    <td>Dec 16, 2024</td>
                                    <td>5/8 uploaded</td>
                                    <td>
                                        <div class="progress-bar-table">
                                            <div class="progress-fill-table" style="width: 30%; background: var(--primary)"></div>
                                        </div>
                                        30%</td>
                                    <td><span class="status-chip submitted"><i class="fas fa-circle" style="font-size: 8px"></i>Submitted</span></td>
                                    <td>
                                        <a class="action-btn-sm" title="View Application Details" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a style="color: var(--primary); font-weight: 600; cursor: pointer" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">#APP-2024-0098</a></td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="app-mini-avatar">PS</div>
                                            <span style="font-weight: 600">Priya Sharma</span>
                                        </div>
                                    </td>
                                    <td>MBA Finance</td>
                                    <td>Dec 14, 2024</td>
                                    <td>8/8 uploaded</td>
                                    <td>
                                        <div class="progress-bar-table">
                                            <div class="progress-fill-table" style="width: 60%; background: var(--warning)"></div>
                                        </div>
                                        60%</td>
                                    <td><span class="status-chip review"><i class="fas fa-circle" style="font-size: 8px"></i>Under Review</span></td>
                                    <td>
                                        <a class="action-btn-sm" title="View Application Details" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a style="color: var(--primary); font-weight: 600; cursor: pointer" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">#APP-2024-0098</a></td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="app-mini-avatar">AV</div>
                                            <span style="font-weight: 600">Amit Verma</span>
                                        </div>
                                    </td>
                                    <td>BCA</td>
                                    <td>Dec 12, 2024</td>
                                    <td>8/8 verified</td>
                                    <td>
                                        <div class="progress-bar-table">
                                            <div class="progress-fill-table" style="width: 80%; background: var(--info)"></div>
                                        </div>
                                        80%</td>
                                    <td><span class="status-chip verified"><i class="fas fa-circle" style="font-size: 8px"></i>Verified</span></td>
                                    <td>
                                        <a class="action-btn-sm" title="View Application Details" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a style="color: var(--primary); font-weight: 600; cursor: pointer" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>">#APP-2024-0098</a></td>
                                    <td>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="app-mini-avatar">SK</div>
                                            <span style="font-weight: 600">Sneha Kapoor</span>
                                        </div>
                                    </td>
                                    <td>B.Sc Physics</td>
                                    <td>Dec 10, 2024</td>
                                    <td>8/8 verified</td>
                                    <td>
                                        <div class="progress-bar-table">
                                            <div class="progress-fill-table" style="width: 95%; background: var(--success)"></div>
                                        </div>
                                        95%</td>
                                    <td><span class="status-chip approved"><i class="fas fa-circle" style="font-size: 8px"></i>Approved</span></td>
                                    <td>
                                        <a class="action-btn-sm" title="View Application Details" href="<%= ResolveUrl("~/Admission-Manager/Application-Details.aspx") %>"><i class="fas fa-eye"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-footer">
                        <div class="pagination-info">Showing <strong>1-4</strong> of <strong>253</strong> applications</div>
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

        </div>
    </main>

    <script>
        // Sidebar Toggle
        document.getElementById('sidebarToggle').addEventListener('click', function () {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // View Toggles
        document.getElementById('pipelineViewBtn').addEventListener('click', function () {
            this.classList.add('active');
            document.getElementById('tableViewBtn').classList.remove('active');
            document.getElementById('pipelineView').classList.add('active');
            document.getElementById('tableView').classList.remove('active');
        });

        document.getElementById('tableViewBtn').addEventListener('click', function () {
            this.classList.add('active');
            document.getElementById('pipelineViewBtn').classList.remove('active');
            document.getElementById('tableView').classList.add('active');
            document.getElementById('pipelineView').classList.remove('active');
        });
    </script>
</asp:Content>
