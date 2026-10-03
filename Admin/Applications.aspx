<%@ Page Title="Applications"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Applications.aspx.cs"
    Inherits="EduCRM.Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================
           MAIN PAGE
        ========================= */

        .applications-page {
            padding: 25px;
        }

        .applications-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .applications-title h1 {
            margin: 0;
            font-size: 26px;
            font-weight: 700;
            color: #1e293b;
        }

        .applications-title p {
            margin: 6px 0 0;
            color: #64748b;
            font-size: 13px;
        }

        .app-btn {
            background: #5746e8;
            color: white;
            border: none;
            border-radius: 7px;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .app-btn:hover {
            background: #4635d0;
            transform: translateY(-2px);
            box-shadow: 0 6px 14px rgba(87, 70, 232, 0.25);
        }


        /* =========================
           STATISTICS
        ========================= */

        .app-stats {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
            margin-bottom: 22px;
        }

        .app-stat {
            background: white;
            border: 1px solid #e4e8ef;
            border-radius: 8px;
            padding: 15px;
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .app-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
            border-color: #c7d2fe;
        }

        .app-stat-title {
            color: #64748b;
            font-size: 12px;
            margin-bottom: 8px;
        }

        .app-stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #1e293b;
        }


        /* =========================
           APPLICATION CARD
        ========================= */

        .app-card {
            background: white;
            border: 1px solid #e4e8ef;
            border-radius: 10px;
            overflow: hidden;
            transition:
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .app-card:hover {
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
            border-color: #d8def0;
        }


        /* =========================
           FILTER AREA
        ========================= */

        .filter-area {
            display: flex;
            gap: 12px;
            padding: 18px;
            border-bottom: 1px solid #e5e7eb;
        }

        .search-box {
            flex: 1;
        }

        .search-box input,
        .filter-select {
            width: 100%;
            height: 38px;
            border: 1px solid #d8dee8;
            border-radius: 6px;
            padding: 0 12px;
            font-size: 13px;
            outline: none;
            box-sizing: border-box;
        }

        .search-box input:focus,
        .filter-select:focus {
            border-color: #5746e8;
            box-shadow: 0 0 0 3px rgba(87, 70, 232, 0.08);
        }

        .filter-select {
            width: 180px;
            background: white;
        }


        /* =========================
           TABLE
        ========================= */

        .app-table-wrapper {
            overflow-x: auto;
        }

        .app-table {
            width: 100%;
            border-collapse: collapse;
        }

        .app-table th {
            background: #f8fafc;
            color: #64748b;
            font-size: 12px;
            font-weight: 600;
            text-align: left;
            padding: 14px 16px;
            border-bottom: 1px solid #e5e7eb;
        }

        .app-table td {
            padding: 15px 16px;
            font-size: 13px;
            color: #334155;
            border-bottom: 1px solid #eef1f5;
        }

        .app-table tr:last-child td {
            border-bottom: none;
        }

        .app-table tbody tr {
            transition: background 0.2s ease;
        }

        .app-table tbody tr:hover {
            background: #fafbff;
        }

        .student-name {
            font-weight: 600;
            color: #1e293b;
        }

        .application-id {
            color: #5746e8;
            font-weight: 600;
        }


        /* =========================
           STATUS
        ========================= */

        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }

        .status-approved {
            background: #dcfce7;
            color: #16a34a;
        }

        .status-review {
            background: #dbeafe;
            color: #2563eb;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-rejected {
            background: #fee2e2;
            color: #dc2626;
        }


        /* =========================
           ACTION BUTTONS
        ========================= */

        .action-buttons {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .action {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            border: 1px solid #dbe1ea;
            background: white;
            color: #64748b;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .action:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(15, 23, 42, 0.10);
        }

        .view-action:hover {
            background: #5746e8;
            border-color: #5746e8;
            color: white;
        }

        .delete-action {
            color: #dc2626;
        }

        .delete-action:hover {
            background: #fee2e2;
            border-color: #fecaca;
            color: #dc2626;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1000px) {
            .app-stats {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 700px) {
            .applications-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .app-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-area {
                flex-direction: column;
            }

            .filter-select {
                width: 100%;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="applications-page">

        <!-- =========================
             HEADER
        ========================= -->

        <div class="applications-header">

            <div class="applications-title">
                <h1>Applications</h1>
                <p>Manage and review student applications</p>
            </div>

            <button class="app-btn"
                    type="button"
                    onclick="window.location.href='<%= ResolveUrl("~/Admin/NewApplication.aspx") %>';">
                <i class="fas fa-plus"></i>
                &nbsp; New Application
            </button>

        </div>


        <!-- =========================
             STATISTICS
        ========================= -->

        <div class="app-stats">

            <div class="app-stat">
                <div class="app-stat-title">Total Applications</div>
                <div class="app-stat-number">1,254</div>
            </div>

            <div class="app-stat">
                <div class="app-stat-title">New Applications</div>
                <div class="app-stat-number">128</div>
            </div>

            <div class="app-stat">
                <div class="app-stat-title">Under Review</div>
                <div class="app-stat-number">236</div>
            </div>

            <div class="app-stat">
                <div class="app-stat-title">Approved</div>
                <div class="app-stat-number">742</div>
            </div>

            <div class="app-stat">
                <div class="app-stat-title">Rejected</div>
                <div class="app-stat-number">148</div>
            </div>

        </div>


        <!-- =========================
             APPLICATION CARD
        ========================= -->

        <div class="app-card">

            <!-- FILTERS -->

            <div class="filter-area">

                <div class="search-box">
                    <input type="text"
                           placeholder="Search applications..." />
                </div>

                <select class="filter-select">
                    <option value="">All Status</option>
                    <option>Approved</option>
                    <option>Under Review</option>
                    <option>Pending</option>
                    <option>Rejected</option>
                </select>

                <select class="filter-select">
                    <option value="">All Courses</option>
                    <option>Computer Engineering</option>
                    <option>Information Technology</option>
                    <option>Data Science</option>
                    <option>Business Management</option>
                </select>

            </div>


            <!-- TABLE -->

            <div class="app-table-wrapper">

                <table class="app-table">

                    <thead>
                        <tr>

                            <th>Student</th>

                            <th>Application ID</th>

                            <th>Course</th>

                            <th>Application Date</th>

                            <th>Status</th>

                            <th>Action</th>

                        </tr>
                    </thead>


                    <tbody>

                        <!-- APPLICATION 1 -->

                        <tr>

                            <td>
                                <span class="student-name">
                                    Aarav Shah
                                </span>
                            </td>

                            <td>
                                <span class="application-id">
                                    APP-10254
                                </span>
                            </td>

                            <td>
                                Computer Engineering
                            </td>

                            <td>
                                28 Sep 2026
                            </td>

                            <td>
                                <span class="status-badge status-approved">
                                    Approved
                                </span>
                            </td>

                            <td>

                                <div class="action-buttons">

                                    <!-- VIEW -->

                                    <button type="button"
                                            class="action view-action"
                                            title="View"
                                            onclick="window.location.href='<%= ResolveUrl("~/Admin/ApplicationDetails.aspx?id=APP-10254") %>';">
                                        <i class="fas fa-eye"></i>
                                    </button>

                                    <!-- DELETE -->

                                    <button type="button"
                                            class="action delete-action"
                                            title="Delete"
                                            onclick="deleteApplication('APP-10254');">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                </div>

                            </td>

                        </tr>


                        <!-- APPLICATION 2 -->

                        <tr>

                            <td>
                                <span class="student-name">
                                    Priya Shah
                                </span>
                            </td>

                            <td>
                                <span class="application-id">
                                    APP-10253
                                </span>
                            </td>

                            <td>
                                Information Technology
                            </td>

                            <td>
                                27 Sep 2026
                            </td>

                            <td>
                                <span class="status-badge status-review">
                                    Under Review
                                </span>
                            </td>

                            <td>

                                <div class="action-buttons">

                                    <!-- VIEW -->

                                    <button type="button"
                                            class="action view-action"
                                            title="View"
                                            onclick="window.location.href='<%= ResolveUrl("~/Admin/ApplicationDetails.aspx?id=APP-10253") %>';">
                                        <i class="fas fa-eye"></i>
                                    </button>

                                    <!-- DELETE -->

                                    <button type="button"
                                            class="action delete-action"
                                            title="Delete"
                                            onclick="deleteApplication('APP-10253');">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                </div>

                            </td>

                        </tr>


                        <!-- APPLICATION 3 -->

                        <tr>

                            <td>
                                <span class="student-name">
                                    Rahul Mehta
                                </span>
                            </td>

                            <td>
                                <span class="application-id">
                                    APP-10252
                                </span>
                            </td>

                            <td>
                                Data Science
                            </td>

                            <td>
                                26 Sep 2026
                            </td>

                            <td>
                                <span class="status-badge status-pending">
                                    Pending
                                </span>
                            </td>

                            <td>

                                <div class="action-buttons">

                                    <!-- VIEW -->

                                    <button type="button"
                                            class="action view-action"
                                            title="View"
                                            onclick="window.location.href='<%= ResolveUrl("~/Admin/ApplicationDetails.aspx?id=APP-10252") %>';">
                                        <i class="fas fa-eye"></i>
                                    </button>

                                    <!-- DELETE -->

                                    <button type="button"
                                            class="action delete-action"
                                            title="Delete"
                                            onclick="deleteApplication('APP-10252');">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                </div>

                            </td>

                        </tr>


                        <!-- APPLICATION 4 -->

                        <tr>

                            <td>
                                <span class="student-name">
                                    Neha Kapoor
                                </span>
                            </td>

                            <td>
                                <span class="application-id">
                                    APP-10251
                                </span>
                            </td>

                            <td>
                                Business Management
                            </td>

                            <td>
                                25 Sep 2026
                            </td>

                            <td>
                                <span class="status-badge status-rejected">
                                    Rejected
                                </span>
                            </td>

                            <td>

                                <div class="action-buttons">

                                    <!-- VIEW -->

                                    <button type="button"
                                            class="action view-action"
                                            title="View"
                                            onclick="window.location.href='<%= ResolveUrl("~/Admin/ApplicationDetails.aspx?id=APP-10251") %>';">
                                        <i class="fas fa-eye"></i>
                                    </button>

                                    <!-- DELETE -->

                                    <button type="button"
                                            class="action delete-action"
                                            title="Delete"
                                            onclick="deleteApplication('APP-10251');">
                                        <i class="fas fa-trash"></i>
                                    </button>

                                </div>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>


    <!-- =========================
         DELETE SCRIPT
    ========================= -->

    <script>

function deleteApplication(applicationId) {

    var confirmDelete = confirm(
        "Are you sure you want to delete application " +
        applicationId +
        "?"
    );

    if (confirmDelete) {

        alert(
            "Application " +
            applicationId +
            " deleted successfully."
        );

        // This is currently a demo/static page.
        // Database deletion can be connected later.

    }

}

</script>

</asp:Content>