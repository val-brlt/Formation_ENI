package poo.ultrabattle;

import java.util.Scanner;

public class Partie {
	
	private Scanner scan = new Scanner(System.in); 

	public static void main(String[] args) {




		scan.close();		
	}



	/**
	 * 
	 * @param j1
	 * @return
	 */
	private static String saisie(Joueur j1) {

		String choix = "";
		
		do {
			System.out.println(j1.getNom() + ", votre score est " + j1.getScore() + "\nVoulez-vous continuer ? (O/N)");
			if (scan.hasNextLine()) {
				choix = scan.nextLine();
			}
			choix = choix.toUpperCase(); // simplifie les comparaisons ("O" et "N", pas besoin "o", ni "n")
		} while (!choix.equals("O") && !choix.equals("N"));
		
		return choix;
	}

}
