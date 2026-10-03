<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquiry-Timeline.aspx.cs" Inherits="EduFlow.Admission_Manager.Inquiry_Timeline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Inquiry Timeline - EduFlow
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .timeline-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            color: white;
        }

        .timeline-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
        }

        .header-avatar {
            width: 56px;
            height: 56px;
            border-radius: var(--radius-full);
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 700;
        }

        .header-info h1 {
            font-size: 24px;
            font-weight: 700;
            margin: 0 0 4px 0;
        }

        .header-info p {
            font-size: 13px;
            margin: 0;
            opacity: 0.9;
        }

        .timeline-filters {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .filter-row {
            display: flex;
            gap: var(--spacing-md);
            align-items: center;
            flex-wrap: wrap;
        }

        .filter-group {
            flex: 1;
            min-width: 200px;
        }

        .filter-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 6px;
            display: block;
        }

        .filter-select {
            width: 100%;
            height: 40px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 0 12px;
            font-size: 14px;
            background: white;
        }

        .filter-select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .timeline-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-md);
            text-align: center;
        }

        .stat-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1) 0%, rgba(0, 81, 213, 0.1) 100%);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            margin: 0 auto var(--spacing-sm);
            font-size: 18px;
        }

        .stat-card.success .stat-icon {
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(34, 197, 94, 0.2) 100%);
            color: var(--success);
        }

        .stat-card.warning .stat-icon {
            background: linear-gradient(135deg, rgba(245, 158, 11, 0.1) 0%, rgba(245, 158, 11, 0.2) 100%);
            color: var(--warning);
        }

        .stat-value {
            font-size: 24px;
            font-weight: 700;
            color: var(--on-surface);
            margin: 0;
        }

        .stat-label {
            font-size: 11px;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-top: 4px;
        }

        .timeline-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
        }

        .timeline-wrapper {
            position: relative;
            padding-left: 48px;
        }

        .timeline-line {
            position: absolute;
            left: 23px;
            top: 0;
            bottom: 0;
            width: 2px;
            background: linear-gradient(180deg, var(--primary) 0%, var(--border-subtle) 100%);
        }

        .timeline-item {
            position: relative;
            padding-bottom: var(--spacing-2xl);
        }

        .timeline-item:last-child {
            padding-bottom: 0;
        }

        .timeline-item:last-child .timeline-line::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: -1px;
            width: 4px;
            height: 20px;
            background: linear-gradient(180deg, var(--border-subtle) 0%, transparent 100%);
        }

        .timeline-dot {
            position: absolute;
            left: -36px;
            top: 0;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            border: 4px solid var(--primary);
            background: white;
            z-index: 2;
            box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.5);
        }

        .timeline-dot.success {
            border-color: var(--success);
        }

        .timeline-dot.warning {
            border-color: var(--warning);
        }

        .timeline-dot.info {
            border-color: var(--info);
        }

        .timeline-dot.danger {
            border-color: var(--danger);
        }

        .timeline-content {
            background: var(--surface-container-low);
            border-radius: var(--radius-xl);
            padding: var(--spacing-lg);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
        }

        .timeline-content:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
            transform: translateX(4px);
        }

        .timeline-content-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-md);
        }

        .timeline-type-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 12px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .timeline-type-badge.call {
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
        }

        .timeline-type-badge.email {
            background: rgba(0, 81, 213, 0.1);
            color: var(--info);
        }

        .timeline-type-badge.meeting {
            background: rgba(34, 197, 94, 0.1);
            color: var(--success);
        }

        .timeline-type-badge.note {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }

        .timeline-type-badge.status {
            background: rgba(0, 109, 98, 0.1);
            color: var(--tertiary);
        }

        .timeline-time {
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        .timeline-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0 0 8px 0;
        }

        .timeline-description {
            font-size: 14px;
            color: var(--on-surface-variant);
            line-height: 1.6;
            margin: 0 0 var(--spacing-md) 0;
        }

        .timeline-meta {
            display: flex;
            flex-wrap: wrap;
            gap: var(--spacing-md);
            padding-top: var(--spacing-md);
            border-top: 1px solid var(--border-subtle);
        }

        .timeline-user {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: var(--on-surface-variant);
        }

        .timeline-user-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 600;
        }

        .timeline-attachment {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            background: white;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            font-size: 13px;
            color: var(--on-surface);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .timeline-attachment:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .timeline-attachment i {
            color: var(--primary);
        }

        .date-separator {
            position: relative;
            text-align: center;
            margin: var(--spacing-xl) 0;
        }

        .date-separator::before {
            content: '';
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            height: 1px;
            background: var(--border-subtle);
        }

        .date-separator-text {
            position: relative;
            display: inline-block;
            padding: 6px 16px;
            background: var(--surface-container-low);
            border-radius: var(--radius-full);
            font-size: 13px;
            font-weight: 600;
            color: var(--on-surface);
            z-index: 1;
        }

        .add-activity-btn {
            position: fixed;
            bottom: 32px;
            right: 32px;
            width: 64px;
            height: 64px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 24px;
            box-shadow: 0 8px 16px rgba(79, 70, 229, 0.3);
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 100;
        }

        .add-activity-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 12px 24px rgba(79, 70, 229, 0.4);
        }

        @media (max-width: 768px) {
            .timeline-wrapper {
                padding-left: 32px;
            }

            .timeline-line {
                left: 15px;
            }

            .timeline-dot {
                left: -24px;
                width: 18px;
                height: 18px;
                border-width: 3px;
            }

            .timeline-content-header {
                flex-direction: column;
                gap: var(--spacing-sm);
            }

            .add-activity-btn {
                bottom: 16px;
                right: 16px;
                width: 56px;
                height: 56px;
                font-size: 20px;
            }
        }
    </style>

    <!-- Authentication and Navigation Control -->
    <script src="../js/auth.js"></script>
    <script src="../js/navigation.js"></script>

    <!-- Responsive Enhancements -->
    <style>
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <main class="main-content" id="mainContent">
            <!-- Topbar -->
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle">
                        <i class="fas fa-bars"></i>
                    </button>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn">
                        <i class="fas fa-bell"></i>
                        <span class="badge"></span>
                    </button>
                    <button class="topbar-icon-btn">
                        <i class="fas fa-user-circle"></i>
                    </button>
                </div>
            </header>

            <!-- Content Area -->
            <div class="content-area">
                <!-- Back Button -->
                <div class="mb-3">
                    <a href="inquiry-details.html" class="btn btn-secondary btn-sm">
                        <i class="fas fa-arrow-left"></i>
                        Back to Details
                    </a>
                </div>

                <!-- Timeline Header -->
                <div class="timeline-header">
                    <div class="timeline-header-content">
                        <div class="header-left">
                            <div class="header-avatar">RK</div>
                            <div class="header-info">
                                <h1>Rajesh Kumar - Activity Timeline</h1>
                                <p><i class="fas fa-hashtag"></i> INQ-2024-001 • Created on Dec 15, 2024</p>
                            </div>
                        </div>
                        <button class="header-btn" onclick="window.print()">
                            <i class="fas fa-download"></i> Export Timeline
                        </button>
                    </div>
                </div>

                <!-- Stats -->
                <div class="timeline-stats">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-history"></i>
                        </div>
                        <p class="stat-value">24</p>
                        <p class="stat-label">Total Activities</p>
                    </div>
                    <div class="stat-card success">
                        <div class="stat-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <p class="stat-value">8</p>
                        <p class="stat-label">Calls Made</p>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <p class="stat-value">6</p>
                        <p class="stat-label">Emails Sent</p>
                    </div>
                    <div class="stat-card warning">
                        <div class="stat-icon">
                            <i class="fas fa-calendar"></i>
                        </div>
                        <p class="stat-value">4</p>
                        <p class="stat-label">Meetings</p>
                    </div>
                </div>

                <!-- Filters -->
                <div class="timeline-filters">
                    <div class="filter-row">
                        <div class="filter-group">
                            <label class="filter-label">Activity Type</label>
                            <select class="filter-select">
                                <option>All Activities</option>
                                <option>Calls</option>
                                <option>Emails</option>
                                <option>Meetings</option>
                                <option>Notes</option>
                                <option>Status Changes</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Date Range</label>
                            <select class="filter-select">
                                <option>All Time</option>
                                <option>Today</option>
                                <option>Last 7 Days</option>
                                <option>Last 30 Days</option>
                                <option>Custom Range</option>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Team Member</label>
                            <select class="filter-select">
                                <option>All Members</option>
                                <option>Sarah Patel</option>
                                <option>Rahul Gupta</option>
                                <option>Admin</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Timeline -->
                <div class="timeline-container">
                    <div class="timeline-wrapper">
                        <div class="timeline-line"></div>

                        <!-- Today -->
                        <div class="date-separator">
                            <span class="date-separator-text">
                                <i class="fas fa-calendar-day"></i> Today - December 16, 2024
                            </span>
                        </div>

                        <!-- Timeline Item 1 -->
                        <div class="timeline-item">
                            <div class="timeline-dot success"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge call">
                                        <i class="fas fa-phone"></i> Phone Call
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> 2 hours ago
                                    </span>
                                </div>
                                <h4 class="timeline-title">Follow-up Call - Discussed Course Details</h4>
                                <p class="timeline-description">
                                    Had a productive 15-minute conversation with the student. Discussed the B.Tech CSE curriculum in detail, including AI and ML specialization options. Student expressed strong interest in the program and asked about scholarship opportunities. Shared information about merit-based scholarships and placement statistics. Student seems highly motivated and ready to proceed with the application.
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">SP</div>
                                        <span>Sarah Patel</span>
                                    </div>
                                    <div style="font-size: 13px; color: var(--on-surface-variant);">
                                        <i class="fas fa-clock"></i> Duration: 15 minutes
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Timeline Item 2 -->
                        <div class="timeline-item">
                            <div class="timeline-dot info"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge email">
                                        <i class="fas fa-envelope"></i> Email Sent
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> 5 hours ago
                                    </span>
                                </div>
                                <h4 class="timeline-title">Course Brochure and Fee Structure Shared</h4>
                                <p class="timeline-description">
                                    Sent detailed course brochure, fee structure, and scholarship information via email. Included information about upcoming open house event and virtual campus tour.
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">SP</div>
                                        <span>Sarah Patel</span>
                                    </div>
                                    <div class="timeline-attachment">
                                        <i class="fas fa-file-pdf"></i>
                                        <span>Course_Brochure_2024.pdf</span>
                                    </div>
                                    <div class="timeline-attachment">
                                        <i class="fas fa-file-pdf"></i>
                                        <span>Fee_Structure.pdf</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Yesterday -->
                        <div class="date-separator">
                            <span class="date-separator-text">
                                <i class="fas fa-calendar-day"></i> Yesterday - December 15, 2024
                            </span>
                        </div>

                        <!-- Timeline Item 3 -->
                        <div class="timeline-item">
                            <div class="timeline-dot status"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge status">
                                        <i class="fas fa-exchange-alt"></i> Status Change
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> Yesterday at 3:45 PM
                                    </span>
                                </div>
                                <h4 class="timeline-title">Inquiry Status Updated</h4>
                                <p class="timeline-description">
                                    Status changed from "New" to "Contacted"
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">SP</div>
                                        <span>Sarah Patel</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Timeline Item 4 -->
                        <div class="timeline-item">
                            <div class="timeline-dot success"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge meeting">
                                        <i class="fas fa-video"></i> Virtual Meeting
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> Yesterday at 2:00 PM
                                    </span>
                                </div>
                                <h4 class="timeline-title">Initial Counseling Session</h4>
                                <p class="timeline-description">
                                    Conducted first counseling session via video call. Discussed student's academic background, career goals, and course preferences. Student has strong interest in computer science and AI. Good academic record with 85% in 12th. Parents were also present and supportive.
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">SP</div>
                                        <span>Sarah Patel</span>
                                    </div>
                                    <div style="font-size: 13px; color: var(--on-surface-variant);">
                                        <i class="fas fa-clock"></i> Duration: 30 minutes
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Timeline Item 5 -->
                        <div class="timeline-item">
                            <div class="timeline-dot"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge note">
                                        <i class="fas fa-sticky-note"></i> Note Added
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> Yesterday at 10:30 AM
                                    </span>
                                </div>
                                <h4 class="timeline-title">Counselor Assigned</h4>
                                <p class="timeline-description">
                                    Sarah Patel has been assigned as the counselor for this inquiry. Student will be contacted within 24 hours.
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">AD</div>
                                        <span>Admin</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Timeline Item 6 -->
                        <div class="timeline-item">
                            <div class="timeline-dot"></div>
                            <div class="timeline-content">
                                <div class="timeline-content-header">
                                    <span class="timeline-type-badge note">
                                        <i class="fas fa-plus-circle"></i> Inquiry Created
                                    </span>
                                    <span class="timeline-time">
                                        <i class="far fa-clock"></i> Yesterday at 10:00 AM
                                    </span>
                                </div>
                                <h4 class="timeline-title">New Inquiry Received</h4>
                                <p class="timeline-description">
                                    Inquiry received from website contact form. Student interested in B.Tech Computer Science. Source: Website. Priority: High.
                                </p>
                                <div class="timeline-meta">
                                    <div class="timeline-user">
                                        <div class="timeline-user-avatar">SY</div>
                                        <span>System</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
