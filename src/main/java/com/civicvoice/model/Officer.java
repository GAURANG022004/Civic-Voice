package com.civicvoice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "officer")
@Component
public class Officer {
    @Id
    private String contactId;
    private String name;
    private String department;
    private String contact;
    private String email;
    private String password;

    public String getContactId() {
        return contactId;
    }

    public void setContactId(String v) {
        contactId = v;
    }

    public String getName() {
        return name;
    }

    public void setName(String v) {
        name = v;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String v) {
        department = v;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String v) {
        contact = v;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String v) {
        email = v;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String v) {
        password = v;
    }

    public Officer(String contactId, String name, String department, String contact, String email, String password) {
        this.contactId = contactId;
        this.name = name;
        this.department = department;
        this.contact = contact;
        this.email = email;
        this.password = password;
    }

    public Officer() {
    }
}
