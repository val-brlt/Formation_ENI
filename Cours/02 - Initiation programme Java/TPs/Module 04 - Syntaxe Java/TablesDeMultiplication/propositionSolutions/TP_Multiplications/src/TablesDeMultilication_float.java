import java.util.Scanner;

public class TablesDeMultilication_float {

	public static void main(String[] args) {

		
		// Etape 1 :
		// Demandez à l'utilisateur quelle table de 
		// multiplication il souhaite afficher.
		// --------------------------
		
		// 1.1 Affichage du message demandant la saisie
		System.out.println("Quelle table de multilication voulez-vous affichez ? :");
		
		// 1.2 Recupération de la saisie
		
		// 1.2.1 Déclaration d'une varraible nommée "table" de type entier
		// afin de stocker l'information siasie par l'utilisateur
		float table;
		
		// 1.2.2 Déclaration et obtention d'un exemplaire de Scanner
		Scanner scan = new Scanner(System.in);

		// 1.2.3 Recupération de la saisie dans une variable "table"
		table = scan.nextFloat();
		
		// 1.2.4 Fermer le Scanner pour libérer les ressources de l'ordinateur
		scan.close();


		// Etape 2 :
		// A l'aide d'une boucle , afficher 
		// les 10 premiers éléments de la table.
		// --------------------------------
		
		// Avec une boucle FOR
		//---------------------------
		System.out.println("Boucle FOR");
		// Pour chaque multiplicateur de 1 à 10...
		int nbDeCalculs = 10;
		float multiplicateur = 0;
		float  produit = 0;
		//for (int multiplicateur = 1 ; multiplicateur <= nbDeCalculs ; multiplicateur++ ) {
		for (int i = 0 ; i < nbDeCalculs ; i++ ) {
			
			multiplicateur = i + 1 ;
			
			// Recupérer le produit : la valeur de la multiplication à afficher
//			byte produit = (byte) (table * multiplicateur); // attention au type de la variable : s'il est trop "petit" (la plage de valeur est trop restreinte), la variable ne pourra pas accueillir tous les résultats.
		
			produit = table * multiplicateur;
			
			// Afficher le produit
			System.out.println(table + " x " + multiplicateur + " = " + produit);
			
			// N'afficher que 1 chiffre après la virgule pour le produit
//			System.out.format(" %f x %f = %.1f \n", table , multiplicateur , produit);
		}
		
		// Saut à la  lingne pour distinguer les méthodes à l'affichage
		System.out.println();
		
		// Avec une boucle WHILE  ( = TANT QUE )
		//---------------------------
		System.out.println("Boucle WHILE");
		
		// réinitialiser la varibale "multiplicateur" pour repartir du début
		multiplicateur = 1;
		
		// "On ne souhaite afficher que le 10 premiers produits de la table" 
		//Tant que le multiplicateur est strictement inférieur à 11
		while ( multiplicateur < nbDeCalculs + 1 ) {
			// traitement métier 
			produit = table * multiplicateur;
			
			System.out.println(table + " x " + multiplicateur + " = " + produit);
			
			// modificateur du compteur
			multiplicateur++ ;
		}
		
		// Avec une boucle DO...WHILE  ( = REPETER )
		//---------------------------
		System.out.println("\nBoucle DO...WHILE");
		
		// réinitialiser la varibale "multiplicateur" pour repartir du début
		multiplicateur = 1;
				
		do {
			// traitement métier 
			produit = table * multiplicateur;
						
			System.out.println(table + " x " + multiplicateur + " = " + produit);
						
			// modificateur du compteur
			multiplicateur++;
			
		} while (multiplicateur < nbDeCalculs + 1)  ;
		
		
	}

}
