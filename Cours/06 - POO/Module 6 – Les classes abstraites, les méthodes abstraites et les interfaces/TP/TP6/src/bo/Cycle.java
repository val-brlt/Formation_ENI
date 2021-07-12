package bo;

import java.time.LocalDate;

public abstract class Cycle {
    
    protected String marque;
    protected String modele;
    protected LocalDate dateAchat;
    protected final double TARIFS_VELO = 4.90;
    protected final double TARIFS_GYROROUE = 18.90;
    protected final double TARIFS_GYROPODE = 29.90;


    public Cycle(LocalDate dateAchat,String marque, String modele) {
        this.marque = marque;
        this.modele = modele;
        this.dateAchat = dateAchat;
    
    }
    public abstract double getTarifLocationHeure();
    public abstract String toString() ;
    
}
