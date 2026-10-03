<%@ Page Title="Course Management"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Courses.aspx.cs"
    Inherits="EduCRM.Courses" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           COURSE MANAGEMENT
           ===================================================== */

        .courses-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            padding: 20px 10px;
            background: #F8FAFC;
            font-family: 'Inter', Arial, sans-serif;
            color: #1E293B;
            box-sizing: border-box;
        }

        .courses-page *,
        .courses-page *::before,
        .courses-page *::after {
            box-sizing: border-box;
        }


        /* ================= HEADER ================= */

        .courses-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .courses-title h1 {
            margin: 0 0 4px 0;
            font-family: 'Montserrat', Arial, sans-serif;
            font-size: 23px;
            font-weight: 600;
            color: #172033;
        }

        .courses-title p {
            margin: 0;
            color: #64748B;
            font-size: 9px;
        }


        /* ================= HEADER BUTTONS ================= */

        .course-header-actions {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .course-view-btn {
            height: 25px;
            padding: 0 10px;
            border: none;
            border-radius: 14px;
            background: #EEF2FF;
            color: #64748B;
            font-size: 8px;
            cursor: pointer;
            font-family: 'Inter', Arial, sans-serif;
            transition: all 0.2s ease;
        }

        .course-view-btn:hover {
            background: #E0E7FF;
            color: #4F46E5;
            transform: translateY(-2px);
        }

        .course-view-btn.active {
            background: #4F46E5;
            color: #FFFFFF;
        }

        .course-view-btn i {
            margin-right: 4px;
        }

        .add-course-btn {
            height: 27px;
            padding: 0 12px;
            border: none;
            border-radius: 5px;
            background: #4F46E5;
            color: #FFFFFF;
            font-size: 8px;
            cursor: pointer;
            font-family: 'Inter', Arial, sans-serif;
            box-shadow: 0 2px 5px rgba(79,70,229,.18);
            transition: all 0.2s ease;
        }

        .add-course-btn:hover {
            background: #4338CA;
            color: #FFFFFF;
            transform: translateY(-3px);
            box-shadow: 0 7px 15px rgba(79,70,229,.25);
        }

        .add-course-btn i {
            margin-right: 4px;
        }


        /* ================= STATISTICS ================= */

        .course-stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 8px;
            margin-bottom: 10px;
        }

        .course-stat-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            min-height: 70px;
            padding: 11px;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .course-stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15,23,42,.10);
            border-color: #C7D2FE;
        }

        .course-stat-content {
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .course-stat-icon {
            width: 32px;
            height: 32px;
            border-radius: 7px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-shrink: 0;
            font-size: 12px;
            transition: transform 0.2s ease;
        }

        .course-stat-card:hover .course-stat-icon {
            transform: scale(1.08);
        }

        .course-purple {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .course-green {
            background: #ECFDF3;
            color: #22C55E;
        }

        .course-orange {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .course-blue {
            background: #EFF6FF;
            color: #2563EB;
        }

        .course-stat-label {
            font-size: 7px;
            color: #64748B;
            text-transform: uppercase;
            letter-spacing: .35px;
            margin-bottom: 3px;
        }

        .course-stat-number {
            font-size: 17px;
            font-weight: 600;
            color: #1E293B;
        }


        /* ================= FILTER ================= */

        .course-filter-box {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 11px;
            margin-bottom: 10px;

            transition:
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .course-filter-box:hover {
            box-shadow: 0 6px 18px rgba(15,23,42,.06);
            border-color: #CBD5E1;
        }

        .course-filters {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            gap: 8px;
        }

        .course-filter-field label {
            display: block;
            margin-bottom: 4px;
            color: #64748B;
            font-size: 6.5px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .course-input,
        .course-select {
            width: 100%;
            height: 27px;
            padding: 0 8px;
            border: 1px solid #E2E8F0;
            border-radius: 5px;
            background: #FFFFFF;
            color: #475569;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 7px;
            outline: none;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .course-input:focus,
        .course-select:focus {
            border-color: #A5B4FC;
            box-shadow: 0 0 0 2px rgba(99,102,241,.08);
        }


        /* ================= COURSE GRID ================= */

        .course-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 9px;
        }


        /* ================= COURSE CARD ================= */

        .course-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(15,23,42,.025);

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15,23,42,.10);
            border-color: #C7D2FE;
        }


        /* ================= COURSE COLOR HEADER ================= */

        .course-card-header {
            height: 48px;
            padding: 7px 9px;
            position: relative;
            color: #FFFFFF;
        }

        .header-purple {
            background: linear-gradient(135deg, #4338CA, #6366F1);
        }

        .header-blue {
            background: linear-gradient(135deg, #0369A1, #06B6D4);
        }

        .header-violet {
            background: linear-gradient(135deg, #6D28D9, #8B5CF6);
        }

        .header-green {
            background: linear-gradient(135deg, #059669, #22C55E);
        }

        .header-cyan {
            background: linear-gradient(135deg, #0284C7, #06B6D4);
        }

        .header-orange {
            background: linear-gradient(135deg, #F97316, #EF4444);
        }

        .course-code {
            display: inline-block;
            padding: 2px 5px;
            border-radius: 8px;
            background: rgba(255,255,255,.18);
            font-size: 6px;
            font-weight: 600;
        }


        /* ================= COURSE ACTION ICONS ================= */

        .course-card-icons {
            position: absolute;
            right: 8px;
            top: 7px;
            display: flex;
            gap: 4px;
        }

        .course-card-icon {
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            background: rgba(255,255,255,.17);
            color: #FFFFFF;
            font-size: 7px;
            cursor: pointer;
            border: none;
            transition:
                background 0.2s ease,
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }

        .course-card-icon:hover {
            background: #FFFFFF;
            color: #4F46E5;
            transform: translateY(-2px) scale(1.08);
            box-shadow: 0 3px 8px rgba(0,0,0,.15);
        }

        .course-delete-icon:hover {
            color: #DC2626;
        }

        .course-main-icon {
            position: absolute;
            right: 9px;
            bottom: 5px;
            font-size: 24px;
            opacity: .14;
        }


        /* ================= COURSE BODY ================= */

        .course-card-body {
            padding: 10px;
        }

        .course-name {
            margin: 0 0 2px 0;
            color: #334155;
            font-size: 9px;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .course-name:hover {
            color: #4F46E5;
        }

        .course-short-code {
            margin-bottom: 6px;
            color: #4F46E5;
            font-size: 6px;
            font-weight: 600;
        }

        .course-description {
            height: 27px;
            margin-bottom: 7px;
            color: #64748B;
            font-size: 6.5px;
            line-height: 10px;
            overflow: hidden;
        }


        /* ================= COURSE INFORMATION ================= */

        .course-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 5px 8px;
            margin-bottom: 7px;
        }

        .course-info-item {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #475569;
            font-size: 6.5px;
            transition: color 0.2s ease;
        }

        .course-info-item i {
            width: 10px;
            color: #4F46E5;
            font-size: 7px;
            text-align: center;
        }

        .course-info-item:hover {
            color: #4F46E5;
        }


        /* ================= TAGS ================= */

        .course-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 3px;
            padding-top: 6px;
            border-top: 1px solid #F1F5F9;
        }

        .course-tag {
            padding: 3px 6px;
            border-radius: 8px;
            background: #EEF2FF;
            color: #4F46E5;
            font-size: 5.5px;
            transition: transform 0.2s ease;
        }

        .course-tag:hover {
            transform: translateY(-2px);
        }

        .course-tag.green {
            background: #ECFDF3;
            color: #16A34A;
        }

        .course-tag.orange {
            background: #FFF7E6;
            color: #D97706;
        }


        /* ================= COURSE FOOTER ================= */

        .course-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 7px 10px;
            border-top: 1px solid #F1F5F9;
        }

        .course-students {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: #64748B;
            font-size: 6.5px;
        }

        .course-students i {
            color: #4F46E5;
            font-size: 7px;
        }

        .course-status {
            display: inline-flex;
            align-items: center;
            gap: 3px;
            padding: 3px 6px;
            border-radius: 8px;
            background: #ECFDF3;
            color: #16A34A;
            font-size: 5.5px;
            font-weight: 600;
        }

        .course-status.upcoming {
            background: #FFF7E6;
            color: #D97706;
        }

        .course-status i {
            font-size: 4px;
        }


        /* ================= DELETE ANIMATION ================= */

        .course-card.removing {
            opacity: 0;
            transform: scale(.94);
            transition: all 0.25s ease;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .course-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .course-stats {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 650px) {

            .courses-page {
                padding: 15px;
            }

            .courses-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .course-stats {
                grid-template-columns: 1fr;
            }

            .course-filters {
                grid-template-columns: 1fr;
            }

            .course-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="courses-page">

        <!-- ================= HEADER ================= -->

        <div class="courses-header">

            <div class="courses-title">

                <h1>
                    Course Management
                </h1>

                <p>
                    Manage all academic programs and courses
                </p>

            </div>

            <div class="course-header-actions">

                <button type="button"
                        class="course-view-btn">

                    <i class="fas fa-list"></i>
                    Table

                </button>

                <a href="<%= ResolveUrl("~/Admin/AddCourse.aspx") %>"
                   class="add-course-btn"
                   style="display:flex; align-items:center; justify-content:center; text-decoration:none;">

                    <i class="fas fa-plus"></i>
                    &nbsp; Add Course

                </a>

            </div>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="course-stats">

            <div class="course-stat-card">

                <div class="course-stat-content">

                    <div class="course-stat-icon course-purple">
                        <i class="fas fa-book-open"></i>
                    </div>

                    <div>
                        <div class="course-stat-label">
                            Total Courses
                        </div>

                        <div class="course-stat-number">
                            12
                        </div>
                    </div>

                </div>

            </div>


            <div class="course-stat-card">

                <div class="course-stat-content">

                    <div class="course-stat-icon course-green">
                        <i class="fas fa-check"></i>
                    </div>

                    <div>
                        <div class="course-stat-label">
                            Active
                        </div>

                        <div class="course-stat-number">
                            10
                        </div>
                    </div>

                </div>

            </div>


            <div class="course-stat-card">

                <div class="course-stat-content">

                    <div class="course-stat-icon course-orange">
                        <i class="fas fa-user-graduate"></i>
                    </div>

                    <div>
                        <div class="course-stat-label">
                            Total Students
                        </div>

                        <div class="course-stat-number">
                            456
                        </div>
                    </div>

                </div>

            </div>


            <div class="course-stat-card">

                <div class="course-stat-content">

                    <div class="course-stat-icon course-blue">
                        <i class="fas fa-sitemap"></i>
                    </div>

                    <div>
                        <div class="course-stat-label">
                            Departments
                        </div>

                        <div class="course-stat-number">
                            5
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- ================= FILTERS ================= -->

        <div class="course-filter-box">

            <div class="course-filters">

                <div class="course-filter-field">

                    <label>
                        Department
                    </label>

                    <select class="course-select">

                        <option>All Departments</option>
                        <option>Computer Engineering</option>
                        <option>Management</option>
                        <option>Science</option>
                        <option>Arts</option>

                    </select>

                </div>


                <div class="course-filter-field">

                    <label>
                        Level
                    </label>

                    <select class="course-select">

                        <option>All Levels</option>
                        <option>Undergraduate</option>
                        <option>Postgraduate</option>

                    </select>

                </div>


                <div class="course-filter-field">

                    <label>
                        Status
                    </label>

                    <select class="course-select">

                        <option>All Status</option>
                        <option>Active</option>
                        <option>Upcoming</option>
                        <option>Inactive</option>

                    </select>

                </div>


                <div class="course-filter-field">

                    <label>
                        Search
                    </label>

                    <input type="text"
                           class="course-input"
                           placeholder="Course name or code..." />

                </div>

            </div>

        </div>


        <!-- ================= COURSE GRID ================= -->

        <div class="course-grid">


            <!-- ================= COURSE 1 ================= -->

            <div class="course-card"
                 data-course="B.Tech Computer Science">

                <div class="course-card-header header-purple">

                    <span class="course-code">
                        UG
                    </span>

                    <div class="course-card-icons">

                        <!-- EDIT -->
                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <!-- DELETE -->
                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-book course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <a href="<%= ResolveUrl("~/Admin/CourseDetails.aspx") %>"
                       class="course-name"
                       style="text-decoration:none; display:block;">

                        B.Tech Computer Science

                    </a>

                    <div class="course-short-code">
                        CSE-BTECH-001
                    </div>

                    <div class="course-description">
                        Bachelor of Technology in Computer Science and Engineering,
                        covering programming, data structures and computing.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            4 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹3,80,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            120 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            8 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Engineering
                        </span>

                        <span class="course-tag">
                            Full-Time
                        </span>

                        <span class="course-tag green">
                            Active
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        98 Students
                    </span>

                    <span class="course-status">
                        <i class="fas fa-circle"></i>
                        Active
                    </span>

                </div>

            </div>


            <!-- ================= COURSE 2 ================= -->

            <div class="course-card"
                 data-course="MBA Finance">

                <div class="course-card-header header-blue">

                    <span class="course-code">
                        PG
                    </span>

                    <div class="course-card-icons">

                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-chart-pie course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <h3 class="course-name">
                        MBA Finance
                    </h3>

                    <div class="course-short-code">
                        MBA-FIN-001
                    </div>

                    <div class="course-description">
                        Master of Business Administration with Finance
                        specialization, covering corporate finance.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            2 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹2,50,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            60 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            4 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Management
                        </span>

                        <span class="course-tag">
                            Full-Time
                        </span>

                        <span class="course-tag green">
                            Active
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        52 Students
                    </span>

                    <span class="course-status">
                        <i class="fas fa-circle"></i>
                        Active
                    </span>

                </div>

            </div>


            <!-- ================= COURSE 3 ================= -->

            <div class="course-card"
                 data-course="BCA">

                <div class="course-card-header header-violet">

                    <span class="course-code">
                        UG
                    </span>

                    <div class="course-card-icons">

                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-laptop-code course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <h3 class="course-name">
                        BCA
                    </h3>

                    <div class="course-short-code">
                        BCA-001
                    </div>

                    <div class="course-description">
                        Bachelor of Computer Applications.
                        Comprehensive computer programming and applications.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            3 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹2,10,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            90 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            6 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Computer
                        </span>

                        <span class="course-tag">
                            Full-Time
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        75 Students
                    </span>

                    <span class="course-status">
                        <i class="fas fa-circle"></i>
                        Active
                    </span>

                </div>

            </div>


            <!-- ================= COURSE 4 ================= -->

            <div class="course-card"
                 data-course="B.Sc Physics">

                <div class="course-card-header header-green">

                    <span class="course-code">
                        UG
                    </span>

                    <div class="course-card-icons">

                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-atom course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <h3 class="course-name">
                        B.Sc Physics
                    </h3>

                    <div class="course-short-code">
                        BSC-PHY-001
                    </div>

                    <div class="course-description">
                        Bachelor of Science in Physics. Core physics,
                        applied physics, electronics and research.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            3 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹1,50,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            40 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            6 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Science
                        </span>

                        <span class="course-tag">
                            Full-Time
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        32 Students
                    </span>

                    <span class="course-status">
                        <i class="fas fa-circle"></i>
                        Active
                    </span>

                </div>

            </div>


            <!-- ================= COURSE 5 ================= -->

            <div class="course-card"
                 data-course="M.Tech Artificial Intelligence">

                <div class="course-card-header header-cyan">

                    <span class="course-code">
                        PG
                    </span>

                    <div class="course-card-icons">

                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-robot course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <h3 class="course-name">
                        M.Tech Artificial Intelligence
                    </h3>

                    <div class="course-short-code">
                        MTECH-AI-001
                    </div>

                    <div class="course-description">
                        Master of Technology in AI/ML. Deep learning,
                        NLP, computer vision and reinforcement learning.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            2 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹2,40,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            30 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            4 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Engineering
                        </span>

                        <span class="course-tag">
                            PG
                        </span>

                        <span class="course-tag green">
                            Active
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        24 Students
                    </span>

                    <span class="course-status">
                        <i class="fas fa-circle"></i>
                        Active
                    </span>

                </div>

            </div>


            <!-- ================= COURSE 6 ================= -->

            <div class="course-card"
                 data-course="BA English Literature">

                <div class="course-card-header header-orange">

                    <span class="course-code">
                        UG
                    </span>

                    <div class="course-card-icons">

                        <button type="button"
                                class="course-card-icon"
                                title="Edit Course"
                                onclick="editCourse(this);">

                            <i class="fas fa-pen"></i>

                        </button>

                        <button type="button"
                                class="course-card-icon course-delete-icon"
                                title="Delete Course"
                                onclick="deleteCourse(this);">

                            <i class="fas fa-trash"></i>

                        </button>

                    </div>

                    <i class="fas fa-palette course-main-icon"></i>

                </div>


                <div class="course-card-body">

                    <h3 class="course-name">
                        BA English Literature
                    </h3>

                    <div class="course-short-code">
                        BA-ENG-001
                    </div>

                    <div class="course-description">
                        Bachelor of Arts in English. British and American
                        literature, creative writing and literary studies.
                    </div>

                    <div class="course-info">

                        <div class="course-info-item">
                            <i class="far fa-clock"></i>
                            3 Years
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-indian-rupee-sign"></i>
                            ₹1,20,000/year
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-user-group"></i>
                            60 Seats
                        </div>

                        <div class="course-info-item">
                            <i class="fas fa-book"></i>
                            6 Semesters
                        </div>

                    </div>

                    <div class="course-tags">

                        <span class="course-tag">
                            Arts
                        </span>

                        <span class="course-tag">
                            Full-Time
                        </span>

                    </div>

                </div>


                <div class="course-card-footer">

                    <span class="course-students">
                        <i class="fas fa-users"></i>
                        45 Students
                    </span>

                    <span class="course-status upcoming">
                        <i class="fas fa-circle"></i>
                        Upcoming
                    </span>

                </div>

            </div>

        </div>

    </div>


    <!-- ================= EDIT + DELETE JAVASCRIPT ================= -->

    <script type="text/javascript">

function editCourse(button) {

    var card = button.closest(".course-card");

    if (!card) {
        return;
    }

    var courseNameElement = card.querySelector(".course-name");

    if (!courseNameElement) {
        return;
    }

    var oldName = courseNameElement.textContent.trim();

    var newName = prompt(
        "Enter new course name:",
        oldName
    );

    if (newName === null) {
        return;
    }

    newName = newName.trim();

    if (newName === "") {
        alert("Course name cannot be empty.");
        return;
    }

    courseNameElement.textContent = newName;

    card.setAttribute("data-course", newName);

    alert("Course updated successfully.");
}


function deleteCourse(button) {

    var card = button.closest(".course-card");

    if (!card) {
        return;
    }

    var courseNameElement = card.querySelector(".course-name");

    var courseName = "this course";

    if (courseNameElement) {
        courseName = courseNameElement.textContent.trim();
    }

    var confirmDelete = confirm(
        "Are you sure you want to delete \"" +
        courseName +
        "\"?"
    );

    if (!confirmDelete) {
        return;
    }

    card.classList.add("removing");

    setTimeout(function () {

        card.remove();

    }, 250);
}

</script>

</asp:Content>