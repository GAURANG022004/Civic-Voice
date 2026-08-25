package com.civicvoice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.civicvoice.dao.CitizenDao;
import com.civicvoice.model.Citizen;

@Controller
public class CitizenController {
    
    ApplicationContext context;
    Citizen citizen;
    CitizenDao citizenDao;

    public CitizenController() {
        context = new ClassPathXmlApplicationContext("config.xml");
        citizen = (Citizen) context.getBean("citizen");
        citizenDao = context.getBean("citizenDao", CitizenDao.class);
    }

    @RequestMapping(path = "/registerCitizen", method = RequestMethod.GET)
    public String showForm() {
        return "registerCitizen";
    }

    @RequestMapping(path = "/registerCitizen", method = RequestMethod.POST)
    public String accopen(HttpServletRequest r) {

        String id = r.getParameter("contactId");
        System.out.println(" contactId = " + id);

        if (id == null || id.trim().isEmpty()) {
            System.out.println(" contactId is null/blank. Aborting.");
            return "registerCitizen";
        }

        Citizen c = new Citizen();

        c.setContactId(id);
        c.setName(r.getParameter("name"));
        c.setAddress(r.getParameter("address"));
        c.setEmail(r.getParameter("email"));
        c.setPassword(r.getParameter("password"));

        citizenDao.insert(c);

        System.out.println(" Full Citizen: " + c);

        return "login";
    }

    @RequestMapping(path = "/CitizenLogin", method = RequestMethod.POST)
    public String login(HttpServletRequest r, Model m) {

        String id = r.getParameter("contactId"), pw = r.getParameter("password");

        Citizen c = citizenDao.getCitizenByContactAndPassword(id, pw);

        if (c != null) {
            r.getSession().setAttribute("citizen", c);
            return "citizenDashboard";
        }

        m.addAttribute("error", "Invalid contact ID or password");

        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession s) {

        s.invalidate();

        return "login";

    }
}
