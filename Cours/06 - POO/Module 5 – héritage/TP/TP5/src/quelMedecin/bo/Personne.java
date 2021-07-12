package quelMedecin.bo;



public class Personne {
    
    protected String nom;
    protected String prenom;
    protected String tel;
    protected Adresse adresse;
   
    public Personne(String nom,String prenom,String tel,Adresse adresse) {
        this.nom=nom;
        this.tel=tel;
        this.prenom=prenom;
        this.adresse = adresse;
    }

    public void afficher() {
        System.out.printf("%s %s\n", this.nom.toUpperCase(), this.prenom);
        System.out.printf("Téléphone : %s\n", this.tel);
    } 
}

