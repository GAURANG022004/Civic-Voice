package com.civicvoice.dao;

import java.util.List;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.civicvoice.model.Officer;

@Repository
public class OfficerDao {
    private final HibernateTemplate hibernateTemplate;

    public OfficerDao(HibernateTemplate h) {
        hibernateTemplate = h;
    }

    public void saveOfficer(Officer o) {
        hibernateTemplate.save(o);
    }

    public Officer getOfficerByContactAndPassword(String id, String pw) {
        String q = "from Officer where contactId = :contactId and password = :password";
        List<?> l = hibernateTemplate.findByNamedParam(q, new String[] { "contactId", "password" },
                new Object[] { id, pw });
        return l.isEmpty() ? null : (Officer) l.get(0);
    }

    public List<Officer> getAllOfficers() {
        return hibernateTemplate.loadAll(Officer.class);
    }

    public void deleteOfficer(int id) {
        Officer o = (Officer) hibernateTemplate.get(Officer.class, Integer.valueOf(id));
        if (o != null)
            hibernateTemplate.delete(o);
    }
}
