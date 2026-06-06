/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.curriculumvitae.model;

import java.util.List;
/**
 *
 * @author amri1
 */
public class CvData {

    // Personal Info
    private String fullName;
    private String email;
    private String phone;
    private String location;
    private String linkedinUrl;
    private String profileSummary;
    private String jobTitle;

    // Education (supports multiple)
    private List<Education> educationList;

    // Work Experience (supports multiple)
    private List<Experience> experienceList;

    // Skills
    private List<String> technicalSkills;
    private List<String> softSkills;

    // Projects (supports multiple)
    private List<Project> projectList;

    // ─── Inner classes ───────────────────────────────────────

    public static class Education {
        private String institution;
        private String degree;
        private String fieldOfStudy;
        private String startYear;
        private String endYear;
        private String notes;

        public Education(String institution, String degree, String fieldOfStudy,
                         String startYear, String endYear, String notes) {
            this.institution  = institution;
            this.degree       = degree;
            this.fieldOfStudy = fieldOfStudy;
            this.startYear    = startYear;
            this.endYear      = endYear;
            this.notes        = notes;
        }

        public String getInstitution()  { return institution; }
        public String getDegree()       { return degree; }
        public String getFieldOfStudy() { return fieldOfStudy; }
        public String getStartYear()    { return startYear; }
        public String getEndYear()      { return endYear; }
        public String getNotes()        { return notes; }
    }

    public static class Experience {
        private String jobTitle;
        private String company;
        private String startDate;
        private String endDate;
        private String responsibilities;

        public Experience(String jobTitle, String company,
                          String startDate, String endDate, String responsibilities) {
            this.jobTitle         = jobTitle;
            this.company          = company;
            this.startDate        = startDate;
            this.endDate          = endDate;
            this.responsibilities = responsibilities;
        }

        public String getJobTitle()          { return jobTitle; }
        public String getCompany()           { return company; }
        public String getStartDate()         { return startDate; }
        public String getEndDate()           { return endDate; }
        public String getResponsibilities()  { return responsibilities; }
    }

    public static class Project {
        private String title;
        private String technologies;
        private String description;

        public Project(String title, String technologies, String description) {
            this.title        = title;
            this.technologies = technologies;
            this.description  = description;
        }

        public String getTitle()        { return title; }
        public String getTechnologies() { return technologies; }
        public String getDescription()  { return description; }
    }

    // ─── Main getters & setters ──────────────────────────────

    public String getFullName()     { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail()        { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone()        { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getLocation()     { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getLinkedinUrl()  { return linkedinUrl; }
    public void setLinkedinUrl(String linkedinUrl) { this.linkedinUrl = linkedinUrl; }

    public String getProfileSummary() { return profileSummary; }
    public void setProfileSummary(String profileSummary) { this.profileSummary = profileSummary; }

    public String getJobTitle()     { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public List<Education> getEducationList() { return educationList; }
    public void setEducationList(List<Education> educationList) { this.educationList = educationList; }

    public List<Experience> getExperienceList() { return experienceList; }
    public void setExperienceList(List<Experience> experienceList) { this.experienceList = experienceList; }

    public List<String> getTechnicalSkills() { return technicalSkills; }
    public void setTechnicalSkills(List<String> technicalSkills) { this.technicalSkills = technicalSkills; }

    public List<String> getSoftSkills() { return softSkills; }
    public void setSoftSkills(List<String> softSkills) { this.softSkills = softSkills; }

    public List<Project> getProjectList() { return projectList; }
    public void setProjectList(List<Project> projectList) { this.projectList = projectList; }
}
