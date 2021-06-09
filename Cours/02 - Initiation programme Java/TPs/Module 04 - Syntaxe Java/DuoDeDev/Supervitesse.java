
public class Supervitesse {

	static final float VITESSE_MAX = 300000; // en m/s
	
	public static void main(String[] args) {
		float vitesseActuelle = 0;
		int acceleration = 9;
		int compteur = 0;
		
		while (vitesseActuelle < VITESSE_MAX)
		{
			vitesseActuelle = vitesseActuelle + compteur*acceleration;
			compteur ++;
			System.out.println("On danse la macarena, ça optimise le programme");
		}
		
		System.out.println("Il aura fallu " + compteur + " itérations pour atteindre la SuperVitesse");
		
	}

}
