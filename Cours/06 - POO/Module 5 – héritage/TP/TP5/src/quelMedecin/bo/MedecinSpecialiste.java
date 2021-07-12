package quelMedecin.bo;


public class MedecinSpecialiste extends MedecinGeneraliste {
    
    private String nom_spe;
    public static int tarif = 25;


    public MedecinSpecialiste(String nom, String prenom, String tel, Adresse adresse, String nom_spe, int tarif) {
        super(nom, prenom, tel, adresse);
        this.nom_spe = nom_spe;
        MedecinSpecialiste.tarif = tarif;
    }

    @Override
    public void afficher() {
        System.out.printf("%s %s\n", this.nom.toUpperCase(), super.prenom);
        System.out.printf("Téléphone : %s\n", super.tel);
        System.out.printf("Spécialité : %s\n", this.nom_spe);
        System.out.printf("Tarifs : %d €\n", MedecinGeneraliste.getTarif());
        System.out.printf("Adresse :\n");
        this.adresse.afficher();
		for (int i = 0; i < super.creneau.length; i++) {
			if (super.creneau[i] != null)
                super.creneau[i].afficher();
		}
    }


}
