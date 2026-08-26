package com.civicvoice.dao;

import java.util.List;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.civicvoice.model.Officer;

@Repository
@Transactional
public class OfficerDao {
    private final HibernateTemplate hibernateTemplate;

    public OfficerDao(HibernateTemplate h) {
        hibernateTemplate = h;
    }

    public void saveOfficer(Officer o) {
        hibernateTemplate.save(o);
    }

    public Officer getOfficerByEmailAndPassword(String email, String pw) {
        String q = "from Officer where email = :email and password = :password";
        List<?> l = hibernateTemplate.findByNamedParam(q, new String[] { "email", "password" },
                new Object[] { email, pw });
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
