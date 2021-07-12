package quelMedecin.bo;

public class Adresse {
    
    private String com;
    private int nb_voie;
    private String com_nb_voie;
    private String name_voie;
    private int cp;
    private String ville;

    public Adresse(String com,int nb_voie,String com_nb_voie,String name_voie,int cp,String ville) {
        this.com = com;
        this.nb_voie = nb_voie;
        this.com_nb_voie = com_nb_voie;
        this.name_voie = name_voie;
        this.cp = cp;
        this.ville = ville;
    }
    //Adresse(int, null, String, int, String)
    public Adresse(int nb_voie,String com_nb_voie,String name_voie,int cp,String ville) {
        this.nb_voie = nb_voie;
        this.name_voie = name_voie;
        this.cp = cp;
        this.ville = ville;
    }

    public void afficher() {
        if (this.com != null)
            System.out.printf("%s\n", this.com);
        System.out.printf("%d", this.nb_voie);
        if (this.com_nb_voie != null)
            System.out.printf("%s", com_nb_voie);
        System.out.printf(" %s\n", this.name_voie);
        System.out.printf("%d %s\n", this.cp, this.ville.toUpperCase());

    }
}


/*

ZAC du Moulin Neuf
2B rue Benjamin Franklin
44800 SAINT HERBLAIN




	Adresse sh = new Adresse("ZAC du Moulin Neuf", 2, "B", "rue Benjamin Franklin", 44800, "Saint Herblain");
	Adresse nio = new Adresse(19, null, "avenue Léo Lagrange", 79000, "Niort");


Selon les recommandations (simplifiées) de La Poste, une adresse française se compose en principe :
•	de mentions complémentaires éventuelles (comme l’appartement, l’étage, l’escalier, « chez… »,
     le bâtiment ou de la résidence) ;

•	du numéro dans la voie (éventuellement suivi d’un complément de numéro tel bis, ter, quater, etc.) 
    immédiatement suivi (sans virgule) du type de voie (rue, avenue, etc.) et du nom de celle-ci ;

•	du code postal de 5 chiffres sans séparation suivi du nom de la commune en lettres capitales.

Cette classe doit posséder deux constructeurs : l’un toutes les informations
 et un second sans les mentions complémentaires qui sont alors initialisées avec la valeur null.

Cette classe doit également posséder une méthode d’instance afficher().

Copier dans le package  fr.eni.ecole.quelMedecin.test  la classe TestAdresse fournie,
 elle vous permettra de vérifier le fonctionnement final.
*/