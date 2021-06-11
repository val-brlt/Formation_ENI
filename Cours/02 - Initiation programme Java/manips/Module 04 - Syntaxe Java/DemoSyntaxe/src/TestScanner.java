import java.util.Scanner;

/**
 * Pour lire une saisie utilisateur 
 */
public class TestScanner {

	public static void main(String[] args) {

		// Déclaration d'une variable de type Scanner
		Scanner scan;
		
		// Obtienir un Scanner
		// Affecter ce Scanner à la variable pour pouvoir le 
		// manipuler au travers de la variable.
		scan = new Scanner(System.in);
		
		
		// Utilisation du Scanner
		//***************************
		int entierSaisi = scan.nextInt();
		
		// Afficher la valeur de la variable entierSaisi
		// (pour vérifer)
		System.out.println("entierSaisi = " + entierSaisi);
		// "purger" le caractere de retour à la ligne saisi par 
		// l'utilisateur lors de la 1ere saisie
		scan.nextLine();
		
		
		// Je souhaite une 2e saisie de l'utilisateur (une chaine de caracteres)
		String deuxiemeSaisie = scan.nextLine();
		// Afficher la valeur de la variable deuxiemeSaisie
		// (pour vérifer)
		System.out.println("deuxiemeSaisie = " + deuxiemeSaisie + "ZZZZZZ");
		
		
		// Ferme la canal de saisie
		scan.close();
		
		
	}

}
