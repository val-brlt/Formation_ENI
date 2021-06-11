
public class DemonstrationMethodes {


	
	private static final int RESERVE_ORDIS_COMMUN = 2;

	public static void main(String[] args) {
		
		// Utilisation d'une "procédure"
		afficherBonjour() ;
		
		afficherBonjour() ;

		// Utilisation d'une "fonction"
		int nbPersonnes;
		nbPersonnes = nombreDePersonnesDansLaPromotion() ;
		
		System.out.println("Nous sommes " + nbPersonnes);
		// Il est possible de ne pas utiliser de variable intermédiaire
		System.out.println("Nous sommes " + nombreDePersonnesDansLaPromotion());
		
		// affecter le "non-resultat" à un varaible
		// => Impossible
//		int nonResulat = afficherBonjour();
		
		float pourcentageChauve = calculerRatioCapilaire(27, 12);
		System.out.println("Il y a " + pourcentageChauve + " % de chauves.");
		
		
	}
	
	// Définition une procédure pour factoriser
	// l'affichage du message "Bonjour tout le monde"
	// "Procédure" = méthode qui ne renvoie PAS d'information 
	static void afficherBonjour() {
		
		String nomPromo = "Les petits kangourous" ;
		
		System.out.println("Bonjour " + nomPromo);
		
		System.out.println("Bienvenue aux  " + nombreDePersonnesDansLaPromotion());
		
		int ordisEn207 = 25;
		System.out.println("La salle 207 pourra accueillir " +
				nombreDePersonnesEnPresentiel(ordisEn207) + " personnes");
	}
	
//	int afficherBonjour() {
//		return 10;
//	}
	
	// "Fonction" = méthode qui renvoie une information
	
	 static int nombreDePersonnesDansLaPromotion() {
		
		return 27 ;
	}
	 
	 /**
	  * Calcule le nombre de personnes maximum en presentiel
	  * 
	  * @param nbOrdisDispos Doit etre > 0
	  * 
	  * @return Le nombre de personnes ou -99 si une erreur est survenue.
	  */
	 static int nombreDePersonnesEnPresentiel( int nbOrdisDispos  ) {
		
		 // on imagine qu'on conserve 2 ordinateurs à diposition de tout le
		 // monde 
		 // => il est possible d'accueillir (nbOrdisDispos - 2 ) personnes
		 
		return nbOrdisDispos - RESERVE_ORDIS_COMMUN  ;
	}
	 /**
	  * Calcule de pourcentage de personnes capilairement challengées.
	  * 
	  * @param nbPersonnes Doit etre > 0
	  * @param nbChauves Doit etre >= 0
	  * 
	  * @return Un réel entre 0 et 100 (inclus)
	  */
	 static float calculerRatioCapilaire(int nbPersonnes  , int nbChauves ) {
		 // Initialisatio nde la variable locale qui 
		 // va accueillir le résultat du calcul 
		 float resultat = 0.0f;
		 
		 // Etapes du calcul
		 //*---------------------
		 
		 //Etape 1 :
		 // vérification des contraintes métier
		 if (nbPersonnes >0 && nbChauves >=0 ) {
			 
			 //Etape 2
			 // calcul du ratio
			 resultat = (float) nbChauves / nbPersonnes; //  transtypage pour assurer que la division soit une division en float
			 // transformer en pourcentage
			 resultat = resultat * 100;
		 }
		 else {
			 System.out.println("Les paramètres d'entrée sont incorrects.");
		 }
		 
		 // Envoi de la réponse
		 return resultat;
	 }
	 

}








