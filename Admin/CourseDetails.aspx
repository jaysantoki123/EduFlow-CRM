<%@ Page Title="Course Details"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="CourseDetails.aspx.cs"
    Inherits="EduCRM.CourseDetails" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

<style>

.course-details-page {
    width: 100%;
    min-height: calc(100vh - 60px);
    background: #f8fafc;
    padding: 18px 10px;
    font-family: 'Inter', Arial, sans-serif;
    color: #1e293b;
}

.course-details-page * {
    box-sizing: border-box;
}


/* ================= HEADER ================= */

.cd-page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
}

.cd-title h1 {
    margin: 0 0 3px 0;
    font-family: 'Montserrat', Arial, sans-serif;
    font-size: 21px;
    font-weight: 600;
    color: #172033;
}

.cd-title p {
    margin: 0;
    color: #64748b;
    font-size: 8px;
}

.cd-header-buttons {
    display: flex;
    gap: 5px;
}

.cd-btn {
    border: 1px solid #e2e8f0;
    background: #ffffff;
    color: #475569;
    border-radius: 5px;
    height: 26px;
    padding: 0 9px;
    font-size: 7px;
    cursor: pointer;
}

.cd-btn.primary {
    background: #4f46e5;
    color: #fff;
    border-color: #4f46e5;
}


/* ================= COURSE HERO ================= */

.cd-course-hero {
    background: linear-gradient(135deg, #4338ca, #2563eb);
    border-radius: 8px;
    padding: 13px;
    color: white;
    margin-bottom: 10px;
    position: relative;
    overflow: hidden;
}

.cd-course-code {
    display: inline-block;
    background: rgba(255,255,255,.18);
    border-radius: 8px;
    padding: 3px 7px;
    font-size: 6px;
    margin-bottom: 6px;
}

.cd-course-hero h2 {
    margin: 0 0 3px 0;
    font-size: 15px;
    font-weight: 600;
}

.cd-course-hero p {
    margin: 0 0 8px 0;
    font-size: 7px;
    opacity: .88;
}

.cd-hero-info {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    font-size: 6px;
}

.cd-hero-info span {
    display: flex;
    align-items: center;
    gap: 4px;
}

.cd-hero-status {
    position: absolute;
    right: 12px;
    top: 12px;
    display: flex;
    gap: 4px;
}

.cd-hero-status span {
    padding: 4px 7px;
    background: rgba(255,255,255,.17);
    border-radius: 5px;
    font-size: 6px;
}


/* ================= MAIN LAYOUT ================= */

.cd-layout {
    display: grid;
    grid-template-columns: minmax(0, 2fr) minmax(180px, .8fr);
    gap: 10px;
}


/* ================= CARDS ================= */

.cd-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 11px;
    margin-bottom: 10px;
}

.cd-card-title {
    display: flex;
    align-items: center;
    gap: 7px;
    padding-bottom: 7px;
    border-bottom: 1px solid #eef2f7;
    margin-bottom: 9px;
}

.cd-card-icon {
    width: 23px;
    height: 23px;
    border-radius: 6px;
    background: #eef2ff;
    color: #4f46e5;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 8px;
}

.cd-card-title h3 {
    margin: 0;
    font-size: 9px;
    font-weight: 600;
    color: #334155;
}

.cd-card-title p {
    margin: 2px 0 0 0;
    font-size: 6px;
    color: #94a3b8;
}


/* ================= OVERVIEW ================= */

.cd-overview {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
}

.cd-overview p {
    margin: 0;
    font-size: 7px;
    line-height: 12px;
    color: #64748b;
}


/* ================= STATISTICS ================= */

.cd-stats {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 6px;
}

.cd-stat {
    background: #f8fafc;
    border: 1px solid #eef2f7;
    border-radius: 6px;
    padding: 8px;
}

.cd-stat-label {
    color: #64748b;
    font-size: 5.5px;
    text-transform: uppercase;
    margin-bottom: 4px;
}

.cd-stat-value {
    font-size: 12px;
    font-weight: 600;
    color: #1e293b;
}


/* ================= SEMESTERS ================= */

.cd-semester {
    background: #f8faff;
    border: 1px solid #e5e9f8;
    border-radius: 6px;
    margin-bottom: 6px;
    overflow: hidden;
}

.cd-semester-header {
    padding: 7px 9px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #334155;
    font-size: 7px;
    font-weight: 600;
}

.cd-semester-header i {
    color: #64748b;
}

.cd-subjects {
    padding: 0 8px 7px 8px;
}

.cd-subject {
    background: #eef2ff;
    border-radius: 5px;
    padding: 6px 8px;
    margin-top: 4px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 6.5px;
    color: #475569;
}

.cd-credit {
    background: #ffffff;
    border: 1px solid #dbe3ff;
    border-radius: 7px;
    padding: 2px 5px;
    color: #4f46e5;
    font-size: 5px;
}


/* ================= FEE ================= */

.cd-fee-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 6px;
}

.cd-fee-item {
    display: flex;
    justify-content: space-between;
    padding: 6px 0;
    border-bottom: 1px solid #f1f5f9;
    font-size: 6.5px;
}

.cd-fee-item span:first-child {
    color: #64748b;
}

.cd-fee-item span:last-child {
    color: #334155;
    font-weight: 600;
}


/* ================= ELIGIBILITY ================= */

.cd-eligibility-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 7px;
}

.cd-input-like {
    border: 1px solid #e2e8f0;
    background: #f8fafc;
    border-radius: 5px;
    padding: 7px;
}

.cd-input-like label {
    display: block;
    font-size: 5.5px;
    color: #94a3b8;
    margin-bottom: 3px;
}

.cd-input-like span {
    font-size: 6.5px;
    color: #475569;
}


/* ================= RIGHT SIDE ================= */

.cd-right-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 10px;
}

.cd-right-title {
    display: flex;
    align-items: center;
    gap: 6px;
    border-bottom: 1px solid #eef2f7;
    padding-bottom: 7px;
    margin-bottom: 8px;
}

.cd-right-title i {
    color: #4f46e5;
    font-size: 8px;
}

.cd-right-title span {
    font-size: 7px;
    font-weight: 600;
    color: #334155;
}

.cd-right-row {
    display: flex;
    justify-content: space-between;
    padding: 6px 0;
    border-bottom: 1px solid #f1f5f9;
    font-size: 6px;
}

.cd-right-row span:first-child {
    color: #64748b;
}

.cd-right-row span:last-child {
    color: #334155;
    font-weight: 600;
}


/* ================= TAGS ================= */

.cd-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 4px;
}

.cd-tag {
    padding: 4px 6px;
    background: #eef2ff;
    color: #4f46e5;
    border-radius: 8px;
    font-size: 5.5px;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 850px) {

    .cd-layout {
        grid-template-columns: 1fr;
    }

    .cd-stats {
        grid-template-columns: repeat(2,1fr);
    }

}

@media(max-width: 600px) {

    .cd-page-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .cd-overview,
    .cd-fee-grid,
    .cd-eligibility-grid {
        grid-template-columns: 1fr;
    }

}

</style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="course-details-page">


    <!-- ================= PAGE HEADER ================= -->

    <div class="cd-page-header">

        <div class="cd-title">

            <h1>Course Details</h1>

            <p>
                View and manage complete course information
            </p>

        </div>

        <div class="cd-header-buttons">

            <button type="button" class="cd-btn">
                <i class="fas fa-arrow-left"></i>
                Back
            </button>

            <button type="button" class="cd-btn primary">
                <i class="fas fa-pen"></i>
                Edit
            </button>

        </div>

    </div>


    <!-- ================= COURSE HERO ================= -->

    <div class="cd-course-hero">

        <span class="cd-course-code">
            CSE-BTECH-001
        </span>

        <h2>
            B.Tech Computer Science & Engineering
        </h2>

        <p>
            Bachelor of Technology in Computer Science and Engineering
        </p>

        <div class="cd-hero-info">

            <span>
                <i class="fas fa-building"></i>
                Computer Engineering
            </span>

            <span>
                <i class="fas fa-clock"></i>
                4 Years
            </span>

            <span>
                <i class="fas fa-users"></i>
                120 Seats
            </span>

            <span>
                <i class="fas fa-indian-rupee-sign"></i>
                ₹3,80,000 / year
            </span>

        </div>

        <div class="cd-hero-status">

            <span>
                <i class="fas fa-check-circle"></i>
                Active
            </span>

            <span>
                <i class="fas fa-graduation-cap"></i>
                Full-Time
            </span>

        </div>

    </div>


    <!-- ================= MAIN CONTENT ================= -->

    <div class="cd-layout">


        <!-- ================= LEFT COLUMN ================= -->

        <div>


            <!-- OVERVIEW -->

            <div class="cd-card">

                <div class="cd-card-title">

                    <div class="cd-card-icon">
                        <i class="fas fa-align-left"></i>
                    </div>

                    <div>
                        <h3>Course Overview</h3>
                        <p>About this academic program</p>
                    </div>

                </div>


                <div class="cd-overview">

                    <p>
                        The Bachelor of Technology in Computer Science and
                        Engineering is a comprehensive undergraduate program
                        focused on programming, software development,
                        data structures, algorithms and computer systems.
                    </p>

                    <p>
                        Students develop practical and theoretical knowledge
                        in modern computing technologies, software engineering,
                        databases, networking, artificial intelligence and
                        web development.
                    </p>

                </div>

            </div>


            <!-- STATISTICS -->

            <div class="cd-card">

                <div class="cd-card-title">

                    <div class="cd-card-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>

                    <div>
                        <h3>Course Statistics</h3>
                        <p>Current course information</p>
                    </div>

                </div>


                <div class="cd-stats">

                    <div class="cd-stat">

                        <div class="cd-stat-label">
                            Total Students
                        </div>

                        <div class="cd-stat-value">
                            98
                        </div>

                    </div>

                    <div class="cd-stat">

                        <div class="cd-stat-label">
                            Total Seats
                        </div>

                        <div class="cd-stat-value">
                            120
                        </div>

                    </div>

                    <div class="cd-stat">

                        <div class="cd-stat-label">
                            Duration
                        </div>

                        <div class="cd-stat-value">
                            4 Years
                        </div>

                    </div>

                    <div class="cd-stat">

                        <div class="cd-stat-label">
                            Semesters
                        </div>

                        <div class="cd-stat-value">
                            8
                        </div>

                    </div>

                </div>

            </div>


            <!-- COURSE STRUCTURE -->

            <div class="cd-card">

                <div class="cd-card-title">

                    <div class="cd-card-icon">
                        <i class="fas fa-layer-group"></i>
                    </div>

                    <div>
                        <h3>Course Structure</h3>
                        <p>Subjects and semester details</p>
                    </div>

                </div>


                <!-- SEMESTER 1 -->

                <div class="cd-semester">

                    <div class="cd-semester-header">

                        <span>
                            Semester 1
                        </span>

                        <i class="fas fa-chevron-down"></i>

                    </div>

                    <div class="cd-subjects">

                        <div class="cd-subject">
                            Engineering Mathematics I
                            <span class="cd-credit">4 Credits</span>
                        </div>

                        <div class="cd-subject">
                            Programming Fundamentals
                            <span class="cd-credit">4 Credits</span>
                        </div>

                        <div class="cd-subject">
                            Physics for Engineers
                            <span class="cd-credit">3 Credits</span>
                        </div>

                        <div class="cd-subject">
                            Engineering Graphics
                            <span class="cd-credit">3 Credits</span>
                        </div>

                        <div class="cd-subject">
                            Professional Communication
                            <span class="cd-credit">2 Credits</span>
                        </div>

                    </div>

                </div>


                <!-- SEMESTER 2 -->

                <div class="cd-semester">

                    <div class="cd-semester-header">

                        <span>
                            Semester 2
                        </span>

                        <i class="fas fa-chevron-down"></i>

                    </div>

                </div>


                <!-- SEMESTER 3 -->

                <div class="cd-semester">

                    <div class="cd-semester-header">

                        <span>
                            Semester 3
                        </span>

                        <i class="fas fa-chevron-down"></i>

                    </div>

                </div>


                <!-- SEMESTER 4 -->

                <div class="cd-semester">

                    <div class="cd-semester-header">

                        <span>
                            Semester 4
                        </span>

                        <i class="fas fa-chevron-down"></i>

                    </div>

                </div>


                <!-- SEMESTER 5 -->

                <div class="cd-semester">

                    <div class="cd-semester-header">

                        <span>
                            Semester 5
                        </span>

                        <i class="fas fa-chevron-down"></i>

                    </div>

                </div>


            </div>


            <!-- FEE STRUCTURE -->

            <div class="cd-card">

                <div class="cd-card-title">

                    <div class="cd-card-icon">
                        <i class="fas fa-indian-rupee-sign"></i>
                    </div>

                    <div>
                        <h3>Fee Structure</h3>
                        <p>Course fee details</p>
                    </div>

                </div>


                <div class="cd-fee-grid">

                    <div class="cd-fee-item">
                        <span>Tuition Fee</span>
                        <span>₹3,20,000</span>
                    </div>

                    <div class="cd-fee-item">
                        <span>Development Fee</span>
                        <span>₹20,000</span>
                    </div>

                    <div class="cd-fee-item">
                        <span>Library Fee</span>
                        <span>₹10,000</span>
                    </div>

                    <div class="cd-fee-item">
                        <span>Exam Fee</span>
                        <span>₹5,000</span>
                    </div>

                    <div class="cd-fee-item">
                        <span>Other Charges</span>
                        <span>₹25,000</span>
                    </div>

                    <div class="cd-fee-item">
                        <span>Total Annual Fee</span>
                        <span>₹3,80,000</span>
                    </div>

                </div>

            </div>


            <!-- ELIGIBILITY -->

            <div class="cd-card">

                <div class="cd-card-title">

                    <div class="cd-card-icon">
                        <i class="fas fa-user-check"></i>
                    </div>

                    <div>
                        <h3>Eligibility & Requirements</h3>
                        <p>Admission requirements</p>
                    </div>

                </div>


                <div class="cd-eligibility-grid">

                    <div class="cd-input-like">

                        <label>
                            Minimum Qualification
                        </label>

                        <span>
                            12th Science
                        </span>

                    </div>

                    <div class="cd-input-like">

                        <label>
                            Minimum Percentage
                        </label>

                        <span>
                            60%
                        </span>

                    </div>

                    <div class="cd-input-like">

                        <label>
                            Entrance Exam Required
                        </label>

                        <span>
                            Yes
                        </span>

                    </div>

                    <div class="cd-input-like">

                        <label>
                            Admission Type
                        </label>

                        <span>
                            Merit / Entrance
                        </span>

                    </div>

                </div>

            </div>


        </div>


        <!-- ================= RIGHT COLUMN ================= -->

        <div>


            <!-- QUICK INFORMATION -->

            <div class="cd-right-card">

                <div class="cd-right-title">

                    <i class="fas fa-info-circle"></i>

                    <span>
                        Quick Information
                    </span>

                </div>


                <div class="cd-right-row">
                    <span>Course Type</span>
                    <span>UG</span>
                </div>

                <div class="cd-right-row">
                    <span>Level</span>
                    <span>Undergraduate</span>
                </div>

                <div class="cd-right-row">
                    <span>Duration</span>
                    <span>4 Years</span>
                </div>

                <div class="cd-right-row">
                    <span>Seats</span>
                    <span>120</span>
                </div>

                <div class="cd-right-row">
                    <span>Mode</span>
                    <span>Full-Time</span>
                </div>

                <div class="cd-right-row">
                    <span>Status</span>
                    <span style="color:#16a34a;">Active</span>
                </div>

            </div>


            <!-- COURSE CATEGORY -->

            <div class="cd-right-card">

                <div class="cd-right-title">

                    <i class="fas fa-tags"></i>

                    <span>
                        Course Categories
                    </span>

                </div>


                <div class="cd-tags">

                    <span class="cd-tag">
                        Engineering
                    </span>

                    <span class="cd-tag">
                        Computer
                    </span>

                    <span class="cd-tag">
                        Technology
                    </span>

                    <span class="cd-tag">
                        Full-Time
                    </span>

                </div>

            </div>


            <!-- CONTACT -->

            <div class="cd-right-card">

                <div class="cd-right-title">

                    <i class="fas fa-headset"></i>

                    <span>
                        Course Coordinator
                    </span>

                </div>


                <div class="cd-right-row">
                    <span>Name</span>
                    <span>Dr. Rahul Mehta</span>
                </div>

                <div class="cd-right-row">
                    <span>Department</span>
                    <span>Computer Engineering</span>
                </div>

                <div class="cd-right-row">
                    <span>Email</span>
                    <span>cse@educrm.com</span>
                </div>

            </div>


        </div>

    </div>

</div>

</asp:Content>