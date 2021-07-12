package quelMedecin.bo;

import java.time.LocalTime;

public class Creneau {
    
    private MedecinGeneraliste med;
    LocalTime h_debut;
    int min;

    public Creneau (LocalTime h_debut, int min, MedecinGeneraliste med) {
        this.h_debut = h_debut;
        this.min = min;
        this.med = med;
        med.ajouterCreneau(this);
    }

    public MedecinGeneraliste getMedecin() {
        return med;
    }

    public  void afficher() {

        if (min == 15)
            System.out.printf(" %s - %s (%d min)\n", h_debut,h_debut.plusMinutes(15), min);
        else
            System.out.printf(" %s - %s (%d min)\n", h_debut,h_debut.plusMinutes(30), min);

    }

}
