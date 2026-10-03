<%@ Page Title="Student Management"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Students.aspx.cs"
    Inherits="EduCRM.Students" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           STUDENT MANAGEMENT PAGE
           ===================================================== */

        .students-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            padding: 20px 14px;
            background: #F8FAFC;
            font-family: 'Inter', Arial, sans-serif;
            color: #1E293B;
            box-sizing: border-box;
        }

        .students-page *,
        .students-page *::before,
        .students-page *::after {
            box-sizing: border-box;
        }


        /* ================= HEADER ================= */

        .students-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 17px;
            gap: 15px;
        }

        .students-title h1 {
            margin: 0 0 4px 0;
            font-family: 'Montserrat', Arial, sans-serif;
            font-size: 25px;
            font-weight: 600;
            color: #172033;
        }

        .students-title p {
            margin: 0;
            color: #64748B;
            font-size: 10px;
        }


        /* ================= VIEW BUTTONS ================= */

        .student-view-buttons {
            display: flex;
            gap: 4px;
            margin-top: 2px;
        }

        .student-view-btn {
            border: none;
            background: #EEF2FF;
            color: #64748B;
            padding: 7px 11px;
            border-radius: 14px;
            font-size: 9px;
            font-family: 'Inter', Arial, sans-serif;
            cursor: pointer;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }

        .student-view-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(79, 70, 229, 0.15);
        }

        .student-view-btn.active {
            background: #4F46E5;
            color: #FFFFFF;
            box-shadow: 0 2px 6px rgba(79, 70, 229, .20);
        }

        .student-view-btn i {
            margin-right: 4px;
        }


        /* ================= STATISTICS ================= */

        .student-stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 9px;
            margin-bottom: 16px;
        }

        .student-stat {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 9px;
            padding: 13px;
            min-height: 72px;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .student-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
            border-color: #C7D2FE;
        }

        .student-stat-content {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .student-stat-icon {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 13px;
        }

        .student-purple {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .student-green {
            background: #ECFDF3;
            color: #22C55E;
        }

        .student-orange {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .student-blue {
            background: #EFF6FF;
            color: #2563EB;
        }

        .student-stat-label {
            font-size: 7px;
            color: #64748B;
            text-transform: uppercase;
            letter-spacing: .4px;
            margin-bottom: 3px;
        }

        .student-stat-number {
            font-size: 18px;
            line-height: 20px;
            font-weight: 600;
            color: #1E293B;
        }


        /* ================= FILTER BOX ================= */

        .student-filter-box {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 9px;
            padding: 13px;
            margin-bottom: 9px;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .student-filter-box:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
            border-color: #C7D2FE;
        }

        .student-filters {
            display: grid;
            grid-template-columns: 1.7fr 1fr 1fr 1fr auto;
            gap: 9px;
            align-items: end;
        }

        .student-filter-field label {
            display: block;
            font-size: 7px;
            color: #64748B;
            text-transform: uppercase;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .student-input,
        .student-select {
            width: 100%;
            height: 29px;
            padding: 0 9px;
            border: 1px solid #E2E8F0;
            border-radius: 5px;
            background: #FFFFFF;
            color: #475569;
            font-size: 8px;
            font-family: 'Inter', Arial, sans-serif;
            outline: none;
        }

        .student-input:focus,
        .student-select:focus {
            border-color: #A5B4FC;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.06);
        }

        .student-reset {
            height: 29px;
            padding: 0 11px;
            border: none;
            border-radius: 5px;
            background: #EEF2FF;
            color: #4F46E5;
            font-size: 8px;
            font-family: 'Inter', Arial, sans-serif;
            cursor: pointer;
            white-space: nowrap;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }

        .student-reset:hover {
            background: #E0E7FF;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(79, 70, 229, 0.15);
        }

        .student-reset i {
            margin-right: 4px;
        }


        /* ================= TABLE ================= */

        .student-table-wrapper {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 9px;
            overflow: hidden;

            transition:
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .student-table-wrapper:hover {
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
            border-color: #D8DEF0;
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .student-table th {
            background: #F5F7FF;
            color: #64748B;
            font-size: 7px;
            font-weight: 600;
            text-transform: uppercase;
            text-align: left;
            padding: 9px 7px;
            border-bottom: 1px solid #E2E8F0;
            white-space: nowrap;
        }

        .student-table td {
            padding: 9px 7px;
            border-bottom: 1px solid #EEF2F6;
            vertical-align: middle;
            font-size: 8px;
            color: #475569;
        }

        .student-table tr:last-child td {
            border-bottom: none;
        }

        .student-table tbody tr {
            transition: background 0.2s ease;
        }

        .student-table tbody tr:hover td {
            background: #FAFBFF;
        }


        /* ================= STUDENT NAME ================= */

        .student-name-cell {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .student-avatar {
            width: 25px;
            height: 25px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #4F46E5;
            color: #FFFFFF;
            font-size: 7px;
            font-weight: 600;
            flex-shrink: 0;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }

        .student-table tbody tr:hover .student-avatar {
            transform: scale(1.08);
            box-shadow: 0 3px 8px rgba(79, 70, 229, 0.20);
        }

        .student-name {
            color: #334155;
            font-size: 8px;
            font-weight: 600;
            line-height: 11px;
        }

        .student-reg {
            display: block;
            color: #94A3B8;
            font-size: 6.5px;
            font-weight: 400;
        }


        /* ================= STUDENT ID ================= */

        .student-id {
            color: #2563EB;
            font-size: 8px;
            font-weight: 600;
        }


        /* ================= ROLL NUMBER ================= */

        .roll-number {
            display: inline-block;
            padding: 3px 6px;
            border: 1px solid #E2E8F0;
            border-radius: 4px;
            color: #64748B;
            font-size: 6.5px;
            background: #FFFFFF;
        }


        /* ================= EMAIL ================= */

        .contact-cell {
            line-height: 11px;
            font-size: 7px;
        }

        .contact-phone {
            color: #334155;
        }

        .contact-email {
            color: #94A3B8;
            font-size: 6.5px;
        }


        /* ================= STATUS ================= */

        .student-status {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 7px;
            border-radius: 999px;
            background: #ECFDF3;
            color: #16A34A;
            font-size: 6.5px;
            font-weight: 600;
        }

        .student-status i {
            font-size: 5px;
        }


        /* ================= ACTIONS ================= */

        .student-actions {
            display: flex;
            align-items: center;
            gap: 7px;
            white-space: nowrap;
        }

        .student-action {
            width: 30px;
            height: 30px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            border: 1px solid #E2E8F0;
            border-radius: 6px;

            background: #FFFFFF;
            color: #2563EB;

            font-family: 'Inter', Arial, sans-serif;
            font-size: 10px;

            cursor: pointer;
            padding: 0;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease,
                border-color 0.2s ease,
                color 0.2s ease;
        }


        /* ================= VIEW / DETAILS ================= */

        .student-action.details:hover {
            background: #4F46E5;
            border-color: #4F46E5;
            color: #FFFFFF;

            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(79, 70, 229, 0.25);
        }


        /* ================= DELETE ================= */

        .student-action.delete {
            color: #DC2626;
        }

        .student-action.delete:hover {
            background: #FEE2E2;
            border-color: #FECACA;
            color: #DC2626;

            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(220, 38, 38, 0.18);
        }


        /* ================= TABLE FOOTER ================= */

        .student-table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            min-height: 31px;
            padding: 7px 11px;
            border-top: 1px solid #E2E8F0;
        }

        .student-showing {
            color: #475569;
            font-size: 7px;
        }

        .student-pagination {
            display: flex;
            align-items: center;
            gap: 2px;
        }

        .page-btn {
            width: 20px;
            height: 20px;
            border: 1px solid #E2E8F0;
            border-radius: 4px;
            background: #FFFFFF;
            color: #64748B;
            font-size: 8px;
            cursor: pointer;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .page-btn.active {
            background: #4F46E5;
            color: #FFFFFF;
            border-color: #4F46E5;
        }

        .page-btn:hover {
            border-color: #A5B4FC;
            transform: translateY(-1px);
            box-shadow: 0 3px 7px rgba(15, 23, 42, 0.08);
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .student-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .student-filters {
                grid-template-columns: repeat(2, 1fr);
            }

            .student-reset {
                width: 100%;
            }

            .student-table-wrapper {
                overflow-x: auto;
            }

            .student-table {
                min-width: 900px;
            }
        }


        @media (max-width: 650px) {

            .students-page {
                padding: 15px;
            }

            .students-header {
                flex-direction: column;
            }

            .student-stats {
                grid-template-columns: 1fr;
            }

            .student-filters {
                grid-template-columns: 1fr;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="students-page">


        <!-- ================= HEADER ================= -->

        <div class="students-header">

            <div class="students-title">

                <h1>
                    Student Management
                </h1>

                <p>
                    Manage enrolled student profiles, academic records, and admission lifecycles
                </p>

            </div>


            <div class="student-view-buttons">

                <button type="button"
                        class="student-view-btn active">

                    <i class="fas fa-list"></i>
                    Table View

                </button>

                <button type="button"
                        class="student-view-btn">

                    <i class="fas fa-th-large"></i>
                    Grid View

                </button>

            </div>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="student-stats">


            <!-- TOTAL ENROLLED -->

            <div class="student-stat">

                <div class="student-stat-content">

                    <div class="student-stat-icon student-purple">

                        <i class="fas fa-user-graduate"></i>

                    </div>

                    <div>

                        <div class="student-stat-label">
                            Total Enrolled
                        </div>

                        <div class="student-stat-number">
                            456
                        </div>

                    </div>

                </div>

            </div>


            <!-- ACTIVE -->

            <div class="student-stat">

                <div class="student-stat-content">

                    <div class="student-stat-icon student-green">

                        <i class="fas fa-user-check"></i>

                    </div>

                    <div>

                        <div class="student-stat-label">
                            Active Students
                        </div>

                        <div class="student-stat-number">
                            412
                        </div>

                    </div>

                </div>

            </div>


            <!-- NEW BATCH -->

            <div class="student-stat">

                <div class="student-stat-content">

                    <div class="student-stat-icon student-orange">

                        <i class="fas fa-user-plus"></i>

                    </div>

                    <div>

                        <div class="student-stat-label">
                            New Batch 2024
                        </div>

                        <div class="student-stat-number">
                            128
                        </div>

                    </div>

                </div>

            </div>


            <!-- ALUMNI -->

            <div class="student-stat">

                <div class="student-stat-content">

                    <div class="student-stat-icon student-blue">

                        <i class="fas fa-award"></i>

                    </div>

                    <div>

                        <div class="student-stat-label">
                            Alumni
                        </div>

                        <div class="student-stat-number">
                            44
                        </div>

                    </div>

                </div>

            </div>


        </div>


        <!-- ================= FILTER SECTION ================= -->

        <div class="student-filter-box">

            <div class="student-filters">


                <!-- SEARCH -->

                <div class="student-filter-field">

                    <label>
                        Search Students
                    </label>

                    <input type="text"
                           class="student-input"
                           placeholder="Search by name, roll no, STU-ID or phone..." />

                </div>


                <!-- COURSE -->

                <div class="student-filter-field">

                    <label>
                        Course
                    </label>

                    <select class="student-select">

                        <option>All Courses</option>
                        <option>B.Tech CSE</option>
                        <option>MBA Finance</option>
                        <option>BCA</option>
                        <option>B.Sc Data Science</option>

                    </select>

                </div>


                <!-- BATCH -->

                <div class="student-filter-field">

                    <label>
                        Batch Year
                    </label>

                    <select class="student-select">

                        <option>All Batches</option>
                        <option>2024</option>
                        <option>2023</option>
                        <option>2022</option>
                        <option>2021</option>

                    </select>

                </div>


                <!-- STATUS -->

                <div class="student-filter-field">

                    <label>
                        Status
                    </label>

                    <select class="student-select">

                        <option>All Status</option>
                        <option>Active</option>
                        <option>Inactive</option>
                        <option>Alumni</option>

                    </select>

                </div>


                <!-- RESET -->

                <button type="button"
                        class="student-reset"
                        onclick="resetStudentFilters();">

                    <i class="fas fa-rotate-right"></i>
                    Reset

                </button>


            </div>

        </div>


        <!-- ================= STUDENT TABLE ================= -->

        <div class="student-table-wrapper">

            <table class="student-table">


                <thead>

                    <tr>

                        <th style="width: 12%;">
                            Student Name
                        </th>

                        <th style="width: 10%;">
                            Student ID
                        </th>

                        <th style="width: 10%;">
                            Roll Number
                        </th>

                        <th style="width: 13%;">
                            Enrolled Course
                        </th>

                        <th style="width: 15%;">
                            Contact / Email
                        </th>

                        <th style="width: 11%;">
                            Admission Date
                        </th>

                        <th style="width: 10%;">
                            Status
                        </th>

                        <th style="width: 9%;">
                            Actions
                        </th>

                    </tr>

                </thead>


                <tbody>


                    <!-- ================= STUDENT 1 ================= -->

                    <tr>

                        <td>

                            <div class="student-name-cell">

                                <div class="student-avatar">
                                    PS
                                </div>

                                <div class="student-name">

                                    Priya
                                    <br />
                                    Sharma

                                    <span class="student-reg">
                                        Reg: REG-2024-884
                                    </span>

                                </div>

                            </div>

                        </td>


                        <td>

                            <span class="student-id">
                                STU-2024-0347
                            </span>

                        </td>


                        <td>

                            <span class="roll-number">
                                24CSE042
                            </span>

                        </td>


                        <td>
                            MBA Finance
                        </td>


                        <td>

                            <div class="contact-cell">

                                <div class="contact-phone">
                                    +91 98765 43211
                                </div>

                                <div class="contact-email">
                                    priya@gmail.com
                                </div>

                            </div>

                        </td>


                        <td>
                            Dec 10, 2024
                        </td>


                        <td>

                            <span class="student-status">

                                <i class="fas fa-circle"></i>
                                Active

                            </span>

                        </td>


                        <td>

                            <div class="student-actions">

                                <!-- VIEW -->

                                <button type="button"
                                        class="student-action details"
                                        title="View Details"
                                        onclick="viewStudent('STU-2024-0347');">

                                    <i class="fas fa-eye"></i>

                                </button>


                                <!-- DELETE -->

                                <button type="button"
                                        class="student-action delete"
                                        title="Delete Student"
                                        onclick="deleteStudent('STU-2024-0347');">

                                    <i class="fas fa-trash"></i>

                                </button>

                            </div>

                        </td>

                    </tr>


                    <!-- ================= STUDENT 2 ================= -->

                    <tr>

                        <td>

                            <div class="student-name-cell">

                                <div class="student-avatar">
                                    RK
                                </div>

                                <div class="student-name">

                                    Rajesh
                                    <br />
                                    Kumar

                                    <span class="student-reg">
                                        Reg: REG-2024-885
                                    </span>

                                </div>

                            </div>

                        </td>


                        <td>

                            <span class="student-id">
                                STU-2024-0348
                            </span>

                        </td>


                        <td>

                            <span class="roll-number">
                                24CSE043
                            </span>

                        </td>


                        <td>
                            B.Tech CSE
                        </td>


                        <td>

                            <div class="contact-cell">

                                <div class="contact-phone">
                                    +91 98765 43210
                                </div>

                                <div class="contact-email">
                                    rajesh@gmail.com
                                </div>

                            </div>

                        </td>


                        <td>
                            Dec 12, 2024
                        </td>


                        <td>

                            <span class="student-status">

                                <i class="fas fa-circle"></i>
                                Active

                            </span>

                        </td>


                        <td>

                            <div class="student-actions">

                                <!-- VIEW -->

                                <button type="button"
                                        class="student-action details"
                                        title="View Details"
                                        onclick="viewStudent('STU-2024-0348');">

                                    <i class="fas fa-eye"></i>

                                </button>


                                <!-- DELETE -->

                                <button type="button"
                                        class="student-action delete"
                                        title="Delete Student"
                                        onclick="deleteStudent('STU-2024-0348');">

                                    <i class="fas fa-trash"></i>

                                </button>

                            </div>

                        </td>

                    </tr>


                    <!-- ================= STUDENT 3 ================= -->

                    <tr>

                        <td>

                            <div class="student-name-cell">

                                <div class="student-avatar">
                                    AV
                                </div>

                                <div class="student-name">

                                    Amit
                                    <br />
                                    Verma

                                    <span class="student-reg">
                                        Reg: REG-2024-886
                                    </span>

                                </div>

                            </div>

                        </td>


                        <td>

                            <span class="student-id">
                                STU-2024-0349
                            </span>

                        </td>


                        <td>

                            <span class="roll-number">
                                24BCA012
                            </span>

                        </td>


                        <td>
                            BCA
                        </td>


                        <td>

                            <div class="contact-cell">

                                <div class="contact-phone">
                                    +91 98765 11111
                                </div>

                                <div class="contact-email">
                                    amit@gmail.com
                                </div>

                            </div>

                        </td>


                        <td>
                            Dec 14, 2024
                        </td>


                        <td>

                            <span class="student-status">

                                <i class="fas fa-circle"></i>
                                Active

                            </span>

                        </td>


                        <td>

                            <div class="student-actions">

                                <!-- VIEW -->

                                <button type="button"
                                        class="student-action details"
                                        title="View Details"
                                        onclick="viewStudent('STU-2024-0349');">

                                    <i class="fas fa-eye"></i>

                                </button>


                                <!-- DELETE -->

                                <button type="button"
                                        class="student-action delete"
                                        title="Delete Student"
                                        onclick="deleteStudent('STU-2024-0349');">

                                    <i class="fas fa-trash"></i>

                                </button>

                            </div>

                        </td>

                    </tr>


                </tbody>

            </table>


            <!-- ================= TABLE FOOTER ================= -->

            <div class="student-table-footer">

                <div class="student-showing">
                    Showing 1-3 of 456 students
                </div>


                <div class="student-pagination">

                    <button type="button"
                            class="page-btn">
                        &lt;
                    </button>

                    <button type="button"
                            class="page-btn active">
                        1
                    </button>

                    <button type="button"
                            class="page-btn">
                        2
                    </button>

                    <button type="button"
                            class="page-btn">
                        3
                    </button>

                    <button type="button"
                            class="page-btn">
                        &gt;
                    </button>

                </div>

            </div>

        </div>


    </div>


    <!-- ================= JAVASCRIPT ================= -->

    <script>

/* ================= VIEW STUDENT ================= */

function viewStudent(studentId) {

    /*
     * Currently showing demo message.
     * Later this can redirect to StudentDetails.aspx.
     */

    alert(
        "Opening details for student: " +
        studentId
    );

}


/* ================= DELETE STUDENT ================= */

function deleteStudent(studentId) {

    var confirmDelete = confirm(
        "Are you sure you want to delete student " +
        studentId +
        "?"
    );

    if (confirmDelete) {

        alert(
            "Student " +
            studentId +
            " deleted successfully."
        );

    }

}


/* ================= RESET FILTERS ================= */

function resetStudentFilters() {

    var inputs =
        document.querySelectorAll(
            '.student-input'
        );

    for (var i = 0; i < inputs.length; i++) {

        inputs[i].value = "";

    }


    var selects =
        document.querySelectorAll(
            '.student-select'
        );

    for (var j = 0; j < selects.length; j++) {

        selects[j].selectedIndex = 0;

    }

}

</script>

</asp:Content>