package quelMedecin.bo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class RendezVous {
    
    private Creneau creneau;
    private Patient patient;
    private LocalDate date;

    public RendezVous(Creneau creneau, Patient patient, LocalDate date) {
        this.creneau = creneau;
        this.patient = patient;
        this.date = date;
    }

    public void afficher() {
        DateTimeFormatter dft = DateTimeFormatter.ofPattern("dd MMMM uuuu", Locale.FRANCE);
        System.out.printf("Rendez-vous du %s ", dft.format(date));
        this.creneau.afficher();
        System.out.print("avec le Dr. ");
        System.out.print(this.creneau.getMedecin().getNom() + "\n");

        System.out.print("pour ");
        this.patient.afficher();
    }

}


/*
Rendez-vous du 23 mai 2020 09:00 - 09:15 (15 minutes)
avec le Dr Malalaniche 
pour PAMAMOBE Adhémar
Téléphone : 0753428619
Sexe : Masculin
Numéro de Sécurité sociale : 192112192020142
Date de naissance : 21 novembre 1992
Commentaires : [aucun commentaire]
Adresse :
19 avenue Léo Lagrange
79000 NIORT
*/