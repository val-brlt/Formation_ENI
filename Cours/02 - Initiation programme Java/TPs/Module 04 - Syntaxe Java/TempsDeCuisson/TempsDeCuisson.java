import java.util.Scanner;

public class TempsDeCuisson {
	//affiche le temps cuisson en fonction du type de viande, de cuisson voulue et du poids

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Déclaration variable
		final int MINUTE = 60, BOEUF = 500, AGNEAU = 400;
		String viande, cuisson;
		float poids, temps = 0;
		boolean erreur = false;
		Scanner scan = new Scanner(System.in);
		
		// Programme
		System.out.print("saisissez le type de viande (Boeuf ou Agneau) : ");
		viande = scan.nextLine();
		System.out.print("saisissez la cuisson de la viande (Bleu, A point ou Bien cuit) : ");
		cuisson = scan.nextLine();
		System.out.print("saisissez le poids de la viande (gramme) : ");
		poids = scan.nextFloat();
		
		switch (viande) {
		case "Boeuf" : 
				switch (cuisson) {
					case "Bleu" : temps = poids * 10 * MINUTE/BOEUF;
						break;
					case "A point" : temps = poids * 17 * MINUTE/BOEUF;
						break;
					case "Bien cuit" : temps = poids * 25 * MINUTE/BOEUF;
						break;
					default : System.out.print("Ce type de cuisson n'est pas pris en compte");
							erreur = true;
				}
				break;
		case "Agneau" : 
			switch (cuisson) {
				case "Bleu" : temps = poids * 15 * MINUTE/AGNEAU;
					break;
				case "A point" : temps = poids * 25 * MINUTE/AGNEAU;
					break;
				case "Bien cuit" : temps = poids * 40 * MINUTE/AGNEAU;
					break;
				default : System.out.print("Ce type de cuisson n'est pas pris en compte");
						erreur = true;
			}
			break;
		default : System.out.println("Ce type de viande n'est pas géré par ce programme...");
			erreur = true;
		}
		
		if (!erreur)
			System.out.println("Pour " + poids + " grammes de " + viande + ", il faut un temps de cuisson de " + temps + " secondes");
	
		scan.close();
	}

}
