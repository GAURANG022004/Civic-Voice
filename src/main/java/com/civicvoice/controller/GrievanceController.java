package com.civicvoice.controller;

import java.time.LocalDate;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.civicvoice.dao.GrievanceDao;
import com.civicvoice.model.Citizen;
import com.civicvoice.model.Grievance;

@Controller
public class GrievanceController {
    ApplicationContext context;
    Grievance grievance;
    GrievanceDao grievanceDao;

    public GrievanceController() {
        context = new ClassPathXmlApplicationContext("config.xml");
        grievance = (Grievance) context.getBean("grievance");
        grievanceDao = context.getBean("grievanceDao", GrievanceDao.class);
    }

    @GetMapping("/registerGrievance")
    public String showForm() {
        return "registerGrievance";
    }

    @PostMapping("/registerGrievance")
    public String submitGrievance(@RequestParam String citizenContactId, @RequestParam String grievanceText, Model m) {
        Grievance g = new Grievance();
        g.setCitizenContactId(citizenContactId);
        g.setGrievanceText(grievanceText);
        g.setDate(LocalDate.now().toString());
        g.setStatus("Pending");
        grievanceDao.save(g);
        m.addAttribute("message", "Your grievance has been submitted successfully.");
        return "citizenDashboard";
    }

    @GetMapping("/myGrievances")
    public String viewMyGrievances(HttpSession s, Model m) {
        Citizen c = (Citizen) s.getAttribute("citizen");
        if (c == null)
            return "redirect:/login?expired=true";
        m.addAttribute("grievances", grievanceDao.getGrievancesByContactId(c.getContactId()));
        return "myGrievances";
    }

    @GetMapping("/citizenDashboard")
    public String showCitizenDashboard(HttpSession s, Model m) {
        Citizen c = (Citizen) s.getAttribute("citizen");
        if (c == null)
            return "redirect:/login?expired=true";
        m.addAttribute("citizen", c);
        return "citizenDashboard";
    }
}
