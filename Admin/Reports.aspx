<%@ Page Title="Reports"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="EduCRM.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .reports-page {
            padding: 24px;
        }

        /* =========================
           PAGE HEADER
           ========================= */

        .reports-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .reports-title h1 {
            margin: 0;
            font-size: 25px;
            font-weight: 700;
            color: #1f2937;
        }

        .reports-title p {
            margin: 5px 0 0;
            color: #6b7280;
            font-size: 13px;
        }

        /* =========================
           STAT CARDS
           ========================= */

        .reports-stats {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
            margin-bottom: 22px;
        }

        .report-stat {
            background: #ffffff;
            border: 1px solid #e4e8ef;
            border-radius: 8px;
            padding: 16px;
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .report-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
            border-color: #c7d2fe;
        }

        .report-stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .report-stat-label {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 7px;
        }

        .report-stat-value {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
        }

        .report-stat-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
        }

        .icon-blue {
            background: #eef2ff;
            color: #4f46e5;
        }

        .icon-green {
            background: #ecfdf5;
            color: #059669;
        }

        .icon-orange {
            background: #fff7ed;
            color: #ea580c;
        }

        .icon-purple {
            background: #f5f3ff;
            color: #7c3aed;
        }

        .icon-red {
            background: #fef2f2;
            color: #dc2626;
        }

        /* =========================
           FILTER CARD
           ========================= */

        .report-filter-card {
            background: #ffffff;
            border: 1px solid #e4e8ef;
            border-radius: 8px;
            padding: 18px;
            margin-bottom: 22px;
            transition: box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .report-filter-card:hover {
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.07);
            border-color: #d8def0;
        }

        .filter-title {
            font-size: 15px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 15px;
        }

        .filter-row {
            display: grid;
            grid-template-columns: 1fr 1fr auto;
            gap: 15px;
            align-items: end;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            font-size: 12px;
            font-weight: 600;
            color: #4b5563;
            margin-bottom: 7px;
        }

        .filter-group select {
            height: 40px;
            border: 1px solid #d9dee8;
            border-radius: 6px;
            padding: 0 12px;
            font-size: 13px;
            color: #374151;
            background: #ffffff;
            outline: none;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .filter-group select:hover {
            border-color: #aeb8d4;
        }

        .filter-group select:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.10);
        }

        .generate-btn {
            height: 40px;
            padding: 0 18px;
            border: none;
            border-radius: 6px;
            background: #4f57d5;
            color: white;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }

        .generate-btn:hover {
            transform: translateY(-2px);
            background: #424ac0;
            box-shadow: 0 7px 16px rgba(79, 87, 213, 0.25);
        }

        /* =========================
           REPORT CONTENT
           ========================= */

        .report-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 20px;
            margin-bottom: 22px;
        }

        .report-card {
            background: #ffffff;
            border: 1px solid #e4e8ef;
            border-radius: 8px;
            overflow: hidden;
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .report-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.08);
            border-color: #d8def0;
        }

        .report-card-header {
            padding: 17px 18px;
            border-bottom: 1px solid #edf0f4;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .report-card-header h3 {
            margin: 0;
            font-size: 15px;
            font-weight: 600;
            color: #1f2937;
        }

        .report-card-header span {
            font-size: 11px;
            color: #6b7280;
        }

        .report-card-body {
            padding: 20px;
        }

        /* =========================
           BAR CHART
           ========================= */

        .bar-chart {
            height: 245px;
            display: flex;
            align-items: flex-end;
            justify-content: space-around;
            gap: 18px;
            padding: 10px 10px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .bar-item {
            height: 100%;
            flex: 1;
            max-width: 65px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-end;
        }

        .bar-value {
            font-size: 11px;
            color: #4b5563;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .bar {
            width: 100%;
            max-width: 42px;
            background: #6366f1;
            border-radius: 5px 5px 0 0;
            transition:
                transform 0.2s ease,
                opacity 0.2s ease;
        }

        .bar:hover {
            transform: scaleY(1.04);
            opacity: 0.82;
        }

        .bar-label {
            margin-top: 8px;
            font-size: 10px;
            color: #6b7280;
        }

        /* =========================
           SUMMARY
           ========================= */

        .summary-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .summary-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 13px;
            border-bottom: 1px solid #edf0f4;
        }

        .summary-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .summary-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .summary-dot {
            width: 9px;
            height: 9px;
            border-radius: 50%;
            background: #6366f1;
        }

        .summary-name {
            font-size: 12px;
            color: #4b5563;
        }

        .summary-number {
            font-size: 13px;
            font-weight: 700;
            color: #1f2937;
        }

        /* =========================
           TABLE
           ========================= */

        .report-table-card {
            background: #ffffff;
            border: 1px solid #e4e8ef;
            border-radius: 8px;
            overflow: hidden;
            transition:
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .report-table-card:hover {
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.07);
            border-color: #d8def0;
        }

        .report-table {
            width: 100%;
            border-collapse: collapse;
        }

        .report-table th {
            text-align: left;
            padding: 13px 17px;
            background: #f8fafc;
            color: #6b7280;
            font-size: 11px;
            font-weight: 600;
            border-bottom: 1px solid #e5e7eb;
        }

        .report-table td {
            padding: 14px 17px;
            font-size: 12px;
            color: #374151;
            border-bottom: 1px solid #edf0f4;
        }

        .report-table tr:last-child td {
            border-bottom: none;
        }

        .report-table tbody tr {
            transition: background 0.2s ease;
        }

        .report-table tbody tr:hover {
            background: #f8faff;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 600;
        }

        .status-completed {
            background: #dcfce7;
            color: #16a34a;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-review {
            background: #dbeafe;
            color: #2563eb;
        }

        .status-rejected {
            background: #fee2e2;
            color: #dc2626;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 1100px) {
            .reports-stats {
                grid-template-columns: repeat(3, 1fr);
            }

            .report-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 750px) {
            .reports-page {
                padding: 15px;
            }

            .reports-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .reports-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-row {
                grid-template-columns: 1fr;
            }

            .generate-btn {
                width: 100%;
            }

            .report-table {
                min-width: 700px;
            }

            .report-table-card {
                overflow-x: auto;
            }
        }

        @media (max-width: 480px) {
            .reports-stats {
                grid-template-columns: 1fr;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="reports-page">

        <!-- =========================
             PAGE HEADER
             ========================= -->

        <div class="reports-header">

            <div class="reports-title">
                <h1>Reports</h1>
                <p>View and analyze your institute's performance reports.</p>
            </div>

        </div>


        <!-- =========================
             STATISTICS
             ========================= -->

        <div class="reports-stats">

            <div class="report-stat">

                <div class="report-stat-top">

                    <div>
                        <div class="report-stat-label">
                            Total Applications
                        </div>

                        <div class="report-stat-value">
                            1,254
                        </div>
                    </div>

                    <div class="report-stat-icon icon-blue">
                        <i class="fas fa-file-alt"></i>
                    </div>

                </div>

            </div>


            <div class="report-stat">

                <div class="report-stat-top">

                    <div>
                        <div class="report-stat-label">
                            Total Students
                        </div>

                        <div class="report-stat-value">
                            456
                        </div>
                    </div>

                    <div class="report-stat-icon icon-green">
                        <i class="fas fa-user-graduate"></i>
                    </div>

                </div>

            </div>


            <div class="report-stat">

                <div class="report-stat-top">

                    <div>
                        <div class="report-stat-label">
                            Total Courses
                        </div>

                        <div class="report-stat-value">
                            24
                        </div>
                    </div>

                    <div class="report-stat-icon icon-orange">
                        <i class="fas fa-book"></i>
                    </div>

                </div>

            </div>


            <div class="report-stat">

                <div class="report-stat-top">

                    <div>
                        <div class="report-stat-label">
                            Counseling Sessions
                        </div>

                        <div class="report-stat-value">
                            328
                        </div>
                    </div>

                    <div class="report-stat-icon icon-purple">
                        <i class="fas fa-comments"></i>
                    </div>

                </div>

            </div>


            <div class="report-stat">

                <div class="report-stat-top">

                    <div>
                        <div class="report-stat-label">
                            Pending Follow-ups
                        </div>

                        <div class="report-stat-value">
                            52
                        </div>
                    </div>

                    <div class="report-stat-icon icon-red">
                        <i class="fas fa-clock"></i>
                    </div>

                </div>

            </div>

        </div>


        <!-- =========================
             REPORT FILTER
             ========================= -->

        <div class="report-filter-card">

            <div class="filter-title">
                Generate Report
            </div>

            <div class="filter-row">

                <div class="filter-group">

                    <label for="reportType">
                        Report Type
                    </label>

                    <select id="reportType">

                        <option value="Application Report">
                            Application Report
                        </option>

                        <option value="Student Report">
                            Student Report
                        </option>

                        <option value="Course Report">
                            Course Report
                        </option>

                        <option value="Counseling Report">
                            Counseling Report
                        </option>

                        <option value="Follow-up Report">
                            Follow-up Report
                        </option>

                    </select>

                </div>


                <div class="filter-group">

                    <label for="reportPeriod">
                        Date Range
                    </label>

                    <select id="reportPeriod">

                        <option value="This Month">
                            This Month
                        </option>

                        <option value="Last Month">
                            Last Month
                        </option>

                        <option value="Last 3 Months">
                            Last 3 Months
                        </option>

                        <option value="This Year">
                            This Year
                        </option>

                        <option value="All Time">
                            All Time
                        </option>

                    </select>

                </div>


                <button type="button"
                        class="generate-btn"
                        onclick="generateReport();">

                    <i class="fas fa-chart-bar"></i>

                    &nbsp;

                    Generate Report

                </button>

            </div>

        </div>


        <!-- =========================
             REPORT CHART + SUMMARY
             ========================= -->

        <div class="report-grid">


            <!-- APPLICATION CHART -->

            <div class="report-card">

                <div class="report-card-header">

                    <h3>
                        Applications Overview
                    </h3>

                    <span>
                        Last 6 Months
                    </span>

                </div>


                <div class="report-card-body">

                    <div class="bar-chart">

                        <div class="bar-item">

                            <div class="bar-value">
                                148
                            </div>

                            <div class="bar"
                                 style="height: 55%;">
                            </div>

                            <div class="bar-label">
                                Jul
                            </div>

                        </div>


                        <div class="bar-item">

                            <div class="bar-value">
                                172
                            </div>

                            <div class="bar"
                                 style="height: 64%;">
                            </div>

                            <div class="bar-label">
                                Aug
                            </div>

                        </div>


                        <div class="bar-item">

                            <div class="bar-value">
                                196
                            </div>

                            <div class="bar"
                                 style="height: 73%;">
                            </div>

                            <div class="bar-label">
                                Sep
                            </div>

                        </div>


                        <div class="bar-item">

                            <div class="bar-value">
                                214
                            </div>

                            <div class="bar"
                                 style="height: 80%;">
                            </div>

                            <div class="bar-label">
                                Oct
                            </div>

                        </div>


                        <div class="bar-item">

                            <div class="bar-value">
                                238
                            </div>

                            <div class="bar"
                                 style="height: 89%;">
                            </div>

                            <div class="bar-label">
                                Nov
                            </div>

                        </div>


                        <div class="bar-item">

                            <div class="bar-value">
                                286
                            </div>

                            <div class="bar"
                                 style="height: 100%;">
                            </div>

                            <div class="bar-label">
                                Dec
                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- SUMMARY -->

            <div class="report-card">

                <div class="report-card-header">

                    <h3>
                        Application Summary
                    </h3>

                    <span>
                        Current
                    </span>

                </div>


                <div class="report-card-body">

                    <div class="summary-list">


                        <div class="summary-item">

                            <div class="summary-left">

                                <div class="summary-dot"></div>

                                <div class="summary-name">
                                    Approved
                                </div>

                            </div>

                            <div class="summary-number">
                                742
                            </div>

                        </div>


                        <div class="summary-item">

                            <div class="summary-left">

                                <div class="summary-dot"></div>

                                <div class="summary-name">
                                    Under Review
                                </div>

                            </div>

                            <div class="summary-number">
                                236
                            </div>

                        </div>


                        <div class="summary-item">

                            <div class="summary-left">

                                <div class="summary-dot"></div>

                                <div class="summary-name">
                                    New Applications
                                </div>

                            </div>

                            <div class="summary-number">
                                128
                            </div>

                        </div>


                        <div class="summary-item">

                            <div class="summary-left">

                                <div class="summary-dot"></div>

                                <div class="summary-name">
                                    Rejected
                                </div>

                            </div>

                            <div class="summary-number">
                                148
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- =========================
             RECENT REPORT DATA
             ========================= -->

        <div class="report-table-card">

            <div class="report-card-header">

                <h3>
                    Recent Report Data
                </h3>

                <span>
                    Latest Applications
                </span>

            </div>


            <table class="report-table">

                <thead>

                    <tr>

                        <th>
                            Student Name
                        </th>

                        <th>
                            Course
                        </th>

                        <th>
                            Application Date
                        </th>

                        <th>
                            Status
                        </th>

                        <th>
                            Counselor
                        </th>

                    </tr>

                </thead>


                <tbody>


                    <tr>

                        <td>
                            Rajesh Kumar
                        </td>

                        <td>
                            B.Tech CSE
                        </td>

                        <td>
                            Dec 15, 2024
                        </td>

                        <td>

                            <span class="status-badge status-completed">
                                Approved
                            </span>

                        </td>

                        <td>
                            Sarah Patel
                        </td>

                    </tr>


                    <tr>

                        <td>
                            Priya Sharma
                        </td>

                        <td>
                            MBA Finance
                        </td>

                        <td>
                            Dec 15, 2024
                        </td>

                        <td>

                            <span class="status-badge status-pending">
                                Pending Review
                            </span>

                        </td>

                        <td>
                            Rahul Gupta
                        </td>

                    </tr>


                    <tr>

                        <td>
                            Amit Verma
                        </td>

                        <td>
                            BCA
                        </td>

                        <td>
                            Dec 14, 2024
                        </td>

                        <td>

                            <span class="status-badge status-review">
                                Under Review
                            </span>

                        </td>

                        <td>
                            Meera Patel
                        </td>

                    </tr>


                    <tr>

                        <td>
                            Sneha Kapoor
                        </td>

                        <td>
                            B.Sc Physics
                        </td>

                        <td>
                            Dec 14, 2024
                        </td>

                        <td>

                            <span class="status-badge status-completed">
                                Approved
                            </span>

                        </td>

                        <td>
                            Sarah Patel
                        </td>

                    </tr>


                </tbody>

            </table>

        </div>

    </div>


    <!-- =========================
         GENERATE REPORT SCRIPT
         ========================= -->

    <script type="text/javascript">

        function generateReport() {

            var reportTypeElement =
                document.getElementById("reportType");

            var reportPeriodElement =
                document.getElementById("reportPeriod");

            if (!reportTypeElement || !reportPeriodElement) {
                alert("Report options could not be loaded.");
                return;
            }

            var reportType =
                reportTypeElement.value;

            var reportPeriod =
                reportPeriodElement.value;

            alert(
                "Report Generated Successfully!\n\n" +
                "Report Type: " +
                reportType +
                "\n" +
                "Date Range: " +
                reportPeriod +
                "\n\n" +
                "Your report is ready to view."
            );

        }

    </script>

</asp:Content>