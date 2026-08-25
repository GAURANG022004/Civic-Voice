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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.civicvoice.dao.GrievanceDao;
import com.civicvoice.dao.OfficerDao;
import com.civicvoice.model.Grievance;
import com.civicvoice.model.Officer;

@Controller
public class OfficerController {
    ApplicationContext context;
    Officer officer;
    OfficerDao officerDao;
    Grievance grievance;
    GrievanceDao grievanceDao;

    public OfficerController() {
        context = new ClassPathXmlApplicationContext("config.xml");
        officer = (Officer) context.getBean("officer");
        officerDao = context.getBean("officerDao", OfficerDao.class);
        grievance = (Grievance) context.getBean("grievance");
        grievanceDao = context.getBean("grievanceDao", GrievanceDao.class);
    }

    @GetMapping("/registerOfficer")
    public String showOfficerForm() {
        return "registerOfficer";
    }

    @PostMapping("/registerOfficer")
    public String handleOfficerRegister(@RequestParam String name, @RequestParam String contactId,
            @RequestParam String department, @RequestParam String email, @RequestParam String password, Model m) {
        Officer o = new Officer();
        o.setName(name);
        o.setContactId(contactId);
        o.setDepartment(department);
        o.setEmail(email);
        o.setPassword(password);
        officerDao.saveOfficer(o);
        m.addAttribute("msg", "Officer registered successfully!");
        return "login";
    }

    @RequestMapping(path = "/OfficerLogin", method = RequestMethod.POST)
    public String doLogin(HttpServletRequest r, Model m) {
        String id = r.getParameter("contactId"), pw = r.getParameter("password");
        System.out.println("Login Attempt --> Contact ID:" + id + ", Password:" + pw);
        Officer o = officerDao.getOfficerByContactAndPassword(id, pw);
        if (o != null) {
            System.out.println("Login Success for Officer:" + o.getName());
            r.getSession().setAttribute("officer", o);
            return "officerDashboard";
        }
        System.out.println("Login Failed: Invalid credentials");
        m.addAttribute("error", "Invalid Officer credentials");
        return "login";
    }

    @GetMapping("/officerDashboard")
    public String dashboard() {
        return "officerDashboard";
    }

    @GetMapping("/officerViewGrievances")
    public String viewGrievances(@RequestParam(value = "status", required = false) String status, Model m) {
        java.util.List<Grievance> g;
        if (status != null && !status.trim().isEmpty()) {
            g = grievanceDao.getGrievancesByStatus(status);
            System.out.println("Filtered grievances for status:" + status + " -> " + g.size());
        } else {
            g = grievanceDao.getAllGrievances();
            System.out.println("All grievances count:" + g.size());
        }
        m.addAttribute("grievances", g);
        return "officerViewGrievances";
    }

    @PostMapping("/updateGrievanceStatus")
    public String updateGrievance(int id, String status, RedirectAttributes ra) {
        Grievance g = grievanceDao.getGrievance(id);
        if (g != null) {
            g.setStatus(status);
            grievanceDao.save(g);
            ra.addFlashAttribute("msg", " Grievance" + id + " marked as" + status + ".");
        } else
            ra.addFlashAttribute("msg", "Grievance not found.");
        return "redirect:/officerViewGrievances";
    }

    @PostMapping("/deleteGrievance")
    public String deleteGrievance(int id, RedirectAttributes ra) {
        Grievance g = grievanceDao.getGrievance(id);
        if (g != null) {
            grievanceDao.deleteGrievance(id);
            ra.addFlashAttribute("msg", " Grievance" + id + " deleted successfully.");
        } else
            ra.addFlashAttribute("msg", "Grievance not found.");
        return "redirect:/officerViewGrievances";
    }
}
