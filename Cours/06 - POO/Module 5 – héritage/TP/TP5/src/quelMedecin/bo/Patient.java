
package quelMedecin.bo;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Patient extends Personne{

    private char sexe;
    private long nSecu;
    private LocalDate dateNaissance;
    private String com;

    public Patient(String nom,String prenom,String tel,char sexe,long nSecu,LocalDate dateNaissance,String com, Adresse adresse) {
        super(nom, prenom, tel, adresse);
        this.sexe = sexe;
        this.nSecu = nSecu;
        this.dateNaissance = dateNaissance;
        this.com = com;
    }

    public void afficher() {
        super.afficher();
        if (this.sexe == 'F')
            System.out.printf("Sexe : Féminin\n");
        else
            System.out.printf("Sexe : Masculin\n");
        System.out.printf("Numéro de Sécurité sociale : %d\n", this.nSecu);
        DateTimeFormatter dft = DateTimeFormatter.ofPattern("dd MMMM uuuu", Locale.FRANCE);
        System.out.printf("Date de naissance : %s\n", dft.format(dateNaissance));
        if (this.com != null)
            System.out.printf("Commentaires : %s\n", this.com);
        else
            System.out.printf("Commentaires : [aucun commentaire]\n");
        System.out.printf("Adresse :\n");
        this.adresse.afficher();
        System.out.println();
    }

}

