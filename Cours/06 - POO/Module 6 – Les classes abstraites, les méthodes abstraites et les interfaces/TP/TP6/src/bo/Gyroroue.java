package bo;

import java.time.LocalDate;
public class Gyroroue extends Cycle {
    
    private int autonomie;

    public Gyroroue (LocalDate dateAchat,String marque, String modele,  int autonomie) {
        super(dateAchat, marque, modele);
        this.autonomie = autonomie;
  }

    @Override
    public  String toString() {
        long years = java.time.temporal.ChronoUnit.YEARS.between( this.dateAchat , LocalDate.now() );
        return "Gyroroue " + this.marque + " " + this.modele + " (" +  years + "an) " +  this.autonomie + " km d'autonomie";
    }

    @Override
    public double getTarifLocationHeure() {
        return TARIFS_GYROROUE;
    };
}

// Gyroroue Immotion v8 (0an) 40 km d'autonomie