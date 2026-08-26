package com.civicvoice.dao;

import java.util.List;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.civicvoice.model.Citizen;

@Repository
@Transactional
public class CitizenDao {
    private final HibernateTemplate hibernateTemplate;

    public CitizenDao(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public void insert(Citizen c) {
        hibernateTemplate.save(c);
    }

    public Citizen getCitizen(String id) {
        return (Citizen) hibernateTemplate.get(Citizen.class, id);
    }

    public Citizen getCitizenByEmailAndPassword(String email, String pw) {
        List<?> l = hibernateTemplate.find("from Citizen where email=?0 and password=?1", email, pw);
        return l.isEmpty() ? null : (Citizen) l.get(0);
    }

    public List<Citizen> getAllCitizens() {
        return hibernateTemplate.loadAll(Citizen.class);
    }

    public void deleteCitizen(String id) {
        Citizen c = (Citizen) hibernateTemplate.get(Citizen.class, id);
        if (c != null)
            hibernateTemplate.delete(c);
    }

    public void updateCitizen(Citizen c) {
        hibernateTemplate.update(c);
    }
}
