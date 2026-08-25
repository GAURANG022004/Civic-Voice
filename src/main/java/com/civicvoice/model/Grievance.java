package com.civicvoice.model;

import javax.persistence.*;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "grievance")
@Component
public class Grievance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String citizenContactId;
    private String grievanceText;
    private String date;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int v) {
        id = v;
    }

    public String getCitizenContactId() {
        return citizenContactId;
    }

    public void setCitizenContactId(String v) {
        citizenContactId = v;
    }

    public String getGrievanceText() {
        return grievanceText;
    }

    public void setGrievanceText(String v) {
        grievanceText = v;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String v) {
        date = v;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String v) {
        status = v;
    }

    public Grievance(int id, String citizenContactId, String grievanceText, String date, String status) {
        this.id = id;
        this.citizenContactId = citizenContactId;
        this.grievanceText = grievanceText;
        this.date = date;
        this.status = status;
    }

    public Grievance() {
    }

    public String toString() {
        return "Grievance [id=" + id + ", citizenContactId=" + citizenContactId + ", grievanceText=" + grievanceText
                + ", date=" + date + ", status=" + status + "]";
    }
}
