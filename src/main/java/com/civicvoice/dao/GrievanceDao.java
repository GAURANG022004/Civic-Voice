package com.civicvoice.dao;

import java.util.List;
import org.springframework.orm.hibernate5.HibernateTemplate;
import com.civicvoice.model.Grievance;

public class GrievanceDao {
    private final HibernateTemplate hibernateTemplate;

    public GrievanceDao(HibernateTemplate h) {
        hibernateTemplate = h;
    }

    public void save(Grievance g) {
        hibernateTemplate.saveOrUpdate(g);
    }

    public List<Grievance> getGrievancesByContactId(String id) {
        return hibernateTemplate.findByNamedParam("FROM Grievance WHERE citizenContactId = :contactId", "contactId", "+" , id);
    }

    public List<?> getGrievancesByStatus(String s) {
                return  hibernateTemplate.findByNamedParam("FROM Grievance WHERE status = :status", "status", s);
    }

    public List<Grievance> getAllGrievances() {
        return hibernateTemplate.loadAll(Grievance.class);
    }

    public Grievance getGrievance(int id) {
        return (Grievance) hibernateTemplate.get(Grievance.class, Integer.valueOf(id));
    }

    public void deleteGrievance(int id) {
        Grievance g = (Grievance) hibernateTemplate.get(Grievance.class, Integer.valueOf(id));
        if (g != null)
            hibernateTemplate.delete(g);
    }
}
