<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Followup-Details.aspx.cs" Inherits="EduFlow.Admission_Manager.Followup_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Followup Details - EduFlow
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .detail-header {
            border-radius: var(--radius-xl);
            overflow: hidden;
            margin-bottom: var(--spacing-lg);
        }

        .detail-header-gradient {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            padding: var(--spacing-xl);
            color: white;
        }

        .detail-header-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-lg);
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .header-left-badges {
            display: flex;
            gap: var(--spacing-sm);
            flex-wrap: wrap;
        }

        .header-badge {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 6px 16px;
            border-radius: var(--radius-full);
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .header-badge.overdue {
            background: rgba(239, 68, 68, 0.3);
        }

        .header-badge.high {
            background: rgba(239, 68, 68, 0.3);
        }

        .header-actions {
            display: flex;
            gap: var(--spacing-sm);
        }

        .header-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .header-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .detail-header-body {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--spacing-xl);
        }

        .header-student {
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
        }

        .header-avatar {
            width: 64px;
            height: 64px;
            border-radius: var(--radius-full);
            background: rgba(255, 255, 255, 0.2);
            border: 3px solid rgba(255, 255, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .header-student-name {
            font-size: 24px;
            font-weight: 700;
            margin: 0 0 4px 0;
        }

        .header-student-info {
            font-size: 13px;
            opacity: 0.9;
            margin: 0;
        }

        .header-schedule {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .header-schedule-label {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            opacity: 0.7;
            margin-bottom: var(--spacing-sm);
        }

        .header-schedule-date {
            font-size: 20px;
            font-weight: 700;
            margin: 0 0 4px 0;
        }

        .header-schedule-time {
            font-size: 14px;
            opacity: 0.9;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Status Strip */
        .status-strip {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border: 1px solid var(--border-subtle);
            border-top: none;
            border-radius: 0 0 var(--radius-xl) var(--radius-xl);
        }

        .status-strip-item {
            padding: var(--spacing-md) var(--spacing-lg);
            text-align: center;
            border-right: 1px solid var(--border-subtle);
        }

        .status-strip-item:last-child {
            border-right: none;
        }

        .strip-label {
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--on-surface-variant);
            margin: 0 0 4px 0;
        }

        .strip-value {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .strip-value.overdue {
            color: var(--danger);
        }

        /* Detail Section */
        .detail-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle);
        }

        .section-title-icon {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .section-icon-circle {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1) 0%, rgba(0, 81, 213, 0.1) 100%);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px;
        }

        .section-title-text h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0;
        }

        .section-title-text p {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        /* Info Grid */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: var(--spacing-lg);
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .info-value {
            font-size: 15px;
            font-weight: 500;
            color: var(--on-surface);
        }

        .info-value.highlighted {
            color: var(--primary);
            font-weight: 600;
        }

        /* Outcome Form */
        .outcome-form {
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.05) 0%, rgba(0, 81, 213, 0.05) 100%);
            border: 1px solid rgba(79, 70, 229, 0.15);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
        }

        .outcome-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--primary);
        }

        .outcome-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .outcome-option {
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
        }

        .outcome-option:hover {
            border-color: var(--primary);
        }

        .outcome-option.selected {
            border-color: var(--primary);
            background: rgba(79, 70, 229, 0.05);
        }

        .outcome-option.selected.answered { border-color: var(--success); background: rgba(34, 197, 94, 0.05); }
        .outcome-option.selected.no-answer { border-color: var(--warning); background: rgba(245, 158, 11, 0.05); }
        .outcome-option.selected.not-interested { border-color: var(--danger); background: rgba(239, 68, 68, 0.05); }
        .outcome-option.selected.callback { border-color: var(--info); background: rgba(0, 81, 213, 0.05); }
        .outcome-option.selected.converted { border-color: var(--tertiary); background: rgba(0, 109, 98, 0.05); }

        .outcome-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .outcome-dot.answered { background: var(--success); }
        .outcome-dot.no-answer { background: var(--warning); }
        .outcome-dot.not-interested { background: var(--danger); }
        .outcome-dot.callback { background: var(--info); }
        .outcome-dot.converted { background: var(--tertiary); }

        .outcome-option-text {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .form-group {
            margin-bottom: var(--spacing-lg);
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: 8px;
            display: block;
        }

        .form-control,
        .form-select {
            height: 48px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            font-size: 14px;
            background: white;
            width: 100%;
        }

        .form-control:focus,
        .form-select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        textarea.form-control {
            height: 100px;
            resize: vertical;
        }

        /* Attempt Timeline */
        .attempt-timeline {
            position: relative;
            padding-left: 40px;
        }

        .attempt-line {
            position: absolute;
            left: 15px;
            top: 0;
            bottom: 0;
            width: 2px;
            background: var(--border-subtle);
        }

        .attempt-item {
            position: relative;
            padding-bottom: var(--spacing-lg);
        }

        .attempt-item:last-child {
            padding-bottom: 0;
        }

        .attempt-dot {
            position: absolute;
            left: -32px;
            top: 0;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            border: 3px solid var(--primary);
            background: white;
            z-index: 1;
        }

        .attempt-dot.success { border-color: var(--success); }
        .attempt-dot.warning { border-color: var(--warning); }
        .attempt-dot.danger { border-color: var(--danger); }

        .attempt-content {
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
        }

        .attempt-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }

        .attempt-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
        }

        .attempt-time {
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        .attempt-result {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 2px 10px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .attempt-result.answered {
            background: rgba(34, 197, 94, 0.1);
            color: var(--success);
        }

        .attempt-result.no-answer {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }

        .attempt-result.busy {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        .attempt-notes {
            font-size: 13px;
            color: var(--on-surface-variant);
            margin: 0;
            line-height: 1.5;
        }

        .attempt-user {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 8px;
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        .attempt-user-avatar {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 9px;
            font-weight: 600;
        }

        /* Quick Action Cards */
        .action-cards-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--spacing-md);
        }

        .action-card {
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
            background: white;
        }

        .action-card:hover {
            border-color: var(--primary);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .action-card-icon {
            width: 44px;
            height: 44px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .action-card-title {
            font-size: 13px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .action-card-desc {
            font-size: 11px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        /* Related Info Card */
        .related-card {
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
            cursor: pointer;
            transition: all 0.2s ease;
            border: 1px solid transparent;
        }

        .related-card:hover {
            border-color: var(--primary);
            background: white;
        }

        .related-card:last-child {
            margin-bottom: 0;
        }

        .related-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }

        .related-id {
            font-size: 12px;
            font-weight: 600;
            color: var(--primary);
        }

        .related-title {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0 0 4px 0;
        }

        .related-meta {
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        @media (max-width: 768px) {
            .detail-header-body {
                grid-template-columns: 1fr;
            }

            .detail-header-top {
                flex-direction: column;
            }

            .status-strip {
                grid-template-columns: repeat(2, 1fr);
            }

            .outcome-options {
                grid-template-columns: 1fr;
            }

            .action-cards-grid {
                grid-template-columns: 1fr;
            }
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button>
                    <button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button>
                </div>
            </header>

            <div class="content-area">
                <!-- Back -->
                <div class="mb-3">
                    <a href="followup-list.html" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Follow-ups</a>
                </div>

                <!-- Detail Header -->
                <div class="detail-header">
                    <div class="detail-header-gradient">
                        <div class="detail-header-top">
                            <div class="header-left-badges">
                                <span class="header-badge"><i class="fas fa-phone"></i> Phone Call</span>
                                <span class="header-badge overdue"><i class="fas fa-exclamation-triangle"></i> Overdue — 2 Days</span>
                                <span class="header-badge high"><i class="fas fa-flag"></i> High Priority</span>
                            </div>
                            <div class="header-actions">
                                <button class="header-btn"><i class="fas fa-edit"></i> Edit</button>
                                <button class="header-btn"><i class="fas fa-check"></i> Complete</button>
                                <button class="header-btn"><i class="fas fa-redo"></i> Reschedule</button>
                            </div>
                        </div>

                        <div class="detail-header-body">
                            <div>
                                <div class="header-schedule-label">Student</div>
                                <div class="header-student">
                                    <div class="header-avatar">NK</div>
                                    <div>
                                        <p class="header-student-name">Nikhil Kumar</p>
                                        <p class="header-student-info">M.Tech Artificial Intelligence</p>
                                        <p class="header-student-info" style="margin-top:4px"><i class="fas fa-phone"></i> +91 98765 43214 &nbsp;|&nbsp; <i class="fas fa-envelope"></i> nikhil@email.com</p>
                                    </div>
                                </div>
                            </div>
                            <div class="header-schedule">
                                <div class="header-schedule-label">Scheduled For</div>
                                <p class="header-schedule-date">December 14, 2024</p>
                                <p class="header-schedule-time"><i class="far fa-clock"></i> 10:00 AM — Saturday</p>
                            </div>
                        </div>
                    </div>

                    <div class="status-strip">
                        <div class="status-strip-item">
                            <p class="strip-label">Follow-up ID</p>
                            <p class="strip-value" style="color:var(--primary)">#FU-2024-0089</p>
                        </div>
                        <div class="status-strip-item">
                            <p class="strip-label">Status</p>
                            <p class="strip-value overdue"><i class="fas fa-exclamation-circle"></i> Overdue</p>
                        </div>
                        <div class="status-strip-item">
                            <p class="strip-label">Assigned To</p>
                            <p class="strip-value">Sarah Patel</p>
                        </div>
                        <div class="status-strip-item">
                            <p class="strip-label">Attempts</p>
                            <p class="strip-value">3 of 5</p>
                        </div>
                        <div class="status-strip-item">
                            <p class="strip-label">Created On</p>
                            <p class="strip-value">Dec 12, 2024</p>
                        </div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-lg-8">
                        <!-- Follow-up Information -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-info-circle"></i></div>
                                    <div class="section-title-text"><h3>Follow-up Details</h3><p>Complete activity information</p></div>
                                </div>
                            </div>

                            <div class="info-grid">
                                <div class="info-item">
                                    <span class="info-label">Type</span>
                                    <span class="info-value"><i class="fas fa-phone" style="color:var(--primary);margin-right:6px"></i> Phone Call</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Priority</span>
                                    <span class="info-value"><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:var(--danger);margin-right:6px"></span> High</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Related Inquiry</span>
                                    <span class="info-value highlighted" style="cursor:pointer">#INQ-2024-006</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Course Interest</span>
                                    <span class="info-value">M.Tech Artificial Intelligence</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Reminder Set</span>
                                    <span class="info-value">30 minutes before</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label">Recurring</span>
                                    <span class="info-value">No</span>
                                </div>
                            </div>

                            <div class="info-item" style="margin-top:var(--spacing-lg)">
                                <span class="info-label">Subject</span>
                                <span class="info-value">No-show follow-up — Reschedule counseling session</span>
                            </div>

                            <div class="info-item" style="margin-top:var(--spacing-md)">
                                <span class="info-label">Notes / Description</span>
                                <span class="info-value" style="line-height:1.6">Student didn't attend the scheduled counseling session on Dec 12. Need to call and understand the reason, reschedule the counseling, and share necessary documents. Student had shown high interest in AI/ML specialization. Important to maintain engagement.</span>
                            </div>
                        </div>

                        <!-- Attempt History -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-history"></i></div>
                                    <div class="section-title-text"><h3>Attempt History</h3><p>3 attempts made so far</p></div>
                                </div>
                                <button class="btn btn-sm btn-primary" id="addAttemptBtn"><i class="fas fa-plus"></i> Log Attempt</button>
                            </div>

                            <div class="attempt-timeline">
                                <div class="attempt-line"></div>

                                <div class="attempt-item">
                                    <div class="attempt-dot warning"></div>
                                    <div class="attempt-content">
                                        <div class="attempt-header">
                                            <span class="attempt-label">Attempt #3</span>
                                            <span class="attempt-time">Dec 16, 2024 at 11:30 AM</span>
                                        </div>
                                        <span class="attempt-result no-answer"><i class="fas fa-phone-slash"></i> No Answer</span>
                                        <p class="attempt-notes">Called again but phone was switched off. Left a voicemail requesting callback. Also sent a WhatsApp message with meeting reschedule link.</p>
                                        <div class="attempt-user">
                                            <div class="attempt-user-avatar">SP</div>
                                            <span>Sarah Patel</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="attempt-item">
                                    <div class="attempt-dot danger"></div>
                                    <div class="attempt-content">
                                        <div class="attempt-header">
                                            <span class="attempt-label">Attempt #2</span>
                                            <span class="attempt-time">Dec 15, 2024 at 3:00 PM</span>
                                        </div>
                                        <span class="attempt-result busy"><i class="fas fa-user-clock"></i> Busy / Call Later</span>
                                        <p class="attempt-notes">Student answered briefly, said he was busy and would call back. No callback received. Will try again tomorrow morning.</p>
                                        <div class="attempt-user">
                                            <div class="attempt-user-avatar">SP</div>
                                            <span>Sarah Patel</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="attempt-item">
                                    <div class="attempt-dot warning"></div>
                                    <div class="attempt-content">
                                        <div class="attempt-header">
                                            <span class="attempt-label">Attempt #1</span>
                                            <span class="attempt-time">Dec 14, 2024 at 10:00 AM</span>
                                        </div>
                                        <span class="attempt-result no-answer"><i class="fas fa-phone-slash"></i> No Answer</span>
                                        <p class="attempt-notes">First attempt to call. Phone rang but no one picked up. Will try again in the afternoon.</p>
                                        <div class="attempt-user">
                                            <div class="attempt-user-avatar">SP</div>
                                            <span>Sarah Patel</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Outcome Recording -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-clipboard-check"></i></div>
                                    <div class="section-title-text"><h3>Record Outcome</h3><p>Log the result of this follow-up</p></div>
                                </div>
                            </div>

                            <div class="outcome-form">
                                <h4 class="outcome-title"><i class="fas fa-check-circle"></i> What was the outcome?</h4>

                                <div class="outcome-options" id="outcomeOptions">
                                    <div class="outcome-option answered" data-outcome="answered">
                                        <div class="outcome-dot answered"></div>
                                        <p class="outcome-option-text">Answered — Positive</p>
                                    </div>
                                    <div class="outcome-option no-answer" data-outcome="no-answer">
                                        <div class="outcome-dot no-answer"></div>
                                        <p class="outcome-option-text">No Answer</p>
                                    </div>
                                    <div class="outcome-option not-interested" data-outcome="not-interested">
                                        <div class="outcome-dot not-interested"></div>
                                        <p class="outcome-option-text">Not Interested</p>
                                    </div>
                                    <div class="outcome-option callback" data-outcome="callback">
                                        <div class="outcome-dot callback"></div>
                                        <p class="outcome-option-text">Callback Requested</p>
                                    </div>
                                    <div class="outcome-option converted" data-outcome="converted">
                                        <div class="outcome-dot converted"></div>
                                        <p class="outcome-option-text">Converted to Application</p>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Outcome Notes</label>
                                    <textarea class="form-control" placeholder="Describe what happened during this follow-up..."></textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Schedule Next Follow-up?</label>
                                            <select class="form-select" id="scheduleNext">
                                                <option value="">No</option>
                                                <option value="tomorrow">Yes — Tomorrow</option>
                                                <option value="3days">Yes — In 3 Days</option>
                                                <option value="week">Yes — Next Week</option>
                                                <option value="custom">Yes — Custom Date</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6" id="nextDateField" style="display:none">
                                        <div class="form-group">
                                            <label class="form-label">Next Follow-up Date</label>
                                            <input type="date" class="form-control" id="nextDate">
                                        </div>
                                    </div>
                                </div>

                                <button class="btn btn-primary"><i class="fas fa-save"></i> Save Outcome</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Quick Actions -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-bolt"></i></div>
                                    <div class="section-title-text"><h3>Quick Actions</h3></div>
                                </div>
                            </div>

                            <div class="action-cards-grid">
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(79,70,229,0.1);color:var(--primary)"><i class="fas fa-phone"></i></div>
                                    <div><p class="action-card-title">Call Now</p><p class="action-card-desc">Direct phone call</p></div>
                                </div>
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(37,211,102,0.1);color:#25d366"><i class="fab fa-whatsapp"></i></div>
                                    <div><p class="action-card-title">WhatsApp</p><p class="action-card-desc">Send message</p></div>
                                </div>
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(0,81,213,0.1);color:var(--info)"><i class="fas fa-envelope"></i></div>
                                    <div><p class="action-card-title">Send Email</p><p class="action-card-desc">Compose email</p></div>
                                </div>
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(245,158,11,0.1);color:var(--warning)"><i class="fas fa-sms"></i></div>
                                    <div><p class="action-card-title">Send SMS</p><p class="action-card-desc">Quick text message</p></div>
                                </div>
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(34,197,94,0.1);color:var(--success)"><i class="fas fa-check-circle"></i></div>
                                    <div><p class="action-card-title">Mark Done</p><p class="action-card-desc">Complete follow-up</p></div>
                                </div>
                                <div class="action-card">
                                    <div class="action-card-icon" style="background:rgba(239,68,68,0.1);color:var(--danger)"><i class="fas fa-times-circle"></i></div>
                                    <div><p class="action-card-title">Cancel</p><p class="action-card-desc">Cancel follow-up</p></div>
                                </div>
                            </div>
                        </div>

                        <!-- Student Quick View -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-user"></i></div>
                                    <div class="section-title-text"><h3>Student Info</h3></div>
                                </div>
                            </div>

                            <div class="d-flex align-items-center gap-3 mb-3">
                                <div class="header-avatar" style="width:48px;height:48px;font-size:18px;background:linear-gradient(135deg,var(--primary),var(--secondary));color:white;border:none">NK</div>
                                <div>
                                    <p style="margin:0;font-size:16px;font-weight:600">Nikhil Kumar</p>
                                    <p style="margin:0;font-size:12px;color:var(--on-surface-variant)">M.Tech AI • #INQ-2024-006</p>
                                </div>
                            </div>

                            <div class="d-flex flex-column gap-2 mb-3">
                                <div class="d-flex align-items-center gap-2" style="font-size:13px">
                                    <i class="fas fa-phone" style="color:var(--primary);width:16px"></i>
                                    <span>+91 98765 43214</span>
                                </div>
                                <div class="d-flex align-items-center gap-2" style="font-size:13px">
                                    <i class="fas fa-envelope" style="color:var(--primary);width:16px"></i>
                                    <span>nikhil.kumar@email.com</span>
                                </div>
                                <div class="d-flex align-items-center gap-2" style="font-size:13px">
                                    <i class="fas fa-map-marker-alt" style="color:var(--primary);width:16px"></i>
                                    <span>Delhi, India</span>
                                </div>
                            </div>

                            <a href="inquiry-details.html" class="btn btn-secondary btn-sm w-100"><i class="fas fa-external-link-alt"></i> View Full Profile</a>
                        </div>

                        <!-- Related Activities -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-link"></i></div>
                                    <div class="section-title-text"><h3>Related</h3></div>
                                </div>
                            </div>

                            <div class="related-card">
                                <div class="related-card-header">
                                    <span class="related-id">#INQ-2024-006</span>
                                    <span class="badge badge-info">Active</span>
                                </div>
                                <p class="related-title">Inquiry — M.Tech AI</p>
                                <p class="related-meta">Created Dec 10, 2024</p>
                            </div>

                            <div class="related-card">
                                <div class="related-card-header">
                                    <span class="related-id">#COU-2024-0039</span>
                                    <span class="badge badge-warning">No-Show</span>
                                </div>
                                <p class="related-title">Counseling Session</p>
                                <p class="related-meta">Dec 12, 2024 — Sarah Patel</p>
                            </div>

                            <div class="related-card">
                                <div class="related-card-header">
                                    <span class="related-id">#FU-2024-0085</span>
                                    <span class="badge badge-success">Completed</span>
                                </div>
                                <p class="related-title">Previous Follow-up (Email)</p>
                                <p class="related-meta">Dec 11, 2024 — Sent brochure</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
