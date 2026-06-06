/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.curriculumvitae.controller;


import com.mycompany.curriculumvitae.model.CvData;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 *
 * @author amri1
 */
public class CvFormServlet extends HttpServlet {

    // GET → show the empty form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/form.jsp").forward(request, response);
    }

    // POST → read form data, build CvData, forward to cv.jsp
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        CvData cv = new CvData();

        // ── Personal Info ──────────────────────────────────
        cv.setFullName(request.getParameter("fullName"));
        cv.setEmail(request.getParameter("email"));
        cv.setPhone(request.getParameter("phone"));
        cv.setLocation(request.getParameter("location"));
        cv.setLinkedinUrl(request.getParameter("linkedinUrl"));
        cv.setProfileSummary(request.getParameter("profileSummary"));
        cv.setJobTitle(request.getParameter("jobTitle"));

        // ── Education (multiple entries) ───────────────────
        String[] institutions  = request.getParameterValues("institution");
        String[] degrees       = request.getParameterValues("degree");
        String[] fields        = request.getParameterValues("fieldOfStudy");
        String[] eduStarts     = request.getParameterValues("eduStartYear");
        String[] eduEnds       = request.getParameterValues("eduEndYear");
        String[] eduNotes      = request.getParameterValues("eduNotes");

        List<CvData.Education> eduList = new ArrayList<>();
        if (institutions != null) {
            for (int i = 0; i < institutions.length; i++) {
                if (!institutions[i].isBlank()) {
                    eduList.add(new CvData.Education(
                        institutions[i],
                        degrees != null && i < degrees.length ? degrees[i] : "",
                        fields  != null && i < fields.length  ? fields[i]  : "",
                        eduStarts != null && i < eduStarts.length ? eduStarts[i] : "",
                        eduEnds   != null && i < eduEnds.length   ? eduEnds[i]   : "",
                        eduNotes  != null && i < eduNotes.length  ? eduNotes[i]  : ""
                    ));
                }
            }
        }
        cv.setEducationList(eduList);

        // ── Work Experience (multiple entries) ─────────────
        String[] jobTitles    = request.getParameterValues("jobTitle[]");
        String[] companies    = request.getParameterValues("company");
        String[] expStarts    = request.getParameterValues("expStartDate");
        String[] expEnds      = request.getParameterValues("expEndDate");
        String[] responsibilities = request.getParameterValues("responsibilities");

        List<CvData.Experience> expList = new ArrayList<>();
        if (companies != null) {
            for (int i = 0; i < companies.length; i++) {
                if (!companies[i].isBlank()) {
                    expList.add(new CvData.Experience(
                        jobTitles != null && i < jobTitles.length ? jobTitles[i] : "",
                        companies[i],
                        expStarts != null && i < expStarts.length ? expStarts[i] : "",
                        expEnds   != null && i < expEnds.length   ? expEnds[i]   : "",
                        responsibilities != null && i < responsibilities.length ? responsibilities[i] : ""
                    ));
                }
            }
        }
        cv.setExperienceList(expList);

        // ── Skills ─────────────────────────────────────────
        String techSkillsRaw = request.getParameter("technicalSkills");
        String softSkillsRaw = request.getParameter("softSkills");

        cv.setTechnicalSkills(parseSkills(techSkillsRaw));
        cv.setSoftSkills(parseSkills(softSkillsRaw));

        // ── Projects (multiple entries) ────────────────────
        String[] projTitles = request.getParameterValues("projectTitle");
        String[] projTechs  = request.getParameterValues("projectTech");
        String[] projDescs  = request.getParameterValues("projectDesc");

        List<CvData.Project> projList = new ArrayList<>();
        if (projTitles != null) {
            for (int i = 0; i < projTitles.length; i++) {
                if (!projTitles[i].isBlank()) {
                    projList.add(new CvData.Project(
                        projTitles[i],
                        projTechs != null && i < projTechs.length ? projTechs[i] : "",
                        projDescs != null && i < projDescs.length ? projDescs[i] : ""
                    ));
                }
            }
        }
        cv.setProjectList(projList);

        // ── Forward to CV template ─────────────────────────
        request.setAttribute("cv", cv);
        request.getRequestDispatcher("/WEB-INF/jsp/cv.jsp").forward(request, response);
    }

    // Split comma or newline separated skills into a List
    private List<String> parseSkills(String raw) {
        if (raw == null || raw.isBlank()) return new ArrayList<>();
        String[] parts = raw.split("[,\n]+");
        List<String> result = new ArrayList<>();
        for (String s : parts) {
            String trimmed = s.trim();
            if (!trimmed.isEmpty()) result.add(trimmed);
        }
        return result;
    }
}
