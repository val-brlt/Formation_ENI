

import java.util.Scanner;

public class Partie {
	
	private static Scanner scan = new Scanner(System.in); 
	private final static int SCORE_MAX = 21;
	private static boolean stop_j1 = false;
	private static boolean stop_j2 = false;


	public static void main(String[] args) {

		
		Joueur j1 = new Joueur("Pôtrick");
		Joueur j2 = new Joueur("Kaïza");
		De de = new De();
		boolean stop = false;
		
		while(!stop) {
			if (!stop_j1) {
			System.out.printf("\n---------------------------------------------------\n\n");
				switch(play(j1, j2, de)) {
					case 1 : stop_j1 = true;break;
					case 2 : stop_j1 = true;stop_j2 = true;break;
				}
			}
			if (!stop_j2) {
				System.out.printf("\n---------------------------------------------------\n\n");
				switch(play(j2, j1, de)) {
					case 1 : stop_j2 = true;break;
					case 2 : stop_j1 = true;stop_j2 = true;break;
				}
			}
			stop = stop_j2 && stop_j1;
		}
		// verif Gagnant
		checkWinner(j1, j2);
		scan.close();		
	}

	private static void checkWinner(Joueur j1, Joueur j2) {
		System.out.printf("\n---------------------------------------------------\n\n");
		if ((j1.getScore() > j2.getScore() && j1.getScore() <= 21) || j2.getScore() > 21) 
			System.out.printf("%s a gagné !", j1.getNom());
		else if ((j1.getScore() < j2.getScore() && j2.getScore() <= 21) || j1.getScore() > 21) 
			System.out.printf("%s a gagné !", j2.getNom());
		else 
			System.out.printf("%s et %s ont fini ex-aequo !", j1.getNom(), j2.getNom());
		System.out.printf("\n\n----------------------FIN DE PARTIE-----------------------------");
	}
	private static int play(Joueur j1,Joueur j2,De de) {
			if(saisie(j1).equals("O")) {
				lancerDe(j1, de);
			}
			else {
				return 1;				
			}
			if(j1.getScore() > SCORE_MAX) {
				System.out.printf("Vous avez dépassé 21 ! \n");
				return 2;
			}
			return 0;
	}

	private static void lancerDe(Joueur j, De de) {
		de.lancer();
		j.ajouterAuScore(de.getFaceTiree());
		System.out.printf("Vous avez fait %d. Votre nouveau score est %d\n", de.getFaceTiree(), j.getScore());
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
