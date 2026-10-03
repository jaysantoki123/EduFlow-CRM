<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application-Details.aspx.cs" Inherits="EduFlow.Admission_Manager.Application_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Application Details - EduFlow
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
       .detail-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-xl) var(--radius-xl) 0 0;
            padding: var(--spacing-xl);
            color: white;
        }

        .header-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: var(--spacing-lg); flex-wrap: wrap; gap: var(--spacing-md); }

        .header-badge { background: rgba(255,255,255,0.2); padding: 6px 16px; border-radius: var(--radius-full); font-size: 13px; font-weight: 600; display: inline-flex; align-items: center; gap: 6px; }

        .header-actions { display: flex; gap: var(--spacing-sm); flex-wrap: wrap; }

        .header-btn { background: rgba(255,255,255,0.2); border: 1px solid rgba(255,255,255,0.3); color: white; padding: 8px 16px; border-radius: var(--radius-md); font-size: 14px; font-weight: 500; cursor: pointer; transition: all 0.2s ease; display: flex; align-items: center; gap: 6px; }
        .header-btn:hover { background: rgba(255,255,255,0.3); }

        .header-body { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: var(--spacing-xl); }
        .header-section-label { font-size: 12px; text-transform: uppercase; letter-spacing: 0.1em; opacity: 0.7; margin-bottom: var(--spacing-sm); }
        .header-section-value { font-size: 20px; font-weight: 700; margin: 0; }
        .header-section-sub { font-size: 13px; opacity: 0.9; margin: 0; }

        .header-person { display: flex; align-items: center; gap: 12px; }
        .header-avatar { width: 56px; height: 56px; border-radius: var(--radius-full); background: rgba(255,255,255,0.2); border: 3px solid rgba(255,255,255,0.3); display: flex; align-items: center; justify-content: center; font-size: 22px; font-weight: 700; flex-shrink: 0; }

        /* Progress Strip */
        .progress-strip {
            background: rgba(255,255,255,0.95);
            border: 1px solid var(--border-subtle);
            border-top: none;
            border-radius: 0 0 var(--radius-xl) var(--radius-xl);
            padding: var(--spacing-lg) var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
        }

        .progress-steps { display: flex; justify-content: space-between; position: relative; }
        .progress-steps::before { content:''; position: absolute; top: 20px; left: 0; right: 0; height: 3px; background: var(--border-subtle); z-index: 0; }

        .progress-step { display: flex; flex-direction: column; align-items: center; gap: 8px; position: relative; z-index: 1; min-width: 100px; }

        .step-circle {
            width: 40px; height: 40px; border-radius: 50%; border: 3px solid var(--border-subtle);
            background: white; display: flex; align-items: center; justify-content: center;
            font-weight: 600; font-size: 14px; color: var(--on-surface-variant);
            transition: all 0.3s ease;
        }

        .progress-step.completed .step-circle { background: var(--success); border-color: var(--success); color: white; }
        .progress-step.active .step-circle { background: var(--primary); border-color: var(--primary); color: white; box-shadow: 0 0 0 4px rgba(79,70,229,0.2); }
        .progress-step.rejected .step-circle { background: var(--danger); border-color: var(--danger); color: white; }

        .step-label { font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-align: center; }
        .progress-step.completed .step-label { color: var(--success); }
        .progress-step.active .step-label { color: var(--primary); }

        /* Section */
        .detail-section {
            background: rgba(255,255,255,0.8); backdrop-filter: blur(12px);
            border-radius: var(--radius-xl); border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl); margin-bottom: var(--spacing-lg);
        }

        .section-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: var(--spacing-lg); padding-bottom: var(--spacing-md); border-bottom: 2px solid var(--border-subtle); }
        .section-title-icon { display: flex; align-items: center; gap: 12px; }
        .section-icon-circle { width: 40px; height: 40px; background: linear-gradient(135deg, rgba(79,70,229,0.1), rgba(0,81,213,0.1)); border-radius: var(--radius-full); display: flex; align-items: center; justify-content: center; color: var(--primary); font-size: 18px; }
        .section-title-text h3 { font-size: 18px; font-weight: 600; margin: 0; }
        .section-title-text p { font-size: 12px; color: var(--on-surface-variant); margin: 0; }

        .info-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: var(--spacing-lg); }
        .info-item { display: flex; flex-direction: column; gap: 6px; }
        .info-label { font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; letter-spacing: 0.05em; }
        .info-value { font-size: 15px; font-weight: 500; color: var(--on-surface); }
        .info-value.highlighted { color: var(--primary); font-weight: 600; }

        /* Document Cards */
        .doc-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: var(--spacing-md); }

        .doc-card {
            background: var(--surface-container-low); border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg); padding: var(--spacing-md);
            display: flex; gap: var(--spacing-md); align-items: center;
            transition: all 0.2s ease; cursor: pointer;
        }
        .doc-card:hover { border-color: var(--primary); transform: translateY(-2px); box-shadow: var(--shadow-md); }

        .doc-icon { width: 48px; height: 48px; border-radius: var(--radius-lg); display: flex; align-items: center; justify-content: center; font-size: 24px; flex-shrink: 0; }
        .doc-icon.pdf { background: rgba(239,68,68,0.1); color: var(--danger); }
        .doc-icon.image { background: rgba(0,81,213,0.1); color: var(--info); }
        .doc-icon.verified { background: rgba(34,197,94,0.1); color: var(--success); }
        .doc-icon.pending { background: rgba(245,158,11,0.1); color: var(--warning); }

        /* Vertical Activity Timeline Styles */
        .v-timeline { position: relative; padding: 4px 0; }
        .v-timeline-item { display: flex; gap: 14px; align-items: flex-start; background: var(--surface-container-low); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 12px 14px; transition: all 0.2s ease; }
        .v-timeline-item:hover { box-shadow: var(--shadow-sm); border-color: var(--primary); }
        .v-timeline-badge { width: 36px; height: 36px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 15px; flex-shrink: 0; }
        .v-timeline-content { flex: 1; }
        .v-timeline-arrow { text-align: center; color: var(--primary); font-size: 13px; margin: 4px 0; opacity: 0.75; }

        .doc-icon.missing { background: rgba(239,68,68,0.1); color: var(--danger); }

        .doc-info { flex: 1; }
        .doc-name { font-size: 14px; font-weight: 600; color: var(--on-surface); margin: 0 0 2px 0; }
        .doc-meta { font-size: 12px; color: var(--on-surface-variant); margin: 0; }

        .doc-status { flex-shrink: 0; }
        .doc-status-badge { display: inline-flex; align-items: center; gap: 4px; padding: 4px 10px; border-radius: var(--radius-full); font-size: 11px; font-weight: 600; }
        .doc-status-badge.verified { background: rgba(34,197,94,0.1); color: var(--success); }
        .doc-status-badge.pending { background: rgba(245,158,11,0.1); color: var(--warning); }
        .doc-status-badge.missing { background: rgba(239,68,68,0.1); color: var(--danger); }

        /* Fee Summary */
        .fee-table { width: 100%; border-collapse: collapse; }
        .fee-table td { padding: 12px 0; border-bottom: 1px solid var(--border-subtle); font-size: 14px; }
        .fee-table tr:last-child td { border-bottom: none; font-weight: 700; font-size: 16px; }

        /* Action Buttons */
        .approval-actions { display: flex; gap: var(--spacing-md); padding-top: var(--spacing-lg); border-top: 1px solid var(--border-subtle); margin-top: var(--spacing-lg); }
        .approval-btn { flex: 1; padding: 14px; border-radius: var(--radius-lg); border: 2px solid var(--border-subtle); background: white; cursor: pointer; transition: all 0.3s ease; display: flex; align-items: center; justify-content: center; gap: 10px; font-size: 15px; font-weight: 600; }
        .approval-btn:hover { transform: translateY(-2px); box-shadow: var(--shadow-md); }
        .approval-btn.approve { border-color: var(--success); color: var(--success); }
        .approval-btn.approve:hover { background: var(--success); color: white; }
        .approval-btn.reject { border-color: var(--danger); color: var(--danger); }
        .approval-btn.reject:hover { background: var(--danger); color: white; }
        .approval-btn.verify { border-color: var(--info); color: var(--info); }
        .approval-btn.verify:hover { background: var(--info); color: white; }

        @media (max-width: 768px) {
            .header-body { grid-template-columns: 1fr; }
            .progress-steps { flex-wrap: wrap; gap: var(--spacing-md); }
            .progress-steps::before { display: none; }
            .approval-actions { flex-direction: column; }
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
            <header class="topbar"><div class="topbar-left"><button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button></div><div class="topbar-right"><button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button><button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button></div></header>

            <div class="content-area">
                <div class="mb-3"><a href="application-list.html" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back</a></div>

                <!-- Header -->
                <div class="detail-header">
                    <div class="header-top">
                        <div class="d-flex gap-2 flex-wrap"><span class="header-badge"><i class="fas fa-hashtag"></i> APP-2024-0090</span><span class="header-badge" style="background:rgba(245,158,11,0.3)"><i class="fas fa-search"></i> Under Review</span></div>
                        <div class="header-actions">
                            <button class="header-btn" onclick="window.location.href='document-verification.html'"><i class="fas fa-file-check"></i> Verify Docs</button>
                            <button class="header-btn"><i class="fas fa-print"></i> Print</button>
                            <button class="header-btn"><i class="fas fa-edit"></i> Edit</button>
                        </div>
                    </div>
                    <div class="header-body">
                        <div>
                            <div class="header-section-label">Student</div>
                            <div class="header-person">
                                <div class="header-avatar">PS</div>
                                <div>
                                    <p class="header-section-value" style="font-size:22px">Priya Sharma</p>
                                    <p class="header-section-sub">priya.sharma@email.com</p>
                                    <p class="header-section-sub">+91 98765 43211</p>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="header-section-label">Course Applied</div>
                            <p class="header-section-value">MBA Finance</p>
                            <p class="header-section-sub">Session: 2024-2025</p>
                            <p class="header-section-sub">Full-Time Program</p>
                        </div>
                        <div>
                            <div class="header-section-label">Applied On</div>
                            <p class="header-section-value">Dec 14, 2024</p>
                            <p class="header-section-sub">Source: Counselor Referral</p>
                            <p class="header-section-sub">Counselor: Rahul Gupta</p>
                        </div>
                    </div>
                </div>

                <!-- Progress Strip -->
                <div class="progress-strip">
                    <div class="progress-steps">
                        <div class="progress-step completed"><div class="step-circle"><i class="fas fa-check"></i></div><span class="step-label">Submitted</span></div>
                        <div class="progress-step active"><div class="step-circle">2</div><span class="step-label">Under Review</span></div>
                        <div class="progress-step"><div class="step-circle">3</div><span class="step-label">Doc Verified</span></div>
                        <div class="progress-step"><div class="step-circle">4</div><span class="step-label">Approved</span></div>
                        <div class="progress-step"><div class="step-circle">5</div><span class="step-label">Fee Paid</span></div>
                        <div class="progress-step"><div class="step-circle">6</div><span class="step-label">Enrolled</span></div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-lg-8">
                        <!-- Personal Info -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-user"></i></div><div class="section-title-text"><h3>Personal Information</h3></div></div></div>
                            <div class="info-grid">
                                <div class="info-item"><span class="info-label">Full Name</span><span class="info-value">Priya Sharma</span></div>
                                <div class="info-item"><span class="info-label">Date of Birth</span><span class="info-value">Aug 22, 1999</span></div>
                                <div class="info-item"><span class="info-label">Gender</span><span class="info-value">Female</span></div>
                                <div class="info-item"><span class="info-label">Email</span><span class="info-value highlighted">priya.sharma@email.com</span></div>
                                <div class="info-item"><span class="info-label">Phone</span><span class="info-value highlighted">+91 98765 43211</span></div>
                                <div class="info-item"><span class="info-label">Address</span><span class="info-value">456 Park Avenue, Mumbai, Maharashtra — 400002</span></div>
                            </div>
                        </div>

                        <!-- Academic Info -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-graduation-cap"></i></div><div class="section-title-text"><h3>Academic Details</h3></div></div></div>
                            <div class="info-grid">
                                <div class="info-item"><span class="info-label">Highest Qualification</span><span class="info-value">Bachelor's Degree (B.Com)</span></div>
                                <div class="info-item"><span class="info-label">University</span><span class="info-value">Mumbai University</span></div>
                                <div class="info-item"><span class="info-label">CGPA / Percentage</span><span class="info-value highlighted">8.2 CGPA (82%)</span></div>
                                <div class="info-item"><span class="info-label">Year of Passing</span><span class="info-value">2022</span></div>
                                <div class="info-item"><span class="info-label">Entrance Exam</span><span class="info-value">CAT 2024 — 92 Percentile</span></div>
                                <div class="info-item"><span class="info-label">Work Experience</span><span class="info-value">2 years — Finance Analyst at ABC Corp</span></div>
                            </div>
                        </div>

                        <!-- Documents -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-file-alt"></i></div><div class="section-title-text"><h3>Documents</h3><p>8 of 8 uploaded</p></div></div>
                                <a href="document-verification.html" class="btn btn-sm btn-primary"><i class="fas fa-check-double"></i> Verify All</a>
                            </div>
                            <div class="doc-grid">
                                <div class="doc-card"><div class="doc-icon verified"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">10th Marksheet</p><p class="doc-meta">PDF • 2.4 MB</p></div><div class="doc-status"><span class="doc-status-badge verified"><i class="fas fa-check-circle"></i> Verified</span></div></div>
                                <div class="doc-card"><div class="doc-icon verified"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">12th Marksheet</p><p class="doc-meta">PDF • 2.1 MB</p></div><div class="doc-status"><span class="doc-status-badge verified"><i class="fas fa-check-circle"></i> Verified</span></div></div>
                                <div class="doc-card"><div class="doc-icon verified"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">Graduation Certificate</p><p class="doc-meta">PDF • 3.2 MB</p></div><div class="doc-status"><span class="doc-status-badge verified"><i class="fas fa-check-circle"></i> Verified</span></div></div>
                                <div class="doc-card"><div class="doc-icon pending"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">CAT Scorecard</p><p class="doc-meta">PDF • 1.5 MB</p></div><div class="doc-status"><span class="doc-status-badge pending"><i class="fas fa-clock"></i> Pending</span></div></div>
                                <div class="doc-card"><div class="doc-icon pending"><i class="fas fa-file-image"></i></div><div class="doc-info"><p class="doc-name">Passport Photo</p><p class="doc-meta">JPG • 800 KB</p></div><div class="doc-status"><span class="doc-status-badge pending"><i class="fas fa-clock"></i> Pending</span></div></div>
                                <div class="doc-card"><div class="doc-icon verified"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">Aadhar Card</p><p class="doc-meta">PDF • 1.2 MB</p></div><div class="doc-status"><span class="doc-status-badge verified"><i class="fas fa-check-circle"></i> Verified</span></div></div>
                                <div class="doc-card"><div class="doc-icon pending"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">Experience Letter</p><p class="doc-meta">PDF • 1.8 MB</p></div><div class="doc-status"><span class="doc-status-badge pending"><i class="fas fa-clock"></i> Pending</span></div></div>
                                <div class="doc-card"><div class="doc-icon verified"><i class="fas fa-file-pdf"></i></div><div class="doc-info"><p class="doc-name">Transfer Certificate</p><p class="doc-meta">PDF • 1.6 MB</p></div><div class="doc-status"><span class="doc-status-badge verified"><i class="fas fa-check-circle"></i> Verified</span></div></div>
                            </div>

                            <!-- Approval Actions -->
                            <div class="approval-actions">
                                <button class="approval-btn verify" onclick="window.location.href='document-verification.html'"><i class="fas fa-file-check"></i> Verify Documents</button>
                                <button class="approval-btn approve"><i class="fas fa-check-circle"></i> Approve Application</button>
                                <button class="approval-btn reject"><i class="fas fa-times-circle"></i> Reject Application</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Fee Summary -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-rupee-sign"></i></div><div class="section-title-text"><h3>Fee Summary</h3></div></div></div>
                            <table class="fee-table">
                                <tr><td>Tuition Fee</td><td style="text-align:right">₹4,50,000</td></tr>
                                <tr><td>Registration Fee</td><td style="text-align:right">₹10,000</td></tr>
                                <tr><td>Library & Lab</td><td style="text-align:right">₹25,000</td></tr>
                                <tr><td>Exam Fee</td><td style="text-align:right">₹15,000</td></tr>
                                <tr><td style="color:var(--success)">Scholarship (-20%)</td><td style="text-align:right;color:var(--success)">-₹90,000</td></tr>
                                <tr><td style="color:var(--primary)">Total Payable</td><td style="text-align:right;color:var(--primary)">₹4,10,000</td></tr>
                            </table>
                            <div style="margin-top:var(--spacing-md);padding:var(--spacing-md);background:rgba(34,197,94,0.1);border-radius:var(--radius-lg);text-align:center">
                                <p style="font-size:12px;color:var(--success);font-weight:600;margin:0">PAYMENT STATUS</p>
                                <p style="font-size:16px;font-weight:700;color:var(--on-surface);margin:4px 0 0 0">₹0 / ₹4,10,000 Paid</p>
                            </div>
                        </div>

                        <!-- Activity Lifecycle Timeline -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-stream"></i></div>
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
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Inquiry Created</h6>
                                            <span class="badge bg-light text-dark border">Dec 1</span>
                                        </div>
                                        <p class="text-muted small mb-0">Web inquiry received for MBA</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-info text-white"><i class="fas fa-user-check"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Assigned to Sarah</h6>
                                            <span class="badge bg-light text-dark border">Dec 2</span>
                                        </div>
                                        <p class="text-muted small mb-0">Assigned to Sarah Patel</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-warning text-dark"><i class="fas fa-user-tie"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Counseling Completed</h6>
                                            <span class="badge bg-light text-dark border">Dec 3</span>
                                        </div>
                                        <p class="text-muted small mb-0">1-on-1 counseling completed</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-primary text-white"><i class="fas fa-phone-alt"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Follow-up Done</h6>
                                            <span class="badge bg-light text-dark border">Dec 5</span>
                                        </div>
                                        <p class="text-muted small mb-0">Fee structure call completed</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge text-white" style="background:#8b5cf6"><i class="fas fa-paper-plane"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Application Submitted</h6>
                                            <span class="badge bg-light text-dark border">Dec 7</span>
                                        </div>
                                        <p class="text-muted small mb-0">Application form submitted</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-secondary text-white"><i class="fas fa-check-double"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Documents Verified</h6>
                                            <span class="badge bg-light text-dark border">Dec 9</span>
                                        </div>
                                        <p class="text-muted small mb-0">Marksheets & ID proof verified</p>
                                    </div>
                                </div>
                                <div class="v-timeline-arrow"><i class="fas fa-arrow-down"></i></div>

                                <div class="v-timeline-item">
                                    <div class="v-timeline-badge bg-success text-white"><i class="fas fa-graduation-cap"></i></div>
                                    <div class="v-timeline-content">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <h6 class="fw-bold mb-0" style="font-size:13px">Admission Approved</h6>
                                            <span class="badge bg-success text-white">Dec 10</span>
                                        </div>
                                        <p class="text-muted small mb-0">Seat allocated & enrolled</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Activity Log -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-history"></i></div><div class="section-title-text"><h3>Activity Log</h3></div></div></div>
                            <div class="d-flex flex-column gap-3">
                                <div class="d-flex gap-2"><div style="width:8px;height:8px;border-radius:50%;background:var(--warning);margin-top:6px;flex-shrink:0"></div><div><p style="margin:0;font-size:13px;font-weight:600">Application moved to Under Review</p><p style="margin:0;font-size:11px;color:var(--on-surface-variant)">Dec 15, 2024 at 2:30 PM • Admin</p></div></div>
                                <div class="d-flex gap-2"><div style="width:8px;height:8px;border-radius:50%;background:var(--success);margin-top:6px;flex-shrink:0"></div><div><p style="margin:0;font-size:13px;font-weight:600">4 documents verified</p><p style="margin:0;font-size:11px;color:var(--on-surface-variant)">Dec 15, 2024 at 11:00 AM • Admin</p></div></div>
                                <div class="d-flex gap-2"><div style="width:8px;height:8px;border-radius:50%;background:var(--primary);margin-top:6px;flex-shrink:0"></div><div><p style="margin:0;font-size:13px;font-weight:600">All documents uploaded</p><p style="margin:0;font-size:11px;color:var(--on-surface-variant)">Dec 14, 2024 at 4:00 PM • Student</p></div></div>
                                <div class="d-flex gap-2"><div style="width:8px;height:8px;border-radius:50%;background:var(--primary);margin-top:6px;flex-shrink:0"></div><div><p style="margin:0;font-size:13px;font-weight:600">Application submitted</p><p style="margin:0;font-size:11px;color:var(--on-surface-variant)">Dec 14, 2024 at 2:30 PM • Student</p></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
