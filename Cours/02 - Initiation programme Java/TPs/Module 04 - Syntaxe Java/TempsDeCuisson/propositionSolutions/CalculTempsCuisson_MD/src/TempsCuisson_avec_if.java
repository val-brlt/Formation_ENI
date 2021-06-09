import java.util.Scanner;

public class TempsCuisson_avec_if {

	// Déclaration de variables globales
	static String viande, cuisson ;
	static float poids, temps ;
	static boolean erreur = false; // declaration et affectation (de la valeur false)
	
	// Déclaration de constantes globales
	static final int MINUTE = 60 ;
	static final int BOEUF = 500;
	static final int AGNEAU = 400 ; 
	
	// Methode princiale ( c'est-à-dire le point d'entrée dans l'aaplication)
	public static void main(String[] args) {
		
		// Affichez un message à l'utilisateur pour l'inviter à saisir sa viande
		System.out.println("saisissez le type de viande (Boeuf ou Agneau)");
		
		// Obtenir un Scanner = mettre en place un outil qui va permettre 
		// 	la saisie par l'utilisateur
		Scanner scan = new Scanner(System.in);
		// utliser l'outil Scanner (anipulé au travers de la variable locale scan)
		viande = scan.nextLine();
		
		System.out.println("saisissez le poids de la viande (gramme)");
		poids = scan.nextFloat();
		// "purge" du caractere de fin de ligne ('\n')
		// car après la saisie du numérique, on veut saisir une chaine de caracteres
		scan.nextLine();
		
		System.out.println("saisissez la cuisson de la viande (Bleu, A point ou Bien cuit)");
		// on réutilise le meme Scanner ( via la variable scan déjà déclarée et valorisée) 
		cuisson = scan.nextLine();

		// On sait qu'ojn ne va plus demander de saisie à 
		// l'utilisateur. Donc on ferme le Scanner
		scan.close();
		
		// si la saisie utilisateur est égale à "Boeuf"...
//		if ( viande == "Boeuf") {
		if ( viande.equals("Boeuf")  ){	
			System.out.println("La viande est Boeuf");
			
			switch ( cuisson ) {
				case   "Bleu" : temps = poids * 10 * MINUTE / BOEUF     ;
						System.out.println("La cuisson est Bleu");
						break;
						
				case   "A point" : temps = poids * 17 * MINUTE / BOEUF   ;
						System.out.println("La cuisson est A point");
						break;
						
				case   "Bien cuit" : temps = poids * 25 * MINUTE / BOEUF ;
						System.out.println("La cuisson est Bien cuit");
						break;
				
				default : 
						System.out.println("Ce type de cuisson n'est pas pris en compte");
						erreur = true;
			}
			
		}
		
		//... sinon, si c'est égal à "Agneau"...
		else if ( viande.equals ("Agneau")  )  {
			System.out.println("La viande est Agneau");
			
			switch ( cuisson ) {
				case   "Bleu" : temps = poids * 15 * MINUTE / AGNEAU      ;
						System.out.println("La cuisson est Bleu");
						break;
						
				case   "A point" : temps = poids * 25 * MINUTE / AGNEAU   ;
						System.out.println("La cuisson est A point");
						break;
						
				case   "Bien cuit" : temps = poids * 40 * MINUTE / AGNEAU ;
						System.out.println("La cuisson est Bien cuit");
						break;
				
				default : 
						System.out.println("Ce type de cuisson n'est pas pris en compte");
						erreur = true;
			}
			
		} 
		// ... sinon (cas par défaut)
		else {
			System.out.println("Ce type de viande n'est pas géré par ce programme...");
			erreur = true;
		}

			
		// S'il n'y a pas d'erreur
		// (avec 3 expressions differentes dans le if)
		boolean pasDErreur = ! erreur;
//		if ( erreur == false ) {
		if ( ! erreur ) {
//		if ( pasDErreur ) {
			System.out.println("Pour " + poids + " grammes de " + viande + ", il faut un temps de cuisson de " + temps + " secondes");
		}
		

		System.out.println("Fin du programme");
	}

}






