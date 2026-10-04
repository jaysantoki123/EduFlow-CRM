<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="EduFlow.Admin.CourseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .course-header {
            background: linear-gradient(135deg,var(--primary) 0%,var(--secondary) 100%);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            color: white;
            position: relative;
            overflow: hidden
        }

            .course-header::after {
                content: '';
                position: absolute;
                right: -40px;
                bottom: -40px;
                width: 200px;
                height: 200px;
                background: radial-gradient(circle,rgba(255,255,255,.08) 0%,transparent 70%);
                border-radius: 50%
            }

        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-lg);
            flex-wrap: wrap;
            gap: var(--spacing-md)
        }

        .header-badges {
            display: flex;
            gap: var(--spacing-sm);
            flex-wrap: wrap
        }

        .header-badge {
            background: rgba(255,255,255,.2);
            padding: 6px 16px;
            border-radius: var(--radius-full);
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px
        }

        .header-actions {
            display: flex;
            gap: var(--spacing-sm)
        }

        .header-btn {
            background: rgba(255,255,255,.2);
            border: 1px solid rgba(255,255,255,.3);
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all .2s;
            display: flex;
            align-items: center;
            gap: 6px
        }

            .header-btn:hover {
                background: rgba(255,255,255,.3)
            }

        .course-name {
            font-size: 32px;
            font-weight: 700;
            margin: 0 0 8px
        }

        .course-code-large {
            font-size: 14px;
            opacity: .8;
            margin: 0 0 16px
        }

        .course-header-meta {
            display: flex;
            gap: var(--spacing-xl);
            flex-wrap: wrap
        }

        .header-meta-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            opacity: .9
        }

        .detail-section {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg)
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle)
        }

        .section-title-icon {
            display: flex;
            align-items: center;
            gap: 12px
        }

        .section-icon-circle {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg,rgba(79,70,229,.1),rgba(0,81,213,.1));
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px
        }

        .section-title-text h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0
        }

        .section-title-text p {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(220px,1fr));
            gap: var(--spacing-lg)
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 6px
        }

        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: .05em
        }

        .info-value {
            font-size: 15px;
            font-weight: 500;
            color: var(--on-surface)
        }

            .info-value.highlighted {
                color: var(--primary);
                font-weight: 600
            }

        /* Semester Accordion */
        .semester-accordion {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm)
        }

        .semester-panel {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            overflow: hidden
        }

        .semester-toggle {
            width: 100%;
            padding: var(--spacing-md) var(--spacing-lg);
            border: none;
            background: transparent;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            color: var(--on-surface);
            transition: all .2s
        }

            .semester-toggle:hover {
                background: var(--surface-container)
            }

            .semester-toggle i {
                transition: transform .3s
            }

        .semester-panel.open .semester-toggle i {
            transform: rotate(180deg)
        }

        .semester-content {
            display: none;
            padding: 0 var(--spacing-lg) var(--spacing-lg)
        }

        .semester-panel.open .semester-content {
            display: block
        }

        .subject-list {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm)
        }

        .subject-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 12px;
            background: white;
            border-radius: var(--radius-md);
            font-size: 14px
        }

        .subject-credits {
            font-size: 12px;
            font-weight: 600;
            color: var(--primary);
            background: rgba(79,70,229,.1);
            padding: 2px 10px;
            border-radius: var(--radius-full)
        }

        /* Fee Table */
        .fee-table {
            width: 100%;
            border-collapse: collapse
        }

            .fee-table td {
                padding: 12px 0;
                border-bottom: 1px solid var(--border-subtle);
                font-size: 14px
            }

            .fee-table tr:last-child td {
                border-bottom: none;
                font-weight: 700;
                font-size: 16px;
                padding-top: var(--spacing-md)
            }

        /* Student List Mini */
        .enrolled-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px
        }

        .enrolled-avatar {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg,var(--primary),var(--secondary));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all .2s
        }

            .enrolled-avatar:hover {
                transform: scale(1.1)
            }

        .enrolled-more {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-full);
            background: var(--surface-container);
            color: var(--on-surface-variant);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer
        }

        .chart-container {
            position: relative;
            height: 250px
        }

        @media(max-width:768px) {
            .course-name {
                font-size: 24px
            }

            .header-top {
                flex-direction: column
            }

            .course-header-meta {
                flex-direction: column;
                gap: var(--spacing-sm)
            }
        }

        @media (max-width: 768px) {
            .calendar-layout {
                grid-template-columns: 1fr !important;
            }

            .search-box {
                width: 100% !important;
            }

            .filter-group {
                min-width: auto !important;
                width: 100% !important;
            }

            .table-container, .user-table-card, .inquiry-table-card, .counseling-table-card,
            .followup-table-card, .student-table-card, .application-table-card {
                overflow-x: auto !important;
                -webkit-overflow-scrolling: touch;
            }

            .table, .user-table, .matrix-table {
                min-width: 550px !important;
            }

            .matrix-table {
                min-width: 800px !important;
            }

            .card-header {
                flex-wrap: wrap !important;
                gap: 8px !important;
            }

            .table-header {
                flex-direction: column !important;
                align-items: flex-start !important;
            }

            .table-actions {
                width: 100% !important;
                flex-wrap: wrap !important;
            }

            .table-footer {
                flex-direction: column !important;
                gap: 12px !important;
                align-items: flex-start !important;
            }

            .permissions-detail-layout {
                grid-template-columns: 1fr !important;
            }

            .role-cards-grid {
                grid-template-columns: 1fr 1fr !important;
            }
        }

        @media (max-width: 576px) {
            .filter-row {
                grid-template-columns: 1fr !important;
            }

            .role-cards-grid {
                grid-template-columns: 1fr !important;
            }

            .quick-action-grid {
                grid-template-columns: repeat(2, 1fr) !important;
            }

            .users-grid {
                grid-template-columns: 1fr !important;
            }

            .form-actions {
                flex-direction: column !important;
            }

                .form-actions .btn {
                    width: 100% !important;
                    justify-content: center !important;
                }

            .stats-grid-4 {
                grid-template-columns: 1fr 1fr !important;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <header class="topbar"><div class="topbar-left"><button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button></div><div class="topbar-right"><button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button><button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button></div></header>

            <div class="content-area">
                <div class="mb-3"><a href="course-list.html" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i> Back to Courses</a></div>

                <!-- Course Header -->
                <div class="course-header">
                    <div class="header-top">
                        <div class="header-badges"><span class="header-badge"><i class="fas fa-hashtag"></i> CSE-BTECH-001</span><span class="header-badge" style="background:rgba(34,197,94,.3)"><i class="fas fa-check-circle"></i> Active</span><span class="header-badge"><i class="fas fa-award"></i> AICTE Approved</span></div>
                        <div class="header-actions"><button class="header-btn" onclick="window.location.href='add-course.html?edit=1'"><i class="fas fa-edit"></i> Edit</button><button class="header-btn"><i class="fas fa-print"></i> Print</button></div>
                    </div>
                    <h1 class="course-name">B.Tech Computer Science & Engineering</h1>
                    <p class="course-code-large">Department of Engineering • Undergraduate Program</p>
                    <div class="course-header-meta">
                        <div class="header-meta-item"><i class="far fa-clock"></i> 4 Years (8 Semesters)</div>
                        <div class="header-meta-item"><i class="fas fa-chair"></i> 120 Seats</div>
                        <div class="header-meta-item"><i class="fas fa-users"></i> 98 Enrolled</div>
                        <div class="header-meta-item"><i class="fas fa-rupee-sign"></i> ₹3,80,000/year</div>
                        <div class="header-meta-item"><i class="fas fa-laptop"></i> Full-Time</div>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-lg-8">
                        <!-- About -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-info-circle"></i></div><div class="section-title-text"><h3>About This Course</h3></div></div></div>
                            <p style="font-size:15px;line-height:1.8;color:var(--on-surface-variant);margin:0">The B.Tech in Computer Science and Engineering is a comprehensive 4-year undergraduate program designed to equip students with strong foundations in programming, data structures, algorithms, artificial intelligence, machine learning, and software engineering. The curriculum is industry-aligned and includes hands-on labs, projects, internships, and industry collaborations. Graduates are well-prepared for careers in software development, data science, AI research, and technology leadership.</p>
                        </div>

                        <!-- Curriculum -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-book-open"></i></div><div class="section-title-text"><h3>Curriculum</h3><p>Semester-wise course structure</p></div></div></div>
                            <div class="semester-accordion">
                                <div class="semester-panel open">
                                    <button class="semester-toggle" onclick="this.parentElement.classList.toggle('open')"><span><i class="fas fa-layer-group" style="color:var(--primary);margin-right:8px"></i> Semester 1</span><i class="fas fa-chevron-down"></i></button>
                                    <div class="semester-content">
                                        <div class="subject-list">
                                            <div class="subject-item"><span>Engineering Mathematics I</span><span class="subject-credits">4 Credits</span></div>
                                            <div class="subject-item"><span>Programming in C</span><span class="subject-credits">4 Credits</span></div>
                                            <div class="subject-item"><span>Physics for Engineers</span><span class="subject-credits">3 Credits</span></div>
                                            <div class="subject-item"><span>Environmental Science</span><span class="subject-credits">2 Credits</span></div>
                                            <div class="subject-item"><span>Communication Skills</span><span class="subject-credits">2 Credits</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="semester-panel">
                                    <button class="semester-toggle" onclick="this.parentElement.classList.toggle('open')"><span><i class="fas fa-layer-group" style="color:var(--primary);margin-right:8px"></i> Semester 2</span><i class="fas fa-chevron-down"></i></button>
                                    <div class="semester-content"><div class="subject-list"><div class="subject-item"><span>Data Structures</span><span class="subject-credits">4 Credits</span></div><div class="subject-item"><span>Engineering Mathematics II</span><span class="subject-credits">4 Credits</span></div><div class="subject-item"><span>Digital Electronics</span><span class="subject-credits">3 Credits</span></div><div class="subject-item"><span>OOP with Java</span><span class="subject-credits">4 Credits</span></div></div></div>
                                </div>
                                <div class="semester-panel">
                                    <button class="semester-toggle" onclick="this.parentElement.classList.toggle('open')"><span><i class="fas fa-layer-group" style="color:var(--primary);margin-right:8px"></i> Semester 3</span><i class="fas fa-chevron-down"></i></button>
                                    <div class="semester-content"><div class="subject-list"><div class="subject-item"><span>Algorithms</span><span class="subject-credits">4 Credits</span></div><div class="subject-item"><span>Database Systems</span><span class="subject-credits">4 Credits</span></div><div class="subject-item"><span>Operating Systems</span><span class="subject-credits">4 Credits</span></div><div class="subject-item"><span>Computer Networks</span><span class="subject-credits">3 Credits</span></div></div></div>
                                </div>
                                <div class="semester-panel">
                                    <button class="semester-toggle" onclick="this.parentElement.classList.toggle('open')"><span><i class="fas fa-layer-group" style="color:var(--primary);margin-right:8px"></i> Semester 4-8</span><i class="fas fa-chevron-down"></i></button>
                                    <div class="semester-content"><p style="font-size:14px;color:var(--on-surface-variant)">Advanced topics including AI/ML, Cloud Computing, Cybersecurity, Software Engineering, Capstone Project, and Industry Internship.</p></div>
                                </div>
                            </div>
                        </div>

                        <!-- Eligibility -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-list-check"></i></div><div class="section-title-text"><h3>Eligibility & Requirements</h3></div></div></div>
                            <div class="info-grid">
                                <div class="info-item"><span class="info-label">Minimum Qualification</span><span class="info-value">12th Standard (Science)</span></div>
                                <div class="info-item"><span class="info-label">Minimum Marks</span><span class="info-value highlighted">60% aggregate</span></div>
                                <div class="info-item"><span class="info-label">Mandatory Subjects</span><span class="info-value">Physics & Mathematics</span></div>
                                <div class="info-item"><span class="info-label">Entrance Exam</span><span class="info-value highlighted">JEE Main / Internal Exam</span></div>
                                <div class="info-item"><span class="info-label">Age Limit</span><span class="info-value">No upper limit</span></div>
                                <div class="info-item"><span class="info-label">Lateral Entry</span><span class="info-value">Available (Diploma holders)</span></div>
                            </div>
                        </div>

                        <!-- Enrollment Trend -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-chart-line"></i></div><div class="section-title-text"><h3>Enrollment Trends</h3></div></div></div>
                            <div class="chart-container"><canvas id="enrollmentChart"></canvas></div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Fee Structure -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-rupee-sign"></i></div><div class="section-title-text"><h3>Fee Structure</h3></div></div></div>
                            <table class="fee-table">
                                <tr><td>Tuition Fee</td><td style="text-align:right">₹3,80,000</td></tr>
                                <tr><td>Registration</td><td style="text-align:right">₹10,000</td></tr>
                                <tr><td>Lab & Library</td><td style="text-align:right">₹25,000</td></tr>
                                <tr><td>Exam Fee</td><td style="text-align:right">₹15,000</td></tr>
                                <tr><td style="color:var(--primary)">Total / Year</td><td style="text-align:right;color:var(--primary)">₹4,30,000</td></tr>
                            </table>
                            <div style="margin-top:var(--spacing-md);padding:var(--spacing-md);background:rgba(79,70,229,.05);border-radius:var(--radius-lg)">
                                <p style="font-size:12px;font-weight:600;color:var(--primary);margin:0 0 4px">SCHOLARSHIPS AVAILABLE</p>
                                <p style="font-size:13px;color:var(--on-surface-variant);margin:0">Merit-based (up to 50%), Sports, Need-based</p>
                            </div>
                        </div>

                        <!-- Quick Stats -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-chart-bar"></i></div><div class="section-title-text"><h3>Statistics</h3></div></div></div>
                            <div class="d-flex flex-column gap-3">
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Total Seats</span><span style="font-size:14px;font-weight:600">120</span></div>
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Enrolled</span><span style="font-size:14px;font-weight:600;color:var(--success)">98 (81.7%)</span></div>
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Available</span><span style="font-size:14px;font-weight:600;color:var(--warning)">22</span></div>
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Avg Marks</span><span style="font-size:14px;font-weight:600;color:var(--primary)">78.5%</span></div>
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Placement Rate</span><span style="font-size:14px;font-weight:600;color:var(--success)">92%</span></div>
                                <div class="d-flex justify-content-between"><span style="font-size:14px;color:var(--on-surface-variant)">Avg Package</span><span style="font-size:14px;font-weight:600;color:var(--primary)">₹8.5 LPA</span></div>
                            </div>
                        </div>

                        <!-- Enrolled Students -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon-circle"><i class="fas fa-users"></i></div><div class="section-title-text"><h3>Enrolled Students</h3><p>98 students</p></div></div><a href="student-list.html" class="btn btn-sm btn-secondary">View All</a></div>
                            <div class="enrolled-list">
                                <div class="enrolled-avatar" title="Rajesh K.">RK</div>
                                <div class="enrolled-avatar" title="Vikram K.">VK</div>
                                <div class="enrolled-avatar" title="Meena J.">MJ</div>
                                <div class="enrolled-avatar" title="Karan M.">KM</div>
                                <div class="enrolled-avatar" title="Nikhil K.">NK</div>
                                <div class="enrolled-avatar" title="Arjun S.">AS</div>
                                <div class="enrolled-avatar" title="Deepak P.">DP</div>
                                <div class="enrolled-avatar" title="Suresh K.">SK</div>
                                <div class="enrolled-more">+90</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

     <script>
        document.getElementById('sidebarToggle').addEventListener('click',function(){document.getElementById('sidebar').classList.toggle('collapsed');document.getElementById('mainContent').classList.toggle('sidebar-collapsed')});

        const ctx=document.getElementById('enrollmentChart').getContext('2d');
        const grad=ctx.createLinearGradient(0,0,0,250);grad.addColorStop(0,'rgba(79,70,229,.2)');grad.addColorStop(1,'rgba(79,70,229,0)');
        new Chart(ctx,{type:'line',data:{labels:['2019','2020','2021','2022','2023','2024'],datasets:[{label:'Enrolled',data:[65,72,80,88,95,98],borderColor:'#4f46e5',backgroundColor:grad,borderWidth:2,fill:true,tension:.4,pointRadius:5,pointBackgroundColor:'#4f46e5'},{label:'Seats',data:[120,120,120,120,120,120],borderColor:'#E2E8F0',borderWidth:2,borderDash:[8,4],fill:false,tension:0,pointRadius:0}]},options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{position:'top'}},scales:{y:{beginAtZero:true,max:140,grid:{color:'rgba(0,0,0,.05)'}},x:{grid:{display:false}}}}});
     </script>
</asp:Content>
