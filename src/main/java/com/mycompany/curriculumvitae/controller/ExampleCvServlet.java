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
import java.util.Arrays;
import java.util.List;


/**
 *
 * @author amri1
 */
public class ExampleCvServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CvData cv = new CvData();

        // Hardcoded example data (Ahmad Zulkifli from screenshot)
        cv.setFullName("Ahmad Zulkifli bin Hassan");
        cv.setEmail("ahmad.zulkifli@email.com");
        cv.setPhone("+60 12-345 6789");
        cv.setLocation("Kuala Lumpur, Malaysia");
        cv.setLinkedinUrl("linkedin.com/in/ahmadzulkifli");
        cv.setJobTitle("Junior Java Developer");
        cv.setProfileSummary(
            "Motivated Computer Science graduate with hands-on experience in Java EE " +
            "web development and a passion for building clean, scalable applications. " +
            "Adept at applying MVC architecture, RESTful API design, and modern " +
            "front-end frameworks to deliver impactful software solutions."
        );

        cv.setEducationList(List.of(
            new CvData.Education(
                "Universiti Teknologi Malaysia (UTM)",
                "Bachelor of Computer Science",
                "Software Engineering",
                "2020", "2024",
                "Dean's List — Semester 3 & 5 | GPA 3.72 / 4.00"
            ),
            new CvData.Education(
                "SMK Taman Desa",
                "Sijil Pelajaran Malaysia (SPM)",
                "",
                "2015", "2019",
                "10A — Best Student Award"
            )
        ));

        cv.setExperienceList(List.of(
            new CvData.Experience(
                "Junior Java Developer",
                "BulanBintang Sdn. Bhd.",
                "Jan 2024", "Present",
                "Developed and maintained RESTful APIs using Java EE and Jakarta Servlets\n" +
                "Implemented MVC architecture reducing codebase complexity by 30%\n" +
                "Integrated Tailwind CSS front-end with back-end controller logic\n" +
                "Participated in Agile sprint cycles and daily stand-ups"
            ),
            new CvData.Experience(
                "Software Engineering Intern",
                "BulanMatahari Digital Services",
                "Jun 2023", "Dec 2023",
                "Built a customer data management module using Spring Boot and MySQL\n" +
                "Optimised SQL queries, improving report generation speed by 40%\n" +
                "Wrote unit tests achieving 85% code coverage with JUnit"
            )
        ));

        cv.setTechnicalSkills(List.of(
            "Java EE", "Jakarta Servlets", "JSP", "Spring Boot", "MySQL",
            "HTML/CSS", "Tailwind CSS", "Git"
        ));

        cv.setSoftSkills(List.of(
            "Problem Solving", "Team Collaboration", "Communication",
            "Time Management", "Adaptability"
        ));

        cv.setProjectList(List.of(
            new CvData.Project(
                "CV Builder Web Application",
                "Java EE, Jakarta Servlets, JSP, Tailwind CSS",
                "A full-stack MVC web app enabling users to generate professional CVs via dynamic HTML forms."
            ),
            new CvData.Project(
                "E-Library Management System",
                "Spring Boot, MySQL, React",
                "Library system with book borrowing, user auth, and overdue notifications via JavaMail."
            )
        ));

        request.setAttribute("cv", cv);
        request.getRequestDispatcher("/WEB-INF/jsp/cv.jsp").forward(request, response);
    }
}