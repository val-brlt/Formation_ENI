
public class Resto {

	
	// Méthode qui affiche un texte
	static void afficherContentement()  {
		System.out.println("Vive l'ouverture des restaurants ! ");
	}
	
	// Méthode qui retourne le nombre de personnes autorisés dans le restaurant
	static int obtenirJauge()  {
		return 30;
	}
	
	public static void main(String[] args) {
		afficherContentement();
		System.out.println("Nombre de personnes autorisés dans  le restaurant : " + obtenirJauge());
	}
}
