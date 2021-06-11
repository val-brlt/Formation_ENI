
public class TestBoucles {

	static final float ALCOOLEMIE_MAXIMUM = 0.25f;
	static final int NB_DE_JOURS_DANS_UNE_SEMAINE = 7;

	public static void main(String[] args) {

		//  TANT QUE
		//************************
		
		int nombreKebabEnVille = 12;
		int joursEcoulés = 0;
		
		// Tant qu'il y des kebab en ville pendant une semaine...
		while (  nombreKebabEnVille > 0 && joursEcoulés < NB_DE_JOURS_DANS_UNE_SEMAINE ) {
			// ...on affiche tout va bien
			System.out.println( " Tout va bien");
			
			// mais 1 kebab disparait chaque jour.
			joursEcoulés = joursEcoulés + 1; // OU joursEcoulés++;
			nombreKebabEnVille = nombreKebabEnVille - 1;
			// OU
			// nombreKebabEnVille--;
		}
		
		System.out.println(" Mangeons des pizzas");
		
		
		// Boucle REPETER
		//**********************************
		
		float alcoolemie = 0.0f;
		do {
			// Boire un coup
			System.out.println("Glou glou");
			
			alcoolemie = alcoolemie + 0.1f;
			
		} while ( alcoolemie  < ALCOOLEMIE_MAXIMUM  ) ; // Attention à ne pas oublier le point-virgule
		// tant que notre alcoolémie est inférieure à 0,25g/l
		
		System.out.println("Je rentre à pied");
		
		
		// Boucle POUR
		// ***********************************
		
		int nbDejoueuses = 11;
		// Pour chacune des 11 places disponbiles de l'équipe de foot....
		for ( int  compteur = 1 ; compteur <= nbDejoueuses  ; compteur++   ) {
			
			// ... je recrute une joueuse
			System.out.println("Bienvenue dans l'équipe. Tu seras la n°"+compteur);
		
		}
		
		
		// exemple de syntaxe avec lusueurs varaibles compteurs :
		//	for ( int  compteur = 0 , j = 5 ; compteur < 11 && j>0  ; compteur++ , j=j-2  ) {
		// }  			
		
	}

}
