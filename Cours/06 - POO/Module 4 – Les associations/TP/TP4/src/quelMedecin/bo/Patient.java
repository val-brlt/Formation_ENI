
package quelMedecin.bo;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Patient{

    private String nom;
    private String prenom;
    private String tel;
    private char sexe;
    private long nSecu;
    private LocalDate dateNaissance;
    private String com;
    private Adresse adresse;

    public Patient(String nom,String prenom,String tel,char sexe,long nSecu,LocalDate dateNaissance,String com, Adresse adresse) {
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
        this.sexe = sexe;
        this.nSecu = nSecu;
        this.dateNaissance = dateNaissance;
        this.com = com;
        this.adresse = adresse;
    }

    public void afficher() {
        System.out.printf("%s %s\n", this.nom.toUpperCase(), this.prenom);
        System.out.printf("Téléphone : %s\n", this.tel);
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

