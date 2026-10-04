<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="InquireDetails.aspx.cs" Inherits="EduFlow.Admin.InquireDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
        .details-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            color: white;
        }

        .details-header-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-lg);
        }

        .inquiry-id-badge {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 8px 16px;
            border-radius: var(--radius-full);
            font-size: 14px;
            font-weight: 600;
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
        }

        .header-btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .student-profile {
            display: flex;
            align-items: center;
            gap: var(--spacing-lg);
        }

        .student-avatar-large {
            width: 80px;
            height: 80px;
            border-radius: var(--radius-full);
            background: rgba(255, 255, 255, 0.2);
            border: 3px solid rgba(255, 255, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 700;
        }

        .student-info-header {
            flex: 1;
        }

        .student-name-large {
            font-size: 32px;
            font-weight: 700;
            margin: 0 0 8px 0;
        }

        .student-meta {
            display: flex;
            gap: var(--spacing-lg);
            flex-wrap: wrap;
        }

        .meta-item-header {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
        }

        .meta-item-header i {
            opacity: 0.8;
        }

        .status-badge-large {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: var(--radius-full);
            font-size: 14px;
            font-weight: 600;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
        }

        .info-section {
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
            color: var(--on-surface);
        }

        .section-title-text p {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
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

        .quick-actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: var(--spacing-md);
        }

        .quick-action-card {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-lg);
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .quick-action-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
            border-color: var(--primary);
        }

        .quick-action-icon {
            width: 56px;
            height: 56px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto var(--spacing-md);
            color: white;
            font-size: 24px;
        }

        .quick-action-card.success .quick-action-icon {
            background: linear-gradient(135deg, var(--success) 0%, #16a34a 100%);
        }

        .quick-action-card.warning .quick-action-icon {
            background: linear-gradient(135deg, var(--warning) 0%, #d97706 100%);
        }

        .quick-action-card.danger .quick-action-icon {
            background: linear-gradient(135deg, var(--danger) 0%, #dc2626 100%);
        }

        .quick-action-card.whatsapp .quick-action-icon {
            background: linear-gradient(135deg, #25D366 0%, #128C7E 100%);
        }

        .quick-action-card.purple .quick-action-icon {
            background: linear-gradient(135deg, #8b5cf6 0%, #6d28d9 100%);
        }

        .quick-action-card.info .quick-action-icon {
            background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
        }

        .quick-action-title {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        /* Vertical Activity Timeline Styles */
        .v-timeline {
            position: relative;
            padding: 4px 0;
        }

        .v-timeline-item {
            display: flex;
            gap: 14px;
            align-items: flex-start;
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 12px 14px;
            transition: all 0.2s ease;
        }

        .v-timeline-item:hover {
            box-shadow: var(--shadow-sm);
            border-color: var(--primary);
        }

        .v-timeline-badge {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
            flex-shrink: 0;
        }

        .v-timeline-content {
            flex: 1;
        }

        .v-timeline-arrow {
            text-align: center;
            color: var(--primary);
            font-size: 13px;
            margin: 4px 0;
            opacity: 0.75;
        }

        .note-card {
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
            border-left: 3px solid var(--primary);
        }

        .note-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }

        .note-author {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 13px;
        }

        .timeline-user-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
        }

        .note-time {
            font-size: 11px;
            color: var(--on-surface-variant);
        }

        .note-content {
            font-size: 13px;
            margin: 0;
        }

        .add-note-form {
            display: flex;
            gap: 8px;
            margin-top: 12px;
        }

        .add-note-input {
            flex: 1;
            padding: 8px 12px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            font-size: 13px;
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
                    <input type="text" placeholder="Search inquiry details...">
                </div>
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

        <div class="content-area">
            <!-- Back Button -->
            <div class="mb-3">
                <a href="inquiry-list.html" class="btn btn-secondary btn-sm">
                    <i class="fas fa-arrow-left me-1"></i>Back to Inquiries
                </a>
            </div>

            <!-- Details Header Banner -->
            <div class="details-header">
                <div class="details-header-top">
                    <div class="inquiry-id-badge">
                        <i class="fas fa-hashtag"></i>INQ-2024-001
                    </div>
                    <div class="header-actions">
                        <button class="header-btn" onclick="window.location.href='edit-inquiry.html'">
                            <i class="fas fa-edit"></i>Edit
                        </button>
                        <button class="header-btn" onclick="window.print()">
                            <i class="fas fa-print"></i>Print
                        </button>
                        <button class="header-btn">
                            <i class="fas fa-share-alt"></i>Share
                        </button>
                    </div>
                </div>

                <div class="student-profile">
                    <div class="student-avatar-large">RK</div>
                    <div class="student-info-header">
                        <h1 class="student-name-large">Rajesh Kumar</h1>
                        <div class="student-meta">
                            <div class="meta-item-header">
                                <i class="fas fa-envelope"></i>
                                <span>rajesh.kumar@email.com</span>
                            </div>
                            <div class="meta-item-header">
                                <i class="fas fa-phone"></i>
                                <span>+91 98765 43210</span>
                            </div>
                            <div class="meta-item-header">
                                <i class="fas fa-calendar"></i>
                                <span>Created: Dec 15, 2024</span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <span class="status-badge-large">
                            <i class="fas fa-circle text-success"></i>
                            New Inquiry
                        </span>
                    </div>
                </div>
            </div>

            <!-- Quick Actions Card (6 Interactive Cards) -->
            <div class="info-section">
                <div class="section-header">
                    <div class="section-title-icon">
                        <div class="section-icon-circle">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <div class="section-title-text">
                            <h3>Quick Actions</h3>
                            <p>Take immediate interactive actions on this inquiry</p>
                        </div>
                    </div>
                </div>

                <div class="quick-actions-grid">
                    <!-- 1. Call Student -->
                    <div class="quick-action-card success" data-bs-toggle="modal" data-bs-target="#callStudentModal">
                        <div class="quick-action-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <p class="quick-action-title">Call Student</p>
                    </div>

                    <!-- 2. WhatsApp -->
                    <div class="quick-action-card whatsapp" data-bs-toggle="modal" data-bs-target="#whatsappModal">
                        <div class="quick-action-icon">
                            <i class="fab fa-whatsapp"></i>
                        </div>
                        <p class="quick-action-title">WhatsApp</p>
                    </div>

                    <!-- 3. Send Email -->
                    <div class="quick-action-card info" data-bs-toggle="modal" data-bs-target="#emailModal">
                        <div class="quick-action-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <p class="quick-action-title">Send Email</p>
                    </div>

                    <!-- 4. Schedule Counseling -->
                    <div class="quick-action-card warning" onclick="window.location.href='schedule-counseling.html'">
                        <div class="quick-action-icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <p class="quick-action-title">Schedule Counseling</p>
                    </div>

                    <!-- 5. Add Follow-up -->
                    <div class="quick-action-card primary" data-bs-toggle="modal" data-bs-target="#addFollowupModal">
                        <div class="quick-action-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <p class="quick-action-title">Add Follow-up</p>
                    </div>

                    <!-- 6. Recommend for Admission -->
                    <div class="quick-action-card purple" data-bs-toggle="modal" data-bs-target="#recommendAdmissionModal">
                        <div class="quick-action-icon">
                            <i class="fas fa-thumbs-up"></i>
                        </div>
                        <p class="quick-action-title">Recommend for Admission</p>
                    </div>
                </div>
            </div>

            <!-- Detail Grid Sections -->
            <div class="row g-3">
                <div class="col-lg-8">
                    <!-- Personal Information -->
                    <div class="info-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="section-title-text">
                                    <h3>Personal Information</h3>
                                    <p>Student's personal details</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Full Name</span>
                                <span class="info-value">Rajesh Kumar</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Date of Birth</span>
                                <span class="info-value">May 15, 2000</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Gender</span>
                                <span class="info-value">Male</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Nationality</span>
                                <span class="info-value">Indian</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Email Address</span>
                                <span class="info-value highlighted">rajesh.kumar@email.com</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Phone Number</span>
                                <span class="info-value highlighted">+91 98765 43210</span>
                            </div>
                            <div class="info-item" style="grid-column: 1 / -1;">
                                <span class="info-label">Address</span>
                                <span class="info-value">123 Main Street, Sector 5, Mumbai, Maharashtra - 400001</span>
                            </div>
                        </div>
                    </div>

                    <!-- Academic Details -->
                    <div class="info-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle">
                                    <i class="fas fa-graduation-cap"></i>
                                </div>
                                <div class="section-title-text">
                                    <h3>Academic Details</h3>
                                    <p>Educational background</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Highest Qualification</span>
                                <span class="info-value">12th Standard</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Percentage/CGPA</span>
                                <span class="info-value highlighted">85%</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Last Institution</span>
                                <span class="info-value">ABC Higher Secondary School</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Year of Passing</span>
                                <span class="info-value">2023</span>
                            </div>
                        </div>
                    </div>

                    <!-- Inquiry Information -->
                    <div class="info-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle">
                                    <i class="fas fa-clipboard-list"></i>
                                </div>
                                <div class="section-title-text">
                                    <h3>Inquiry Information</h3>
                                    <p>Course interest and inquiry details</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Course Interested</span>
                                <span class="info-value highlighted">B.Tech Computer Science</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Inquiry Source</span>
                                <span class="info-value">Website</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Priority</span>
                                <span class="info-value">
                                    <span style="color: var(--danger); font-weight: 600;">
                                        <i class="fas fa-circle" style="font-size: 8px;"></i>High
                                    </span>
                                </span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Preferred Mode</span>
                                <span class="info-value">Full Time (On-Campus)</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-lg-4">
                    <!-- Assigned Counselor -->
                    <div class="info-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle">
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="section-title-text">
                                    <h3>Assigned Counselor</h3>
                                    <p>Primary contact officer</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-item mb-3">
                            <span class="info-label">Counselor</span>
                            <div class="d-flex align-items-center gap-2 mt-2">
                                <div class="timeline-user-avatar" style="width: 36px; height: 36px; font-size: 14px;">SP</div>
                                <div>
                                    <p style="margin: 0; font-weight: 600; font-size: 14px;">Sarah Patel</p>
                                    <p style="margin: 0; font-size: 12px; color: var(--on-surface-variant);">Senior Counselor</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-item mb-3">
                            <span class="info-label">Contact</span>
                            <div class="mt-2" style="display: flex; flex-direction: column; gap: 8px;">
                                <div style="display: flex; align-items: center; gap: 8px; font-size: 13px;">
                                    <i class="fas fa-envelope" style="color: var(--primary);"></i>
                                    <span>sarah.patel@institution.edu</span>
                                </div>
                                <div style="display: flex; align-items: center; gap: 8px; font-size: 13px;">
                                    <i class="fas fa-phone" style="color: var(--primary);"></i>
                                    <span>+91 98765 00001</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Follow-up Info -->
                    <div class="info-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="section-title-text">
                                    <h3>Next Follow-up</h3>
                                    <p>Scheduled activity</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-item mb-3">
                            <span class="info-label">Date & Time</span>
                            <span class="info-value highlighted">Dec 20, 2024 at 10:00 AM</span>
                        </div>

                        <div class="info-item mb-3">
                            <span class="info-label">Type</span>
                            <span class="badge bg-primary text-white">Phone Call</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Notes</span>
                            <span class="info-value">Discuss course curriculum and fee structure</span>
                        </div>
                        <!-- Vertical Activity Timeline -->
                        <div class="info-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle">
                                        <i class="fas fa-stream"></i>
                                    </div>
                                    <div class="section-title-text">
                                        <h3>Activity Timeline</h3>
                                        <p>Student milestone progression</p>
                                    </div>
                                </div>
                            </div>

                            <div class="v-timeline">
                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-primary text-white"><i class="fas fa-file-alt"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Inquiry Created</h6>
                                            <span class="badge bg-light text-dark border">Dec 1</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">Web inquiry received for B.Tech CSE</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-info text-white"><i class="fas fa-user-check"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Assigned to Sarah</h6>
                                            <span class="badge bg-light text-dark border">Dec 2</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">Assigned to Counselor Sarah Patel</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-warning text-dark"><i class="fas fa-user-tie"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Counseling Completed</h6>
                                            <span class="badge bg-light text-dark border">Dec 3</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">1-on-1 counseling completed</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-primary text-white"><i class="fas fa-phone-alt"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Follow-up Done</h6>
                                            <span class="badge bg-light text-dark border">Dec 5</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">Fee structure & scholarship call done</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge text-white" style="background: #8b5cf6;"><i class="fas fa-paper-plane"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Application Submitted</h6>
                                            <span class="badge bg-light text-dark border">Dec 7</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">Application form & token fee submitted</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-secondary text-white"><i class="fas fa-check-double"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Documents Verified</h6>
                                            <span class="badge bg-light text-dark border">Dec 9</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">12th marksheet & ID proof verified</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-success text-white"><i class="fas fa-graduation-cap"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size: 13px;">Admission Approved</h6>
                                            <span class="badge bg-success text-white">Dec 10</span>
                                        </div>
                                        <p class="text-muted fs-7 mb-0">Admission approved & seat allocated</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Internal Notes -->
                        <div class="info-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle">
                                        <i class="fas fa-sticky-note"></i>
                                    </div>
                                    <div class="section-title-text">
                                        <h3>Activity Notes</h3>
                                        <p>Internal comments</p>
                                    </div>
                                </div>
                            </div>

                            <div class="notes-list">
                                <div class="note-card">
                                    <div class="note-header">
                                        <div class="note-author">
                                            <div class="timeline-user-avatar">SP</div>
                                            Sarah Patel
                                        </div>
                                        <span class="note-time">2 hours ago</span>
                                    </div>
                                    <p class="note-content">
                                        Student seems very motivated. Discussed scholarship options and placement records.
                                    </p>
                                </div>
                            </div>

                            <div class="add-note-form">
                                <input type="text" class="add-note-input" placeholder="Add a note..." id="noteInput">
                                <button class="btn btn-primary" onclick="addNote()">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </main>

    <div class="modal fade" id="callStudentModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-phone-alt text-success me-2"></i>Call Student</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="mb-2"><strong>Student:</strong> Rajesh Kumar</p>
                    <p class="mb-3"><strong>Phone Number:</strong> <a href="tel:+919876543210" class="text-primary fw-semibold">+91 98765 43210</a></p>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Log Call Outcome</label>
                        <select class="form-select">
                            <option>Call Connected - Positive Discussion</option>
                            <option>Call Connected - Requested Callback</option>
                            <option>No Answer / Busy</option>
                            <option>Switched Off / Out of Coverage</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Call Remarks</label>
                        <textarea class="form-control" rows="3" placeholder="Enter conversation details..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="tel:+919876543210" class="btn btn-success me-auto"><i class="fas fa-phone me-1"></i>Dial Now</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save Log</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 2. WhatsApp Modal -->
    <div class="modal fade" id="whatsappModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background: #25D366; color: white;">
                    <h5 class="modal-title"><i class="fab fa-whatsapp me-2"></i>Send WhatsApp Message</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="mb-2"><strong>Student:</strong> Rajesh Kumar (+91 98765 43210)</p>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Select Message Template</label>
                        <select class="form-select mb-2" onchange="document.getElementById('waText').value=this.value">
                            <option value="Hi Rajesh, thank you for inquiring about B.Tech CSE at EduCRM. How can we assist you today?">Greeting & Inquiry Follow-up</option>
                            <option value="Hi Rajesh, please find our course syllabus brochure attached. Let us know if you have any questions.">Share Course Brochure</option>
                            <option value="Hi Rajesh, your counseling session is scheduled. Please confirm your availability.">Counseling Reminder</option>
                        </select>
                        <textarea class="form-control" id="waText" rows="4">Hi Rajesh, thank you for inquiring about B.Tech CSE at EduCRM. How can we assist you today?</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <a href="https://wa.me/919876543210" target="_blank" class="btn text-white" style="background: #25D366;"><i class="fab fa-whatsapp me-1"></i>Open WhatsApp Web</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 3. Send Email Modal -->
    <div class="modal fade" id="emailModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-envelope text-info me-2"></i>Send Email to Student</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">To</label>
                        <input type="email" class="form-control" value="rajesh.kumar@email.com" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Subject</label>
                        <input type="text" class="form-control" value="Information regarding B.Tech CSE Admission 2024">
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email Content</label>
                        <textarea class="form-control" rows="5">Dear Rajesh,

Thank you for your interest in the B.Tech Computer Science program at EduCRM. We would love to guide you through the admission process and answer any questions.

Best Regards,
Admissions Team</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-info text-white" data-bs-dismiss="modal"><i class="fas fa-paper-plane me-1"></i>Send Email</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 4. Add Follow-up Modal -->
    <div class="modal fade" id="addFollowupModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-clock text-primary me-2"></i>Add Follow-up Activity</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Follow-up Type</label>
                        <select class="form-select">
                            <option>Phone Call</option>
                            <option>WhatsApp Reminder</option>
                            <option>Email Follow-up</option>
                            <option>In-Person Meeting</option>
                        </select>
                    </div>
                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label fw-semibold">Date</label>
                            <input type="date" class="form-control">
                        </div>
                        <div class="col-6">
                            <label class="form-label fw-semibold">Time</label>
                            <input type="time" class="form-control">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Activity Goal / Note</label>
                        <textarea class="form-control" rows="3" placeholder="Describe next step..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Schedule Follow-up</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 5. Recommend for Admission Modal -->
    <div class="modal fade" id="recommendAdmissionModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background: #8b5cf6; color: white;">
                    <h5 class="modal-title"><i class="fas fa-thumbs-up me-2"></i>Recommend for Admission</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="small text-muted">Recommend student Rajesh Kumar for formal admission review.</p>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Recommended Course</label>
                        <select class="form-select">
                            <option>B.Tech Computer Science</option>
                            <option>BCA Cloud Computing</option>
                            <option>MBA Finance</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Counselor Recommendation Remarks</label>
                        <textarea class="form-control" rows="3" placeholder="Add eligibility comments, score verification, or fee discount notes..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn text-white" style="background: #8b5cf6;" data-bs-dismiss="modal">Submit Recommendation</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function addNote() {
            const noteInput = document.getElementById('noteInput');
            if (noteInput.value.trim()) {
                alert('Note added: ' + noteInput.value);
                noteInput.value = '';
            }
        }
    </script>
</asp:Content>
