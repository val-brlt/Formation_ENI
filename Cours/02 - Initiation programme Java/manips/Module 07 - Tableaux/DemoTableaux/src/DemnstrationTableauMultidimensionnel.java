import java.util.Arrays;

public class DemnstrationTableauMultidimensionnel {

	public static void main(String[] args) {
	
		// Déclaraion d'un tableau à 2 dimensions
		int[][] grille ;
		// Reservatio nde l'espace mémoire 
		grille = new int[2][3];
		
		// initialisation
		grille[0][0] = 11;
		grille[0][1] = 12;
		grille[0][2] = 13;
		grille[1][0] = 21;
		grille[1][1] = 22;
		grille[1][2] = 23;
		
		System.out.println(" grille : " + Arrays.deepToString(grille));
		
		// En Java, ous manipulons des tableaux de tableaux
		String[][] membresDesFamilesDuQuartier = new  String[2][];
		
		String[] familleToto = new String[3];
		familleToto[0] = "Kilian";
		familleToto[1] = "Herbert";
		familleToto[2] = "JeanPatoche"; 	
		
		membresDesFamilesDuQuartier[0] = familleToto;
		
		// Valorisation d'un tableau par un litéral de tableau
		String[] familleTutu = { "Josiane"  , "Roland" , null, null };
		
		
		membresDesFamilesDuQuartier[1] = familleTutu;
		
		System.out.println(" grille : " + Arrays.deepToString(membresDesFamilesDuQuartier));
		
		familleTutu[2] = "Cookie" ;
		
		System.out.println(" grille : " + Arrays.deepToString(membresDesFamilesDuQuartier));
		
	}

}

