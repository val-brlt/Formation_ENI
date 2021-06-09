import java.util.Scanner;

public class TempsDeCuisson {
	//affiche le temps cuisson en fonction du type de viande, de cuisson voulue et du poids

	// Déclaration variable
	static final int MINUTE = 60, BOEUF = 500, AGNEAU = 400;
	static String viande, cuisson;
	static float poids = 0, temps = 0;
	static boolean erreur = false;
	static Scanner scan = new Scanner(System.in);
	
	// Retourne VRAI Si la valeur est un int
	static boolean isInt (float val) {
		int val_int = (int)val;
		float temp = val - val_int;
		if (temp > 0 )
			return false;
		return true;
	}
	
	// Affecte la valeur à un texte selon si c'est un int ou non
	static String intOrFloat (float val) {
		String txt;
		int val_int = (int) val;
		if (isInt(val))
			txt = String.valueOf(val_int);
		else
			txt = String.valueOf(val);
		return txt; 
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		

		
		// Programme
		System.out.print("saisissez le type de viande (Boeuf ou Agneau) : ");
		viande = scan.nextLine();
		System.out.print("saisissez la cuisson de la viande (Bleu, A point ou Bien cuit) : ");
		cuisson = scan.nextLine();
		System.out.print("saisissez le poids de la viande (gramme) : ");

		// Vérif si la valeur du poids rentré par l'user est bien un réel
		while(!erreur && poids == 0) {
            // if the next is a Float,
            // print found and the Float
            if (scan.hasNextFloat()) {
                poids = scan.nextFloat();
            }
  
            // if no float is found,
            // print "Not Found:" and the token
            else {
                System.out.println("Ce poids n'est pas valide...");
                erreur = true;
            }
		}

		
		// Tri selon la viande, cuisson et poids
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
		
		

		// Message de fin
		if (!erreur) {
			String poids_s = intOrFloat(poids);
			String temps_s = intOrFloat(temps);
			System.out.println("Pour " + poids_s + " grammes de " + viande + " et avec une cuisson " + cuisson + ", il faut un temps de cuisson de " + temps_s + " secondes");

		}
	
		scan.close();
	}

}
