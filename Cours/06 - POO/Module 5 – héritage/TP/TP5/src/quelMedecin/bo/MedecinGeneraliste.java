package quelMedecin.bo;


public class MedecinGeneraliste extends Personne {
    

    protected Creneau[] creneau = new Creneau[15];
    public static int tarif = 25;
    private  static int nbCre = 0;

    public MedecinGeneraliste(String nom,String prenom,String tel, Adresse adresse) {
        super(nom, prenom, tel, adresse);
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
		int i = 0;
		if (this == c.getMedecin()) {
			while (i < this.creneau.length && this.creneau[i] != null)
				i++;
			if (i < this.creneau.length)
				this.creneau[i] = c;
		}
    }

    @Override
    public void afficher() {
        super.afficher();
        System.out.printf("Tarifs : %d €\n", MedecinGeneraliste.getTarif());
        System.out.printf("Adresse :\n");
        this.adresse.afficher();
        for (int i=0; i<nbCre;i++) {
            creneau[i].afficher();
        }
    }


}
