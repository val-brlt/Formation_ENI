package quelMedecin.bo;
public class MedecinGeneraliste {
    
    private String nom;
    private String prenom;
    private String tel;
    public static int tarif = 25;

    public MedecinGeneraliste(String nom,String prenom,String tel) {
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
    }

    public String getNom() {
        return nom;
    }

    public String getNumeroDeTelephone() {
        return tel;
    }

    public void setNumeroDeTelephone(String tel) {
        this.tel = tel;
    }

    public static int getTarif() {
        return tarif;
    }

    public static void setTarif(int tarif) {
        MedecinGeneraliste.tarif = tarif;
    }

    public void afficher() {
        System.out.printf("\n%s %s\n", this.nom.toUpperCase(), this.prenom);
        System.out.printf("Téléphone : %s\n", this.tel);
        System.out.printf("Tarifs : %d €\n", MedecinGeneraliste.getTarif());
    }


}
