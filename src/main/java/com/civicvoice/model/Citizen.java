package com.civicvoice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "citizen")
@Component
public class Citizen {
    @Id
    private String contactId;
    private String name;
    private String address;
    private String email;
    private String password;

    public Citizen() {
    }

    public Citizen(String contactId, String name, String address, String email, String password) {
        this.contactId = contactId;
        this.name = name;
        this.address = address;
        this.email = email;
        this.password = password;
    }

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String v) {
        address = v;
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

    public String toString() {
        return "Citizen [contactId=" + contactId + ", name=" + name + ", address=" + address + ", email=" + email
                + ", password=" + password + "]";
    }
}
