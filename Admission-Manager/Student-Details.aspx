<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student-Details.aspx.cs" Inherits="EduFlow.Admission_Manager.Student_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Student Details - EduFlow
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
       <style>
        .detail-header { background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%); border-radius: var(--radius-xl); padding: var(--spacing-xl); margin-bottom: var(--spacing-lg); color: white; }
        .detail-header-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: var(--spacing-lg); flex-wrap: wrap; gap: var(--spacing-md); }
        .header-badge { background: rgba(255,255,255,0.2); padding: 6px 16px; border-radius: var(--radius-full); font-size: 13px; font-weight: 600; display: inline-flex; align-items: center; gap: 6px; }
        .header-actions { display: flex; gap: var(--spacing-sm); }
        .header-btn { background: rgba(255,255,255,0.2); border: 1px solid rgba(255,255,255,0.3); color: white; padding: 8px 16px; border-radius: var(--radius-md); font-size: 14px; font-weight: 500; cursor: pointer; transition: all 0.2s ease; display: flex; align-items: center; gap: 6px; }
        .header-btn:hover { background: rgba(255,255,255,0.3); }

        .header-body { display: grid; grid-template-columns: auto 1fr auto; gap: var(--spacing-xl); align-items: center; }
        .header-avatar { width: 80px; height: 80px; border-radius: var(--radius-full); background: rgba(255,255,255,0.2); border: 3px solid rgba(255,255,255,0.3); display: flex; align-items: center; justify-content: center; font-size: 32px; font-weight: 700; }
        .header-name { font-size: 28px; font-weight: 700; margin: 0 0 4px 0; }
        .header-sub { font-size: 14px; opacity: 0.9; margin: 0; }
        .header-status { padding: 8px 20px; background: rgba(34,197,94,0.3); border-radius: var(--radius-full); font-size: 14px; font-weight: 600; display: flex; align-items: center; gap: 8px; }

        .detail-section { background: rgba(255,255,255,0.8); backdrop-filter: blur(12px); border-radius: var(--radius-xl); border: 1px solid var(--border-subtle); padding: var(--spacing-xl); margin-bottom: var(--spacing-lg); }
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

        /* Fee Table */
        .fee-table { width: 100%; border-collapse: collapse; }
        .fee-table th { padding: 12px 16px; text-align: left; font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; border-bottom: 2px solid var(--border-subtle); background: var(--surface-container-low); }
        .fee-table td { padding: 12px 16px; border-bottom: 1px solid var(--border-subtle); font-size: 14px; }
        .fee-table tbody tr:last-child td { border-bottom: none; }

        /* Semester Cards */
        .semester-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: var(--spacing-md); }
        .semester-card { background: var(--surface-container-low); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: var(--spacing-lg); transition: all 0.2s ease; }
        .semester-card:hover { border-color: var(--primary); box-shadow: var(--shadow-md); }
        .semester-card-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: var(--spacing-md); }
        .semester-name { font-size: 16px; font-weight: 600; color: var(--on-surface); margin: 0; }
        .semester-result { font-size: 24px; font-weight: 700; margin: 0; }
        .semester-subjects { display: flex; flex-direction: column; gap: var(--spacing-sm); }
        .subject-row { display: flex; justify-content: space-between; align-items: center; padding: 6px 0; border-bottom: 1px dashed var(--border-subtle); font-size: 13px; }
        .subject-row:last-child { border-bottom: none; }

        /* Document Grid */
        .doc-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: var(--spacing-md); }
        .doc-card { background: var(--surface-container-low); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: var(--spacing-md); display: flex; gap: var(--spacing-sm); align-items: center; cursor: pointer; transition: all 0.2s ease; }
        .doc-card:hover { border-color: var(--primary); transform: translateY(-2px); }
        .doc-icon { width: 40px; height: 40px; border-radius: var(--radius-lg); display: flex; align-items: center; justify-content: center; font-size: 18px; flex-shrink: 0; }
        .doc-icon.pdf { background: rgba(239,68,68,0.1); color: var(--danger); }
        .doc-icon.img { background: rgba(0,81,213,0.1); color: var(--info); }
        .doc-name { font-size: 13px; font-weight: 600; color: var(--on-surface); margin: 0; }
        .doc-meta { font-size: 11px; color: var(--on-surface-variant); margin: 0; }

        /* Vertical Activity Timeline Styles */
        .v-timeline { position: relative; padding: 4px 0; }
        .v-timeline-item { display: flex; gap: 14px; align-items: flex-start; background: var(--surface-container-low); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 12px 14px; transition: all 0.2s ease; }
        .v-timeline-item:hover { box-shadow: var(--shadow-sm); border-color: var(--primary); }
        .v-timeline-badge { width: 36px; height: 36px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 15px; flex-shrink: 0; }
        .v-timeline-content { flex: 1; }
        .v-timeline-arrow { text-align: center; color: var(--primary); font-size: 13px; margin: 4px 0; opacity: 0.75; }

        @media (max-width: 768px) {
            .header-body { grid-template-columns: 1fr; text-align: center; justify-items: center; }
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
                <div class="mb-3"><a href="student-profile.html" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Profile</a></div>

                <!-- Header -->
                <div class="detail-header">
                    <div class="detail-header-top">
                        <div class="d-flex gap-2"><span class="header-badge"><i class="fas fa-hashtag"></i> STU-2024-0347</span><span class="header-badge"><i class="fas fa-book"></i> MBA Finance</span></div>
                        <div class="header-actions"><button class="header-btn"><i class="fas fa-edit"></i> Edit</button><button class="header-btn"><i class="fas fa-print"></i> Print</button><button class="header-btn"><i class="fas fa-download"></i> Export</button></div>
                    </div>
                    <div class="header-body">
                        <div class="header-avatar">PS</div>
                        <div><h1 class="header-name">Priya Sharma</h1><p class="header-sub"><i class="fas fa-envelope"></i> priya.sharma@email.com &nbsp;|&nbsp; <i class="fas fa-phone"></i> +91 98765 43211</p><p class="header-sub"><i class="fas fa-calendar"></i> Batch 2024-2025 &nbsp;|&nbsp; <i class="fas fa-map-marker-alt"></i> Mumbai, Maharashtra</p></div>
                        <div class="header-status"><i class="fas fa-check-circle"></i> Active Student</div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-lg-8">
                        <!-- Personal Details -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-user"></i></div><div class="section-title-text"><h3>Personal Details</h3><p>Complete student information</p></div></div></div>
                            <div class="info-grid">
                                <div class="info-item"><span class="info-label">Full Name</span><span class="info-value">Priya Sharma</span></div>
                                <div class="info-item"><span class="info-label">Date of Birth</span><span class="info-value">August 22, 1999 (Age: 25)</span></div>
                                <div class="info-item"><span class="info-label">Gender</span><span class="info-value">Female</span></div>
                                <div class="info-item"><span class="info-label">Blood Group</span><span class="info-value">B+</span></div>
                                <div class="info-item"><span class="info-label">Nationality</span><span class="info-value">Indian</span></div>
                                <div class="info-item"><span class="info-label">Aadhar Number</span><span class="info-value">XXXX XXXX 4567</span></div>
                                <div class="info-item"><span class="info-label">Father's Name</span><span class="info-value">Ramesh Sharma</span></div>
                                <div class="info-item"><span class="info-label">Mother's Name</span><span class="info-value">Sunita Sharma</span></div>
                                <div class="info-item"><span class="info-label">Guardian Phone</span><span class="info-value highlighted">+91 98765 00100</span></div>
                                <div class="info-item" style="grid-column:1/-1"><span class="info-label">Permanent Address</span><span class="info-value">456 Park Avenue, Andheri West, Mumbai, Maharashtra — 400002</span></div>
                            </div>
                        </div>

                        <!-- Academic Records -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-graduation-cap"></i></div><div class="section-title-text"><h3>Academic Records</h3><p>Semester-wise performance</p></div></div></div>
                            <div class="semester-grid">
                                <div class="semester-card">
                                    <div class="semester-card-header"><p class="semester-name">Semester 1</p><p class="semester-result" style="color:var(--primary)">82%</p></div>
                                    <div class="semester-subjects">
                                        <div class="subject-row"><span>Financial Accounting</span><span style="font-weight:600">85</span></div>
                                        <div class="subject-row"><span>Business Economics</span><span style="font-weight:600">78</span></div>
                                        <div class="subject-row"><span>Quantitative Methods</span><span style="font-weight:600">80</span></div>
                                        <div class="subject-row"><span>Organizational Behavior</span><span style="font-weight:600">88</span></div>
                                        <div class="subject-row"><span>Marketing Management</span><span style="font-weight:600">79</span></div>
                                    </div>
                                </div>
                                <div class="semester-card">
                                    <div class="semester-card-header"><p class="semester-name">Semester 2</p><p class="semester-result" style="color:var(--warning)">Ongoing</p></div>
                                    <div class="semester-subjects">
                                        <div class="subject-row"><span>Corporate Finance</span><span style="color:var(--on-surface-variant)">—</span></div>
                                        <div class="subject-row"><span>Investment Banking</span><span style="color:var(--on-surface-variant)">—</span></div>
                                        <div class="subject-row"><span>Risk Management</span><span style="color:var(--on-surface-variant)">—</span></div>
                                        <div class="subject-row"><span>Financial Markets</span><span style="color:var(--on-surface-variant)">—</span></div>
                                        <div class="subject-row"><span>Business Analytics</span><span style="color:var(--on-surface-variant)">—</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Documents -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-file-alt"></i></div><div class="section-title-text"><h3>Documents</h3></div></div></div>
                            <div class="doc-grid">
                                <div class="doc-card"><div class="doc-icon pdf"><i class="fas fa-file-pdf"></i></div><div><p class="doc-name">10th Marksheet</p><p class="doc-meta">PDF • 2.4 MB</p></div></div>
                                <div class="doc-card"><div class="doc-icon pdf"><i class="fas fa-file-pdf"></i></div><div><p class="doc-name">12th Marksheet</p><p class="doc-meta">PDF • 2.1 MB</p></div></div>
                                <div class="doc-card"><div class="doc-icon pdf"><i class="fas fa-file-pdf"></i></div><div><p class="doc-name">Graduation Certificate</p><p class="doc-meta">PDF • 3.2 MB</p></div></div>
                                <div class="doc-card"><div class="doc-icon pdf"><i class="fas fa-file-pdf"></i></div><div><p class="doc-name">CAT Scorecard</p><p class="doc-meta">PDF • 1.5 MB</p></div></div>
                                <div class="doc-card"><div class="doc-icon img"><i class="fas fa-file-image"></i></div><div><p class="doc-name">Passport Photo</p><p class="doc-meta">JPG • 800 KB</p></div></div>
                                <div class="doc-card"><div class="doc-icon pdf"><i class="fas fa-file-pdf"></i></div><div><p class="doc-name">Aadhar Card</p><p class="doc-meta">PDF • 1.2 MB</p></div></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Enrollment Info -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-id-card"></i></div><div class="section-title-text"><h3>Enrollment</h3></div></div></div>
                            <div class="d-flex flex-column gap-3">
                                <div class="info-item"><span class="info-label">Enrollment No.</span><span class="info-value highlighted">NITM/MBA/2024/0347</span></div>
                                <div class="info-item"><span class="info-label">Application ID</span><span class="info-value highlighted">#APP-2024-0090</span></div>
                                <div class="info-item"><span class="info-label">Admission Date</span><span class="info-value">Jan 15, 2024</span></div>
                                <div class="info-item"><span class="info-label">Category</span><span class="info-value">General Merit</span></div>
                                <div class="info-item"><span class="info-label">Scholarship</span><span class="info-value" style="color:var(--success)">Merit — 20%</span></div>
                                <div class="info-item"><span class="info-label">Source</span><span class="info-value">Counselor Referral</span></div>
                            </div>
                        </div>

                        <!-- Fee Details -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-rupee-sign"></i></div><div class="section-title-text"><h3>Fee Details</h3></div></div></div>
                            <table class="fee-table">
                                <thead><tr><th>Description</th><th style="text-align:right">Amount</th></tr></thead>
                                <tbody>
                                    <tr><td>Tuition Fee</td><td style="text-align:right">₹4,50,000</td></tr>
                                    <tr><td>Registration</td><td style="text-align:right">₹10,000</td></tr>
                                    <tr><td>Other Charges</td><td style="text-align:right">₹40,000</td></tr>
                                    <tr><td style="color:var(--success)">Scholarship</td><td style="text-align:right;color:var(--success)">-₹90,000</td></tr>
                                    <tr style="font-weight:700"><td>Net Fee</td><td style="text-align:right">₹4,10,000</td></tr>
                                </tbody>
                            </table>
                            <div style="margin-top:var(--spacing-md);padding:var(--spacing-md);background:rgba(34,197,94,0.1);border-radius:var(--radius-lg);display:flex;justify-content:space-between;align-items:center">
                                <div><p style="font-size:12px;color:var(--success);font-weight:600;margin:0">PAID</p><p style="font-size:18px;font-weight:700;margin:0">₹4,10,000</p></div>
                                <div><p style="font-size:12px;color:var(--on-surface-variant);font-weight:600;margin:0">BALANCE</p><p style="font-size:18px;font-weight:700;margin:0;color:var(--success)">₹0</p></div>
                            </div>
                        </div>

                        <!-- Activity Lifecycle Timeline -->
                        <div class="detail-section">
                            <div class="section-header">
                                <div class="section-title-icon">
                                    <div class="section-icon-circle"><i class="fas fa-stream"></i></div>
                                    <div class="section-title-text">
                                        <h3>Activity Timeline</h3>
                                        <p>Admission & lifecycle history</p>
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

                        <!-- Attendance -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-calendar-check"></i></div><div class="section-title-text"><h3>Attendance</h3></div></div></div>
                            <div class="chart-container" style="height:200px"><canvas id="attendanceChart"></canvas></div>
                            <div class="d-flex justify-content-between mt-3" style="font-size:13px">
                                <div><span style="color:var(--success);font-weight:600">Present: 110</span></div>
                                <div><span style="color:var(--danger);font-weight:600">Absent: 10</span></div>
                                <div><span style="color:var(--primary);font-weight:600">Total: 120 days</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
