import java.util.Scanner;

public class TasDeCroquettes {

	static final int CROQUETTES_PAR_SACHET = 64;
	static final int NB_CROQUETTES_JOURNALIER = 38;
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		int paquetsAchetes = 0;
		
		System.out.print("Combien de chats faut-il nourir ?");
		int nbCat = scan.nextInt(); 
		
		while(paquetsAchetes * CROQUETTES_PAR_SACHET < NB_CROQUETTES_JOURNALIER * nbCat)
			paquetsAchetes++;

		System.out.print("Il faut acheter " + paquetsAchetes + " paquets de croquettes.");
	}

}
