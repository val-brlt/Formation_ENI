package bo;

import java.time.LocalDate;

public class Velo extends Cycle{
    

    private int vitesse;

    public Velo (LocalDate dateAchat,String marque, String modele,  int vitesse) {
        super(dateAchat, marque, modele);
        this.vitesse = vitesse;
    }

    @Override
    public  String toString() {
        long years = java.time.temporal.ChronoUnit.YEARS.between( this.dateAchat , LocalDate.now() );
        return "Velo " + this.marque + " " + this.modele + " (" +  years + "an) " + this.vitesse + " vitesses";
    }

    @Override
    public double getTarifLocationHeure() {
        return TARIFS_VELO;
    };
}


// Velo Btwin riverside 900 (0an) 10 vitesses                         