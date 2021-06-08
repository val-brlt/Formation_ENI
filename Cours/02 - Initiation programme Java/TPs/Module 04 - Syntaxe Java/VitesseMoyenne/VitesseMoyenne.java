import java.util.Scanner;

public class VitesseMoyenne {
	
	public static void main(String[] args) {
		// Déclaration des variables
		final int UNE_HEURE = 60;
		Scanner scan =  new Scanner(System.in);
		float dist;
		
		// Programme 
		System.out.print("Saisissez la distance parcourue (km) : ");
		dist = scan.nextFloat();
		System.out.print("Saisissez le temps de parcours (min) : ");
		System.out.println("Vous vous êtes déplacé à " + dist / (scan.nextFloat() / UNE_HEURE) + " km/h");
		
		scan.close();
	}
}
