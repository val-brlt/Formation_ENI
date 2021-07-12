package bo;

import java.time.LocalDate;

public class Gyropode extends Cycle{
    
    private int autonomie;
    private int taille;

    public Gyropode (LocalDate dateAchat,String marque, String modele,  int autonomie, int taille) {
        super(dateAchat, marque, modele);
        this.autonomie = autonomie;
        this.taille = taille;
    }   

    @Override
    public  String toString() {
        long years = java.time.temporal.ChronoUnit.YEARS.between( this.dateAchat , LocalDate.now() );
        char m = Integer.toString(this.taille).charAt(0);
        String cm = Integer.toString(this.taille);
        cm = cm.substring(cm.length() - 2);
        return "Gyropode " + this.marque + " " + this.modele + " (" +  years + "an) " +  this.autonomie + " km d'autonomie [" + m + "m"+ cm + " min]";
    };

    @Override
    public double getTarifLocationHeure() {
        return super.TARIFS_GYROPODE;
    }
}




/* 

- Gyropode Segway Ninebot Elite (0an) 40 km d'autonomie [1m50 min]  29,90€/heure 

*/