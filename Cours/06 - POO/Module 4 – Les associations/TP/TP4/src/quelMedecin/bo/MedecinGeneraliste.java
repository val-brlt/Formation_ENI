package quelMedecin.bo;


public class MedecinGeneraliste {
    
    private String nom;
    private String prenom;
    private String tel;
    private Adresse adresse;
    private Creneau[] creneau = new Creneau[15];
    public static int tarif = 25;
    private  static int nbCre = 0;

    public MedecinGeneraliste(String nom,String prenom,String tel, Adresse adresse) {
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
        this.adresse = adresse;

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

    public void ajouterCreneau(Creneau c) {
            if(nbCre < 15) {
                this.creneau[nbCre] = c;
                nbCre++;
            }
    }

    public void afficher() {
        System.out.printf("\n%s %s\n", this.nom.toUpperCase(), this.prenom);
        System.out.printf("Téléphone : %s\n", this.tel);
        System.out.printf("Tarifs : %d €\n", MedecinGeneraliste.getTarif());
        System.out.printf("Adresse :\n");
        this.adresse.afficher();

        for (int i=0; i<nbCre;i++) {
            creneau[i].afficher();
        }
    }


}
