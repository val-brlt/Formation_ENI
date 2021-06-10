import java.util.Scanner;

public class TempsDeCuisson2 {
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
	
	
	// Méthode pour saisie avec valeur en réel + Texte + vérifie si il s'agit bien d'un réel
	static float scanFloat(String txt)  {
		System.out.print(txt);
        if (scan.hasNextFloat()) {
            return scan.nextFloat();
        }
        else {
            System.out.println("Ce poids n'est pas valide...");
            erreur = true;
        }
        return 0;
	}
	
	// Méthode pour saisie avec valeur en String + Texte
	static String scanString(String txt)  {
		System.out.print(txt);
		String stringScan = scan.nextLine();
		return stringScan;
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
	
	
	// retourne true si ERREUR 
	static boolean traitementAgneau (String cuisson, float poids) {
		switch (cuisson) {
		case "Bleu" : temps = poids * 15 * MINUTE/AGNEAU;
			break;
		case "A point" : temps = poids * 25 * MINUTE/AGNEAU;
			break;
		case "Bien cuit" : temps = poids * 40 * MINUTE/AGNEAU;
			break;
		default : System.out.print("Ce type de cuisson n'est pas pris en compte");
				return false ;
	}
		return true;
	}
	
	
	// si ERREUR , RETOURNE FALSE
	static boolean traitementBoeuf (String cuisson, float poids) {
		switch (cuisson) {
		case "Bleu" : temps = poids * 10 * MINUTE/BOEUF;
			break;
		case "A point" : temps = poids * 17 * MINUTE/BOEUF;
			break;
		case "Bien cuit" : temps = poids * 25 * MINUTE/BOEUF;
			break;
		default : System.out.print("Ce type de cuisson n'est pas pris en compte");
				return false;
	}
		return true;
	}
	
	
	
	
	
	// RETOURNE FALSE SI ERREUR
	static boolean traitementViande (String viande, String cuisson, float poids) {
		switch (viande) {
		case "Boeuf" : 
			if(!traitementBoeuf(cuisson, poids))
				return false;
			break;
		case "Agneau" : 
			if(!traitementAgneau(cuisson, poids))
				return false;
			break;
		default : System.out.println("Ce type de viande n'est pas géré par ce programme...");
			return false;
		}
		return true;
	}
	 
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		

		// Programme
		viande = scanString("saisissez le type de viande (Boeuf ou Agneau) : ");
		cuisson = scanString("saisissez la cuisson de la viande (Bleu, A point ou Bien cuit) : ");
		poids = scanFloat("saisissez le poids de la viande (gramme) : ");

		// Tri selon la viande, cuisson et poids
		if(!traitementViande(viande, cuisson, poids))
			erreur = true;

		// Message de fin
		if (!erreur) {
			String poids_s = intOrFloat(poids);
			String temps_s = intOrFloat(temps);
			System.out.println("Pour " + poids_s + " grammes de " + viande + " et avec une cuisson " + cuisson + ", il faut un temps de cuisson de " + temps_s + " secondes");
		}
		scan.close();
	}

}
