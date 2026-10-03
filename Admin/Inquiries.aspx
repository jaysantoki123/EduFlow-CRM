<%@ Page Title="Inquiries"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Inquiries.aspx.cs"
    Inherits="EduCRM.Inquiries" %>


<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================
           INQUIRY PAGE
        ========================================= */

        .inquiry-page {
            width: 100%;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .inquiry-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 28px;
        }

        .inquiry-title h1 {
            margin: 0 0 8px 0;
            font-family: 'Montserrat', sans-serif;
            font-size: 32px;
            font-weight: 600;
            color: #111c2d;
        }

        .inquiry-title p {
            margin: 0;
            font-size: 14px;
            color: #64748b;
        }

        .monitoring-badge {
            display: flex;
            align-items: center;
            gap: 7px;
            background: #e8f1ff;
            color: #2563eb;
            border: 1px solid #bfdbfe;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }


        /* =========================================
           STAT CARDS
        ========================================= */

        .inquiry-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 18px;
        }

        .inquiry-stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px;
            min-height: 100px;
            display: flex;
            align-items: flex-start;
            gap: 14px;

            /* HOVER EFFECT */
            transition: transform 0.2s ease,
                        box-shadow 0.2s ease,
                        border-color 0.2s ease;
        }

        .inquiry-stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
            border-color: #c7d2fe;
        }

        .inquiry-stat-icon {
            width: 42px;
            height: 42px;
            min-width: 42px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .stat-purple {
            background: #ede9fe;
            color: #6d4aff;
        }

        .stat-blue {
            background: #e0edff;
            color: #2563eb;
        }

        .stat-orange {
            background: #fff0d5;
            color: #f59e0b;
        }

        .stat-green {
            background: #dcfce7;
            color: #16a34a;
        }

        .inquiry-stat-label {
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: .6px;
            color: #64748b;
            margin-bottom: 5px;
        }

        .inquiry-stat-number {
            font-size: 24px;
            font-weight: 500;
            color: #172033;
            line-height: 1.1;
            margin-bottom: 5px;
        }

        .inquiry-stat-change {
            font-size: 10px;
            color: #16a34a;
        }

        .inquiry-stat-change.red {
            color: #ef4444;
        }


        /* =========================================
           FILTER CARD
        ========================================= */

        .filter-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 8px;
        }

        .filter-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .filter-title {
            font-size: 14px;
            color: #64748b;
            margin: 0;
        }

        .reset-btn {
            border: 1px solid #e2e8f0;
            background: #ffffff;
            color: #6d4aff;
            border-radius: 6px;
            padding: 7px 12px;
            font-size: 11px;
            cursor: pointer;
        }

        .reset-btn:hover {
            background: #f5f3ff;
            border-color: #c4b5fd;
        }

        .reset-btn i {
            margin-right: 5px;
        }

        .filter-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .filter-group label {
            display: block;
            font-size: 9px;
            text-transform: uppercase;
            letter-spacing: .5px;
            color: #64748b;
            margin-bottom: 6px;
        }

        .filter-control {
            width: 100%;
            height: 38px;
            border: 1px solid #dbe3ed;
            border-radius: 6px;
            padding: 0 10px;
            background: #ffffff;
            color: #334155;
            font-size: 11px;
            outline: none;
        }


        /* =========================================
           INQUIRY TABLE CARD
        ========================================= */

        .inquiry-table-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            overflow: hidden;

            transition: transform 0.2s ease,
                        box-shadow 0.2s ease,
                        border-color 0.2s ease;
        }

        .inquiry-table-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
        }

        .table-search-area {
            height: 60px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 16px;
            border-bottom: 1px solid #e2e8f0;
        }

        .table-search {
            width: 250px;
            height: 34px;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            display: flex;
            align-items: center;
            padding: 0 12px;
            color: #64748b;
        }

        .table-search i {
            margin-right: 8px;
            font-size: 12px;
        }

        .table-search input {
            border: none;
            outline: none;
            width: 100%;
            font-size: 11px;
        }

        .inquiry-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .inquiry-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        .inquiry-table th {
            background: #f8faff;
            color: #64748b;
            font-size: 9px;
            text-transform: uppercase;
            letter-spacing: .4px;
            font-weight: 500;
            padding: 12px 10px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
            white-space: nowrap;
        }

        .inquiry-table td {
            padding: 12px 10px;
            font-size: 10px;
            color: #334155;
            border-bottom: 1px solid #edf2f7;
            vertical-align: middle;
        }

        .inquiry-table tr:last-child td {
            border-bottom: none;
        }


        /* =========================================
           STUDENT
        ========================================= */

        .student-info {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .student-avatar-small {
            width: 28px;
            height: 28px;
            min-width: 28px;
            border-radius: 50%;
            background: #304fe8;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 9px;
            font-weight: 600;
        }

        .student-name {
            font-size: 10px;
            font-weight: 500;
            color: #334155;
        }

        .student-phone {
            font-size: 8px;
            color: #64748b;
            margin-top: 2px;
        }


        /* =========================================
           STATUS BADGES
        ========================================= */

        .badge {
            display: inline-block;
            padding: 4px 9px;
            border-radius: 20px;
            font-size: 8px;
            white-space: nowrap;
        }

        .badge-new {
            background: #ede9fe;
            color: #6d4aff;
        }

        .badge-contacted {
            background: #e0edff;
            color: #2563eb;
        }

        .badge-qualified {
            background: #dcfce7;
            color: #16a34a;
        }

        .badge-converted {
            background: #dff7f0;
            color: #0f766e;
        }


        /* =========================================
           PRIORITY
        ========================================= */

        .priority {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .priority-dot {
            width: 5px;
            height: 5px;
            border-radius: 50%;
        }

        .high-dot {
            background: #ef4444;
        }

        .medium-dot {
            background: #f59e0b;
        }

        .low-dot {
            background: #22c55e;
        }


        /* =========================================
           VIEW BUTTON
        ========================================= */

        .eye-button {
            width: 28px;
            height: 28px;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            border-radius: 6px;
            color: #64748b;
            cursor: pointer;

            transition: all 0.2s ease;
        }

        .eye-button:hover {
            background: #5746e8;
            border-color: #5746e8;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(87, 70, 232, 0.25);
        }


        /* =========================================
           TABLE FOOTER
        ========================================= */

        .table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 16px;
            border-top: 1px solid #e2e8f0;
        }

        .showing-text {
            font-size: 10px;
            color: #64748b;
        }

        .pagination {
            display: flex;
            gap: 5px;
        }

        .page-btn {
            width: 26px;
            height: 26px;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            border-radius: 5px;
            font-size: 10px;
            color: #475569;
            cursor: pointer;
        }

        .page-btn:hover {
            background: #f5f3ff;
            border-color: #c4b5fd;
        }

        .page-btn.active {
            background: #5746e8;
            color: #ffffff;
            border-color: #5746e8;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1000px) {

            .inquiry-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-row {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 650px) {

            .inquiry-stats {
                grid-template-columns: 1fr;
            }

            .filter-row {
                grid-template-columns: 1fr;
            }

            .inquiry-header {
                flex-direction: column;
                gap: 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="inquiry-page">


        <!-- =====================================
             PAGE HEADER
        ====================================== -->

        <div class="inquiry-header">

            <div class="inquiry-title">

                <h1>
                    Inquiry Monitoring &amp; Analytics
                </h1>

                <p>
                    System Admin Inquiry Oversight — Read-Only Monitoring &amp; Activity Metrics
                </p>

            </div>

            <div class="monitoring-badge">

                <i class="fa-solid fa-shield-halved"></i>

                Admin Monitoring Mode (Read-Only)

            </div>

        </div>


        <!-- =====================================
             STATISTICS
        ====================================== -->

        <div class="inquiry-stats">


            <!-- TOTAL INQUIRIES -->

            <div class="inquiry-stat-card">

                <div class="inquiry-stat-icon stat-purple">

                    <i class="fa-solid fa-inbox"></i>

                </div>

                <div>

                    <div class="inquiry-stat-label">
                        Total Inquiries
                    </div>

                    <div class="inquiry-stat-number">
                        284
                    </div>

                    <div class="inquiry-stat-change">
                        ↑ 12% this month
                    </div>

                </div>

            </div>


            <!-- NEW TODAY -->

            <div class="inquiry-stat-card">

                <div class="inquiry-stat-icon stat-blue">

                    <i class="fa-solid fa-star"></i>

                </div>

                <div>

                    <div class="inquiry-stat-label">
                        New Today
                    </div>

                    <div class="inquiry-stat-number">
                        42
                    </div>

                    <div class="inquiry-stat-change">
                        ● 8 added last 2 hrs
                    </div>

                </div>

            </div>


            <!-- COUNSELING PENDING -->

            <div class="inquiry-stat-card">

                <div class="inquiry-stat-icon stat-orange">

                    <i class="fa-solid fa-hourglass-half"></i>

                </div>

                <div>

                    <div class="inquiry-stat-label">
                        Counseling Pending
                    </div>

                    <div class="inquiry-stat-number">
                        58
                    </div>

                    <div class="inquiry-stat-change red">
                        <i class="fa-solid fa-user"></i>
                        Requires assignment
                    </div>

                </div>

            </div>


            <!-- CONVERTED -->

            <div class="inquiry-stat-card">

                <div class="inquiry-stat-icon stat-green">

                    <i class="fa-solid fa-circle-check"></i>

                </div>

                <div>

                    <div class="inquiry-stat-label">
                        Converted Admissions
                    </div>

                    <div class="inquiry-stat-number">
                        156
                    </div>

                    <div class="inquiry-stat-change">
                        ↗ 55% Conversion Rate
                    </div>

                </div>

            </div>


        </div>


        <!-- =====================================
             SEARCH & FILTER
        ====================================== -->

        <div class="filter-card">

            <div class="filter-header">

                <h3 class="filter-title">
                    Search &amp; Filter Inquiries
                </h3>

                <button type="button"
                        class="reset-btn">

                    <i class="fa-solid fa-rotate-right"></i>

                    Reset Filters

                </button>

            </div>


            <div class="filter-row">


                <!-- STATUS -->

                <div class="filter-group">

                    <label>
                        Status
                    </label>

                    <select class="filter-control">

                        <option>All Status</option>
                        <option>New</option>
                        <option>Contacted</option>
                        <option>Qualified</option>
                        <option>Converted</option>

                    </select>

                </div>


                <!-- COURSE -->

                <div class="filter-group">

                    <label>
                        Course Interest
                    </label>

                    <select class="filter-control">

                        <option>All Courses</option>
                        <option>B.Tech CSE</option>
                        <option>MBA Finance</option>
                        <option>BCA</option>
                        <option>B.Sc Data Science</option>

                    </select>

                </div>


                <!-- SOURCE -->

                <div class="filter-group">

                    <label>
                        Source
                    </label>

                    <select class="filter-control">

                        <option>All Sources</option>
                        <option>Website</option>
                        <option>Referral</option>
                        <option>Social Media</option>
                        <option>Walk-in</option>

                    </select>

                </div>


                <!-- DATE -->

                <div class="filter-group">

                    <label>
                        Date Range
                    </label>

                    <input type="date"
                           class="filter-control" />

                </div>


            </div>

        </div>


        <!-- =====================================
             INQUIRY TABLE
        ====================================== -->

        <div class="inquiry-table-card">


            <!-- SEARCH -->

            <div class="table-search-area">

                <div class="table-search">

                    <i class="fa-solid fa-magnifying-glass"></i>

                    <input type="text"
                           placeholder="Search by name, email, phone..." />

                </div>

            </div>


            <div class="inquiry-table-wrapper">

                <table class="inquiry-table">

                    <thead>

                        <tr>

                            <th>
                                Inquiry ID
                            </th>

                            <th>
                                Student Details
                            </th>

                            <th>
                                Course Interest
                            </th>

                            <th>
                                Source
                            </th>

                            <th>
                                Status
                            </th>

                            <th>
                                Priority
                            </th>

                            <th>
                                Assigned Counselor
                            </th>

                            <th>
                                Inquiry Date
                            </th>

                            <th>
                                Action
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <!-- =====================================
                             RAJESH
                        ====================================== -->

                        <tr>

                            <td>
                                #INQ-2024-001
                            </td>

                            <td>

                                <div class="student-info">

                                    <div class="student-avatar-small">
                                        RK
                                    </div>

                                    <div>

                                        <div class="student-name">
                                            Rajesh Kumar
                                        </div>

                                        <div class="student-phone">
                                            +91 98765 43210
                                        </div>

                                    </div>

                                </div>

                            </td>

                            <td>
                                B.Tech CSE
                            </td>

                            <td>
                                Website
                            </td>

                            <td>

                                <span class="badge badge-new">
                                    ● New
                                </span>

                            </td>

                            <td>

                                <div class="priority">

                                    <span class="priority-dot high-dot"></span>

                                    High

                                </div>

                            </td>

                            <td>
                                Sarah Patel
                            </td>

                            <td>
                                Dec 15, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="eye-button"
                                        onclick="window.location.href='<%= ResolveUrl("~/Admin/InquiryDetails.aspx?id=INQ-2024-001") %>';"
                                        title="View Inquiry">

                                    <i class="fa-solid fa-eye"></i>

                                </button>

                            </td>

                        </tr>


                        <!-- =====================================
                             PRIYA
                        ====================================== -->

                        <tr>

                            <td>
                                #INQ-2024-002
                            </td>

                            <td>

                                <div class="student-info">

                                    <div class="student-avatar-small">
                                        PS
                                    </div>

                                    <div>

                                        <div class="student-name">
                                            Priya Sharma
                                        </div>

                                        <div class="student-phone">
                                            +91 98765 43211
                                        </div>

                                    </div>

                                </div>

                            </td>

                            <td>
                                MBA Finance
                            </td>

                            <td>
                                Referral
                            </td>

                            <td>

                                <span class="badge badge-contacted">
                                    ● Contacted
                                </span>

                            </td>

                            <td>

                                <div class="priority">

                                    <span class="priority-dot medium-dot"></span>

                                    Medium

                                </div>

                            </td>

                            <td>
                                Rahul Gupta
                            </td>

                            <td>
                                Dec 14, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="eye-button"
                                        onclick="window.location.href='<%= ResolveUrl("~/Admin/InquiryDetails.aspx?id=INQ-2024-002") %>';"
                                        title="View Inquiry">

                                    <i class="fa-solid fa-eye"></i>

                                </button>

                            </td>

                        </tr>


                        <!-- =====================================
                             AMIT
                        ====================================== -->

                        <tr>

                            <td>
                                #INQ-2024-003
                            </td>

                            <td>

                                <div class="student-info">

                                    <div class="student-avatar-small">
                                        AV
                                    </div>

                                    <div>

                                        <div class="student-name">
                                            Amit Verma
                                        </div>

                                        <div class="student-phone">
                                            +91 98765 43212
                                        </div>

                                    </div>

                                </div>

                            </td>

                            <td>
                                BCA
                            </td>

                            <td>
                                Social Media
                            </td>

                            <td>

                                <span class="badge badge-qualified">
                                    ● Qualified
                                </span>

                            </td>

                            <td>

                                <div class="priority">

                                    <span class="priority-dot high-dot"></span>

                                    High

                                </div>

                            </td>

                            <td>
                                Meera Patel
                            </td>

                            <td>
                                Dec 14, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="eye-button"
                                        onclick="window.location.href='<%= ResolveUrl("~/Admin/InquiryDetails.aspx?id=INQ-2024-003") %>';"
                                        title="View Inquiry">

                                    <i class="fa-solid fa-eye"></i>

                                </button>

                            </td>

                        </tr>


                        <!-- =====================================
                             SNEHA
                        ====================================== -->

                        <tr>

                            <td>
                                #INQ-2024-004
                            </td>

                            <td>

                                <div class="student-info">

                                    <div class="student-avatar-small">
                                        SK
                                    </div>

                                    <div>

                                        <div class="student-name">
                                            Sneha Kapoor
                                        </div>

                                        <div class="student-phone">
                                            +91 98765 43213
                                        </div>

                                    </div>

                                </div>

                            </td>

                            <td>
                                B.Sc Data Science
                            </td>

                            <td>
                                Walk-in
                            </td>

                            <td>

                                <span class="badge badge-converted">
                                    ● Converted
                                </span>

                            </td>

                            <td>

                                <div class="priority">

                                    <span class="priority-dot low-dot"></span>

                                    Low

                                </div>

                            </td>

                            <td>
                                Sarah Patel
                            </td>

                            <td>
                                Dec 13, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="eye-button"
                                        onclick="window.location.href='<%= ResolveUrl("~/Admin/InquiryDetails.aspx?id=INQ-2024-004") %>';"
                                        title="View Inquiry">

                                    <i class="fa-solid fa-eye"></i>

                                </button>

                            </td>

                        </tr>


                    </tbody>

                </table>

            </div>


            <!-- =====================================
                 TABLE FOOTER
            ====================================== -->

            <div class="table-footer">

                <div class="showing-text">
                    Showing 1-4 of 284 inquiries
                </div>

                <div class="pagination">

                    <button type="button"
                            class="page-btn">
                        ‹
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
                        ›
                    </button>

                </div>

            </div>


        </div>


    </div>


</asp:Content>