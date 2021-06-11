
public class TestStructuresControle {

	public static void main(String[] args) {

		boolean estEndetteTrentePourcent = false;

		boolean nEstPasEndette = !estEndetteTrentePourcent;
//		boolean pasEndette = true;
		boolean estSolvable = false;

		// puis-je pretendre à un nouvel emprunt ?
//		if ( estSolvable && ! estEndetteTrentePourcent ) {
//		if ( estSolvable && pasEndette ) {

		// SI
		if (estSolvable && nEstPasEndette) {
			// ALORS faire ça
			System.out.println("OK pour un nouvel emprunt");

		}
		// SINON...
		else {
			// ... faire ceci
			System.out.println("Impossible de prétendre à un nouvel emprunt");
		}

		// Branchement conditionnel = SELON
		int jour = 5;
		// SELON
		switch (jour) {
			case 1:
				System.out.println("Lundi");
				break;
			case 2:
				System.out.println("Mardi");
				break;
			case 3:
				System.out.println("Mercredi");
				break;
			case 4:
				System.out.println("Jeudi");
				break;
			case 5:
				System.out.println("Vendredi");
			case 6:
				System.out.println("Samedi");
			case 7:
				System.out.println("Dimanche");
				break;
	
			/* AUTRE */default:
				System.out.println("Erreur");
		}

		System.out.println("FIN");

	}

}
