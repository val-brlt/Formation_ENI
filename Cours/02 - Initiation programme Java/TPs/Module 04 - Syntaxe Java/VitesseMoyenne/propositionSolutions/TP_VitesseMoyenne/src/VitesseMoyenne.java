import java.util.Scanner;

public class VitesseMoyenne {

	// Calcule la vitesse moyenne de déplacement
	
	static float distance ,  // en km
				 temps ;  	// en minutes
	
	final static int UNE_HEURE = 60; // en minutes
	
	public static void main(String[] args) {
		
		System.out.println(  "Saisissez la distance parcourue (km)" );
		
		// Obtenir un Scanner = mettre en place un outil qui va permettre 
		// 	la saisie par l'utilisateur
		Scanner scanDistance = new Scanner(System.in);
		// Utiliser ce Scanner
		distance = scanDistance.nextFloat();
		
		System.out.println( "Saisissez le temps de parcours (min)" );
		temps = scanDistance.nextFloat(); 
		
		// Code technique : libérer les ressources
		scanDistance.close();
		
		// Conversion en heures
		temps = temps / UNE_HEURE;
		
		System.out.println("Vous vous êtes déplacé à " + distance / temps + " km/h") ;

		
	}

}
