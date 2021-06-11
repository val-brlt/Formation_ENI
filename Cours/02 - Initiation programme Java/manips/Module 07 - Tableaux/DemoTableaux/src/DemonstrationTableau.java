import java.lang.reflect.Array;
import java.util.Arrays;

public class DemonstrationTableau {

	public static void main(String[] args) {

		// Vraible monovaluée (= qui ne cotient qu'une valeur)
		//-----------------------------------------
		// Déclaratrion 
		int nombrePattes;
		// Initialisation
		nombrePattes = 8;
		
		// Variable de type tableau = variable multivaluée
		// (= qui contient plusieurs valeurs)
		
		// Déclaration d'un tableau
		float[] prixMenus; // la type c'est float[] . 
						   // Cela se lit "tableau de float"
		
		// Initialisation du tableau
		prixMenus = new float[4]; // on réserve 4 cases de la taille d'un float
		
				// Lire les cases du tableau
		float prixMenuEnfant = prixMenus[1]; // 2e case -> indice 1 car les indieces démarrent à zéro
		
		// Ecrire dans la 4e case (=> indece 3)
		prixMenus[3] = 55.95f;
		
		// Connaitre la taille du tableau
		int tailleDuTableau = prixMenus.length;
		
		// Déclaration d'une autre variable de type "tableau de float"
		float[] autreTableau;
		
		// On copie la valeur de prixMenus dans autreTableau
		// On crée un "nouveau chemin" vers le tableau en mémoire
		autreTableau = prixMenus; 
		
		// Désormais, utiliser prixMenus ou autreTableau revient à la meme chose
		// (les deux mènent à la meme adresse mémoire)
		System.out.println("1ere case de prixMenus = " +  prixMenus[0]);
		System.out.println("1ere case de autreTableau = " +  autreTableau[0]);
		prixMenus[0] = 99.9f;
		System.out.println("1ere case de prixMenus = " +  prixMenus[0]);
		System.out.println("1ere case de autreTableau = " +  autreTableau[0]);
		
		// Si on chercher à faire des actions "intelligentes" sur un tableau,
		// on peut utiliser la classe Arrays.
		
		// Dupliquer un tableau
		float[] copieDePrixMenus;
		int longueurDeLacopie = prixMenus.length; // en fonction de la taille
												//du nouveau tableau, on va avoir une copie identique,
												// 	ou tronquée, ou avec de nouvelles case vides à la fin
		copieDePrixMenus = Arrays.copyOf(prixMenus, longueurDeLacopie);
		
		// Afficher un tableau
		System.out.println("prixMenus : " + prixMenus); // pas ça
		System.out.println("prixMenus : " + Arrays.toString( prixMenus) );
		
		// Replir troutes les cases  d'un tableau avec la meme valeur
		boolean[] membresDeLaPromosReveilles = new boolean[27]; 
		Arrays.fill(membresDeLaPromosReveilles, true);
		System.out.println("membresDeLaPromosReveilles : " + Arrays.toString( membresDeLaPromosReveilles) );
		
		// Trier un tableau selon l'ordre naturel du type de ses éléments
		System.out.println("\nprixMenus (avant tri) : " + Arrays.toString( prixMenus) );
		Arrays.sort(prixMenus);
		System.out.println("prixMenus (apres tri) : " + Arrays.toString( prixMenus) );
	}
	
	/**
	 * Ontenir l'ensemble de tailles de vetements disponibles en magasin.
	 * 
	 * @return  [ "XS", "S", "M" , "L", "XL"] 
	 */
	static String[] obtenirListeDesTaillesDeVetements() {
		
		String[]  tableau = new String[5];
		
		tableau[0] = "XS";
		tableau[1] = "S";
		tableau[2] = "M";
		tableau[3] = "L";
		tableau[4] = "XL";
		
		
		return tableau;
		
	}
	
	
	
	

}
