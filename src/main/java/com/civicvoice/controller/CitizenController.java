package com.civicvoice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.civicvoice.dao.CitizenDao;
import com.civicvoice.model.Citizen;

@Controller
public class CitizenController {
    
    CitizenDao citizenDao;

    public CitizenController(CitizenDao citizenDao) {
        this.citizenDao = citizenDao;
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

        String email = r.getParameter("email"), pw = r.getParameter("password");

        Citizen c = citizenDao.getCitizenByEmailAndPassword(email, pw);

        if (c != null) {
            r.getSession().setAttribute("citizen", c);
            return "citizenDashboard";
        }

        m.addAttribute("error", "Invalid email or password");

        return "login";
    }

}
