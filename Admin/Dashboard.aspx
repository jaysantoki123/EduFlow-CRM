<%@ Page Title="Dashboard"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="EduCRM.WebForm1" %>


<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">

<style>

    .stat-card {
        transition: transform 0.2s ease,
                    box-shadow 0.2s ease;
        cursor: pointer;
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.10);
    }

</style>


<div class="dashboard-page">


    <div class="dashboard-page">


        <!-- =====================================
             DASHBOARD HEADER
        ====================================== -->

        <div class="dashboard-header">

            <div class="dashboard-title">

                <h1>
                    Welcome back, Admin!
                </h1>

                <p>
                    Here's what's happening with your institution today.
                </p>

            </div>


            <button type="button" 
        class="download-btn"
        onclick="alert('Report downloaded successfully!');"> 

    <i class="fa-solid fa-download"></i> 

    Download Report 

</button>

        </div>



        <!-- =====================================
             FIRST 4 STATISTICS
        ====================================== -->

        <div class="stats-grid">


            <!-- TOTAL INQUIRIES -->

            <div class="stat-card">

                <div class="stat-icon icon-purple">

                    <i class="fa-solid fa-clipboard-list"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Inquiries
                    </div>

                    <div class="stat-value">
                        1,284
                    </div>

                    <div class="stat-change">
                        ↑ 12.5% from last month
                    </div>

                </div>

            </div>



            <!-- TOTAL APPLICATIONS -->

            <div class="stat-card">

                <div class="stat-icon icon-blue">

                    <i class="fa-solid fa-file-lines"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Applications
                    </div>

                    <div class="stat-value">
                        964
                    </div>

                    <div class="stat-change">
                        ↑ 9.4% from last month
                    </div>

                </div>

            </div>



            <!-- TOTAL ADMISSIONS -->

            <div class="stat-card">

                <div class="stat-icon icon-green">

                    <i class="fa-solid fa-user-check"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Admissions
                    </div>

                    <div class="stat-value">
                        856
                    </div>

                    <div class="stat-change">
                        ↑ 8.3% from last month
                    </div>

                </div>

            </div>



            <!-- TOTAL STUDENTS -->

            <div class="stat-card">

                <div class="stat-icon icon-violet">

                    <i class="fa-solid fa-user-graduate"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Students
                    </div>

                    <div class="stat-value">
                        3,420
                    </div>

                    <div class="stat-change">
                        ↑ 15.2% YoY Growth
                    </div>

                </div>

            </div>


        </div>



        <!-- =====================================
             SECOND 3 STATISTICS
        ====================================== -->

        <div class="stats-grid second-row">


            <!-- TOTAL USERS -->

            <div class="stat-card">

                <div class="stat-icon icon-blue">

                    <i class="fa-solid fa-users-gear"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Users
                    </div>

                    <div class="stat-value">
                        48
                    </div>

                    <div class="stat-change">
                        ↑ 3 System Roles (Admin, Manager, Counselor)
                    </div>

                </div>

            </div>



            <!-- TOTAL COUNSELORS -->

            <div class="stat-card">

                <div class="stat-icon icon-purple">

                    <i class="fa-solid fa-user-tie"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Total Counselors
                    </div>

                    <div class="stat-value">
                        24
                    </div>

                    <div class="stat-change">
                        ↑ 2 new this week
                    </div>

                </div>

            </div>



            <!-- PENDING FOLLOW-UPS -->

            <div class="stat-card">

                <div class="stat-icon icon-orange">

                    <i class="fa-solid fa-clock"></i>

                </div>

                <div class="stat-info">

                    <div class="stat-label">
                        Pending Follow-ups
                    </div>

                    <div class="stat-value">
                        47
                    </div>

                    <div class="stat-change red">
                        ↓ 3.2% from yesterday
                    </div>

                </div>

            </div>


        </div>



        <!-- =====================================
             RECENT APPLICATIONS
        ====================================== -->

        <div class="applications-card">


            <div class="applications-header">

                <div>

                    <h3 class="applications-title">
                        Recent Applications
                    </h3>

                    <div class="applications-subtitle">
                        Latest application submissions
                    </div>

                </div>


                <a href="#" class="view-all">
                    View All
                </a>

            </div>



            <div class="application-table-wrapper">

                <table class="application-table">

                    <thead>

                        <tr>

                            <th>
                                STUDENT NAME
                            </th>

                            <th>
                                COURSE
                            </th>

                            <th>
                                STATUS
                            </th>

                            <th>
                                DATE
                            </th>

                            <th>
                                ACTION
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <!-- RAJESH -->

                        <tr>

                            <td>

                                <div class="student-cell">

                                    <div class="student-avatar">
                                        RK
                                    </div>

                                    <span>
                                        Rajesh Kumar
                                    </span>

                                </div>

                            </td>

                            <td>
                                B.Tech CSE
                            </td>

                            <td>

                                <span class="status approved">
                                    Approved
                                </span>

                            </td>

                            <td>
                                Dec 15, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="view-button">
                                    View
                                </button>

                            </td>

                        </tr>



                        <!-- PRIYA -->

                        <tr>

                            <td>

                                <div class="student-cell">

                                    <div class="student-avatar">
                                        PS
                                    </div>

                                    <span>
                                        Priya Sharma
                                    </span>

                                </div>

                            </td>

                            <td>
                                MBA Finance
                            </td>

                            <td>

                                <span class="status pending">
                                    Pending Review
                                </span>

                            </td>

                            <td>
                                Dec 15, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="view-button">
                                    View
                                </button>

                            </td>

                        </tr>



                        <!-- AMIT -->

                        <tr>

                            <td>

                                <div class="student-cell">

                                    <div class="student-avatar">
                                        AV
                                    </div>

                                    <span>
                                        Amit Verma
                                    </span>

                                </div>

                            </td>

                            <td>
                                BCA
                            </td>

                            <td>

                                <span class="status review">
                                    Under Review
                                </span>

                            </td>

                            <td>
                                Dec 14, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="view-button">
                                    View
                                </button>

                            </td>

                        </tr>



                        <!-- SNEHA -->

                        <tr>

                            <td>

                                <div class="student-cell">

                                    <div class="student-avatar">
                                        SK
                                    </div>

                                    <span>
                                        Sneha Kapoor
                                    </span>

                                </div>

                            </td>

                            <td>
                                B.Sc Physics
                            </td>

                            <td>

                                <span class="status approved">
                                    Approved
                                </span>

                            </td>

                            <td>
                                Dec 14, 2024
                            </td>

                            <td>

                                <button type="button"
                                        class="view-button">
                                    View
                                </button>

                            </td>

                        </tr>


                    </tbody>

                </table>

            </div>


        </div>


    </div>


</asp:Content>