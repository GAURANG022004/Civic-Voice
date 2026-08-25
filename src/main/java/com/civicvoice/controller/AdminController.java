package com.civicvoice.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.civicvoice.dao.CitizenDao;
import com.civicvoice.dao.GrievanceDao;
import com.civicvoice.dao.OfficerDao;
import com.civicvoice.model.Officer;

@Controller
@RequestMapping("/")
public class AdminController {
    ApplicationContext context;
    CitizenDao citizenDao;
    GrievanceDao grievanceDao;
    OfficerDao officerDao;

    public AdminController() {
        context = new ClassPathXmlApplicationContext("config.xml");
        citizenDao = context.getBean("citizenDao", CitizenDao.class);
        grievanceDao = context.getBean("grievanceDao", GrievanceDao.class);
        officerDao = context.getBean("officerDao", OfficerDao.class);
    }

    @RequestMapping("/")
    public String home() {
        System.out.println("Opening index page");
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        System.out.println("Opening login page..");
        return "login";
    }

    @RequestMapping(path = "/AdminLogin", method = RequestMethod.POST)
    public String SubmitLogin(HttpServletRequest r) {
        String email = r.getParameter("email"), pw = r.getParameter("password");
        if ("admin@gmail.com".equals(email) && "1234".equals(pw))
            return "admindashboard";
        return "index";
    }

    @GetMapping("/adminDashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }

    @GetMapping("/addOfficer")
    public String showAddOfficerForm() {
        return "addOfficer";
    }

    @PostMapping("/addOfficer")
    public String handleAddOfficer(@RequestParam String contactId, @RequestParam String name,
            @RequestParam String department, @RequestParam String contact, @RequestParam String email, Model m) {
        Officer o = new Officer(contactId, name, department, contact, email, email);
        officerDao.saveOfficer(o);
        m.addAttribute("msg", "Officer added successfully!");
        return "redirect:/viewOfficers";
    }

    @GetMapping("/viewOfficers")
    public String viewOfficers(Model m) {
        m.addAttribute("officers", officerDao.getAllOfficers());
        return "viewOfficers";
    }

    @GetMapping("/viewCitizens")
    public String viewCitizens(Model m) {
        m.addAttribute("citizens", citizenDao.getAllCitizens());
        return "viewCitizens";
    }

    @GetMapping("/viewGrievances")
    public String viewGrievances(Model m) {
        m.addAttribute("grievances", grievanceDao.getAllGrievances());
        return "officerViewGrievances";
    }

    @RequestMapping("/deleteOfficer")
    public String deleteOfficer(int id) {
        officerDao.deleteOfficer(id);
        return "redirect:/viewOfficers";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "login";
    }
}
