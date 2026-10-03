<%@ Page Title="Add New Course"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AddCourse.aspx.cs"
    Inherits="EduCRM.AddCourse" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

<style>

.add-course-page {
    width: 100%;
    min-height: calc(100vh - 60px);
    padding: 18px 10px;
    background: #f8fafc;
    font-family: 'Inter', Arial, sans-serif;
    color: #1e293b;
}

.add-course-page * {
    box-sizing: border-box;
}

/* HEADER */

.ac-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
}

.ac-title h1 {
    margin: 0 0 3px;
    font-family: 'Montserrat', Arial, sans-serif;
    font-size: 21px;
    font-weight: 600;
    color: #172033;
}

.ac-title p {
    margin: 0;
    color: #64748b;
    font-size: 8px;
}

.ac-back {
    border: 1px solid #e2e8f0;
    background: white;
    color: #4f46e5;
    height: 27px;
    padding: 0 10px;
    border-radius: 5px;
    font-size: 7px;
}

/* MAIN LAYOUT */

.ac-layout {
    display: grid;
    grid-template-columns: minmax(0, 2fr) minmax(190px, .75fr);
    gap: 10px;
}

/* CARD */

.ac-card {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 11px;
    margin-bottom: 10px;
}

.ac-section-title {
    display: flex;
    align-items: center;
    gap: 7px;
    padding-bottom: 7px;
    margin-bottom: 9px;
    border-bottom: 1px solid #eef2f7;
}

.ac-section-icon {
    width: 23px;
    height: 23px;
    border-radius: 6px;
    background: #eef2ff;
    color: #4f46e5;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 8px;
}

.ac-section-title h3 {
    margin: 0;
    font-size: 9px;
    color: #334155;
}

.ac-section-title p {
    margin: 2px 0 0;
    font-size: 6px;
    color: #94a3b8;
}

/* FORM GRID */

.ac-grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 8px;
}

.ac-grid-3 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 8px;
}

.ac-field {
    margin-bottom: 7px;
}

.ac-field label {
    display: block;
    margin-bottom: 4px;
    color: #475569;
    font-size: 6px;
    font-weight: 600;
}

.ac-required {
    color: #ef4444;
}

.ac-input,
.ac-select,
.ac-textarea {
    width: 100%;
    border: 1px solid #dfe5ef;
    border-radius: 5px;
    background: #fff;
    color: #475569;
    font-family: 'Inter', Arial, sans-serif;
    font-size: 7px;
    outline: none;
}

.ac-input,
.ac-select {
    height: 27px;
    padding: 0 7px;
}

.ac-textarea {
    height: 58px;
    resize: none;
    padding: 7px;
}

.ac-input:focus,
.ac-select:focus,
.ac-textarea:focus {
    border-color: #818cf8;
}

/* SUBJECTS */

.ac-subject-row {
    display: grid;
    grid-template-columns: 28px 1fr 28px;
    gap: 6px;
    align-items: center;
    margin-bottom: 6px;
}

.ac-semester {
    background: #f8faff;
    border: 1px solid #e5e9f8;
    border-radius: 6px;
    padding: 8px;
    margin-bottom: 8px;
}

.ac-semester-title {
    font-size: 7px;
    font-weight: 600;
    color: #334155;
    margin-bottom: 6px;
}

.ac-sem-number {
    height: 27px;
    background: #eef2ff;
    color: #4f46e5;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 7px;
    font-weight: 600;
}

.ac-small-btn {
    width: 28px;
    height: 27px;
    border: none;
    border-radius: 5px;
    background: #eef2ff;
    color: #4f46e5;
}

/* FEES */

.ac-fee-grid {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 8px;
}

/* CHECKBOX */

.ac-checkboxes {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
    margin-top: 5px;
}

.ac-checkbox {
    display: flex;
    align-items: center;
    gap: 4px;
    color: #64748b;
    font-size: 6px;
}

/* PREVIEW */

.ac-preview {
    position: sticky;
    top: 10px;
    align-self: start;
}

.ac-preview-box {
    background: linear-gradient(135deg, #4338ca, #2563eb);
    border-radius: 7px;
    height: 65px;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 9px;
}

.ac-preview-box i {
    font-size: 25px;
    opacity: .85;
}

.ac-preview-row {
    display: flex;
    align-items: center;
    gap: 7px;
    padding: 7px 0;
    border-bottom: 1px solid #f1f5f9;
}

.ac-preview-icon {
    width: 22px;
    height: 22px;
    background: #eef2ff;
    color: #4f46e5;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 7px;
}

.ac-preview-text span {
    display: block;
}

.ac-preview-label {
    font-size: 5px;
    color: #94a3b8;
}

.ac-preview-value {
    font-size: 7px;
    color: #475569;
    font-weight: 600;
}

/* BOTTOM BUTTONS */

.ac-actions {
    display: flex;
    justify-content: flex-end;
    gap: 6px;
    margin-top: 2px;
}

.ac-cancel,
.ac-save {
    height: 27px;
    padding: 0 12px;
    border-radius: 5px;
    font-size: 7px;
    cursor: pointer;
}

.ac-cancel {
    background: white;
    color: #64748b;
    border: 1px solid #e2e8f0;
}

.ac-save {
    background: #4f46e5;
    color: white;
    border: 1px solid #4f46e5;
}

/* RESPONSIVE */

@media(max-width:850px) {

    .ac-layout {
        grid-template-columns: 1fr;
    }

    .ac-preview {
        position: static;
    }

}

@media(max-width:600px) {

    .ac-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .ac-grid-2,
    .ac-grid-3,
    .ac-fee-grid {
        grid-template-columns: 1fr;
    }

}

</style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="add-course-page">


    <!-- HEADER -->

    <div class="ac-header">

        <div class="ac-title">

            <h1>Add New Course</h1>

            <p>
                Create a new academic course
            </p>

        </div>

       <a href="<%= ResolveUrl("~/Admin/Courses.aspx") %>"
   class="back-btn"
   style="text-decoration:none; display:inline-flex; align-items:center; justify-content:center;">

    <i class="fas fa-arrow-left"></i>
    &nbsp; Back

</a>

    </div>


    <div class="ac-layout">


        <!-- LEFT SIDE -->

        <div>


            <!-- BASIC INFORMATION -->

            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">
                        <i class="fas fa-book"></i>
                    </div>

                    <div>
                        <h3>Basic Information</h3>
                        <p>Enter basic course details</p>
                    </div>

                </div>


                <div class="ac-grid-2">

                    <div class="ac-field">

                        <label>
                            Course Name <span class="ac-required">*</span>
                        </label>

                        <input class="ac-input"
                               type="text"
                               placeholder="Enter course name" />

                    </div>


                    <div class="ac-field">

                        <label>
                            Course Code <span class="ac-required">*</span>
                        </label>

                        <input class="ac-input"
                               type="text"
                               placeholder="Example: CSE-BTECH-001" />

                    </div>

                </div>


                <div class="ac-grid-3">

                    <div class="ac-field">

                        <label>
                            Department <span class="ac-required">*</span>
                        </label>

                        <select class="ac-select">

                            <option>Select...</option>
                            <option>Computer Engineering</option>
                            <option>Management</option>
                            <option>Science</option>
                            <option>Arts</option>

                        </select>

                    </div>


                    <div class="ac-field">

                        <label>
                            Level <span class="ac-required">*</span>
                        </label>

                        <select class="ac-select">

                            <option>Select...</option>
                            <option>Undergraduate</option>
                            <option>Postgraduate</option>

                        </select>

                    </div>


                    <div class="ac-field">

                        <label>
                            Duration <span class="ac-required">*</span>
                        </label>

                        <select class="ac-select">

                            <option>3 Years</option>
                            <option>4 Years</option>
                            <option>2 Years</option>

                        </select>

                    </div>

                </div>


                <div class="ac-field">

                    <label>
                        Description <span class="ac-required">*</span>
                    </label>

                    <textarea class="ac-textarea"
                              placeholder="Enter course description..."></textarea>

                </div>

            </div>


            <!-- COURSE STRUCTURE -->

            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">
                        <i class="fas fa-layer-group"></i>
                    </div>

                    <div>
                        <h3>Course Structure</h3>
                        <p>Define semesters and subjects</p>
                    </div>

                </div>


                <div class="ac-grid-2">

                    <div class="ac-field">

                        <label>
                            Duration <span class="ac-required">*</span>
                        </label>

                        <select class="ac-select">

                            <option>4 Years</option>
                            <option>3 Years</option>
                            <option>2 Years</option>

                        </select>

                    </div>


                    <div class="ac-field">

                        <label>
                            Total Semesters <span class="ac-required">*</span>
                        </label>

                        <select class="ac-select">

                            <option>8 Semesters</option>
                            <option>6 Semesters</option>
                            <option>4 Semesters</option>

                        </select>

                    </div>

                </div>


                <!-- SEMESTER 1 -->

                <div class="ac-semester">

                    <div class="ac-semester-title">
                        Semester 1
                    </div>

                    <div class="ac-subject-row">

                        <div class="ac-sem-number">
                            01
                        </div>

                        <input class="ac-input"
                               type="text"
                               value="Engineering Mathematics I" />

                        <button type="button" class="ac-small-btn">
                            <i class="fas fa-trash"></i>
                        </button>

                    </div>


                    <div class="ac-subject-row">

                        <div class="ac-sem-number">
                            02
                        </div>

                        <input class="ac-input"
                               type="text"
                               value="Programming Fundamentals" />

                        <button type="button" class="ac-small-btn">
                            <i class="fas fa-trash"></i>
                        </button>

                    </div>

                </div>


                <!-- SEMESTER 2 -->

                <div class="ac-semester">

                    <div class="ac-semester-title">
                        Semester 2
                    </div>

                    <div class="ac-subject-row">

                        <div class="ac-sem-number">
                            01
                        </div>

                        <input class="ac-input"
                               type="text"
                               value="Data Structures" />

                        <button type="button" class="ac-small-btn">
                            <i class="fas fa-trash"></i>
                        </button>

                    </div>


                    <div class="ac-subject-row">

                        <div class="ac-sem-number">
                            02
                        </div>

                        <input class="ac-input"
                               type="text"
                               value="Database Management Systems" />

                        <button type="button" class="ac-small-btn">
                            <i class="fas fa-trash"></i>
                        </button>

                    </div>

                </div>

            </div>


            <!-- FEE STRUCTURE -->

            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">
                        <i class="fas fa-indian-rupee-sign"></i>
                    </div>

                    <div>
                        <h3>Fee Structure</h3>
                        <p>Enter course fee details</p>
                    </div>

                </div>


                <div class="ac-fee-grid">

                    <div class="ac-field">

                        <label>
                            Tuition Fee <span class="ac-required">*</span>
                        </label>

                        <input class="ac-input"
                               type="text"
                               placeholder="₹ 0" />

                    </div>


                    <div class="ac-field">

                        <label>
                            Registration Fee
                        </label>

                        <input class="ac-input"
                               type="text"
                               placeholder="₹ 0" />

                    </div>


                    <div class="ac-field">

                        <label>
                            Other Charges
                        </label>

                        <input class="ac-input"
                               type="text"
                               placeholder="₹ 0" />

                    </div>

                </div>


                <div class="ac-checkboxes">

                    <label class="ac-checkbox">

                        <input type="checkbox" checked />

                        Hostel Available

                    </label>


                    <label class="ac-checkbox">

                        <input type="checkbox" />

                        Scholarship Available

                    </label>


                    <label class="ac-checkbox">

                        <input type="checkbox" />

                        Transport Available

                    </label>

                </div>

            </div>


            <!-- ELIGIBILITY -->

            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">
                        <i class="fas fa-user-check"></i>
                    </div>

                    <div>
                        <h3>Eligibility & Requirements</h3>
                        <p>Admission eligibility information</p>
                    </div>

                </div>


                <div class="ac-grid-2">

                    <div class="ac-field">

                        <label>
                            Minimum Qualification
                        </label>

                        <input class="ac-input"
                               type="text"
                               value="12th Science" />

                    </div>


                    <div class="ac-field">

                        <label>
                            Minimum Percentage
                        </label>

                        <input class="ac-input"
                               type="text"
                               value="60%" />

                    </div>

                </div>


                <div class="ac-field">

                    <label>
                        Entrance Exam Required
                    </label>

                    <select class="ac-select">

                        <option>Yes</option>
                        <option>No</option>

                    </select>

                </div>


                <div class="ac-field">

                    <label>
                        Additional Requirements
                    </label>

                    <textarea class="ac-textarea"
                              placeholder="Enter additional requirements..."></textarea>

                </div>

            </div>


            <!-- SETTINGS -->

            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">
                        <i class="fas fa-cog"></i>
                    </div>

                    <div>
                        <h3>Settings</h3>
                        <p>Course visibility and status</p>
                    </div>

                </div>


                <div class="ac-grid-2">

                    <div class="ac-field">

                        <label>Status</label>

                        <select class="ac-select">

                            <option>Active</option>
                            <option>Inactive</option>
                            <option>Upcoming</option>

                        </select>

                    </div>


                    <div class="ac-field">

                        <label>Admission Type</label>

                        <select class="ac-select">

                            <option>Merit / Entrance</option>
                            <option>Merit</option>
                            <option>Entrance</option>

                        </select>

                    </div>

                </div>


                <div class="ac-field">

                    <label>
                        Course Tags
                    </label>

                    <input class="ac-input"
                           type="text"
                           placeholder="Engineering, Computer, Technology..." />

                </div>

            </div>


            <!-- ACTION BUTTONS -->

            <div class="ac-actions">

                <button type="button"
                        class="ac-cancel">

                    Cancel

                </button>


                <button type="button"
                        class="ac-save">

                    <i class="fas fa-check"></i>

                    Save Course

                </button>

            </div>


        </div>


        <!-- RIGHT SIDE PREVIEW -->

        <div class="ac-preview">


            <div class="ac-card">

                <div class="ac-section-title">

                    <div class="ac-section-icon">

                        <i class="fas fa-eye"></i>

                    </div>

                    <div>

                        <h3>Course Preview</h3>

                        <p>Preview information</p>

                    </div>

                </div>


                <div class="ac-preview-box">

                    <i class="fas fa-book-open"></i>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-book"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            COURSE
                        </span>

                        <span class="ac-preview-value">
                            B.Tech CSE
                        </span>

                    </div>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-code"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            CODE
                        </span>

                        <span class="ac-preview-value">
                            CSE-BTECH-001
                        </span>

                    </div>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-building"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            DEPARTMENT
                        </span>

                        <span class="ac-preview-value">
                            Computer Engineering
                        </span>

                    </div>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-clock"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            DURATION
                        </span>

                        <span class="ac-preview-value">
                            4 Years
                        </span>

                    </div>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-users"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            SEATS
                        </span>

                        <span class="ac-preview-value">
                            120
                        </span>

                    </div>

                </div>


                <div class="ac-preview-row">

                    <div class="ac-preview-icon">

                        <i class="fas fa-indian-rupee-sign"></i>

                    </div>

                    <div class="ac-preview-text">

                        <span class="ac-preview-label">
                            ANNUAL FEE
                        </span>

                        <span class="ac-preview-value">
                            ₹3,80,000
                        </span>

                    </div>

                </div>


            </div>


        </div>

    </div>

</div>

</asp:Content>