package com.civicvoice.dao;

import java.util.List;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.civicvoice.model.Grievance;

@Repository
public class GrievanceDao {
    private final HibernateTemplate hibernateTemplate;

    public GrievanceDao(HibernateTemplate h) {
        hibernateTemplate = h;
    }

    public void save(Grievance g) {
        hibernateTemplate.saveOrUpdate(g);
    }

    public List<Grievance> getGrievancesByContactId(String id) {
        List<?> results = hibernateTemplate.findByNamedParam(
                "FROM Grievance WHERE citizenContactId = :contactId", "contactId", id);
        return (List<Grievance>) (List<?>) results;
    }

    public List<Grievance> getGrievancesByStatus(String s) {
        List<?> results = hibernateTemplate.findByNamedParam("FROM Grievance WHERE status = :status", "status", s);
        return (List<Grievance>) (List<?>) results;
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
