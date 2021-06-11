import java.util.Scanner;

public class BulletinProcedurale {
	
	static Scanner scan = new Scanner(System.in);
	static String nom, prenom, statut;
	static int nbChildren, nbHours;
	static final float TAUX_HORAIRE = 10.25f;
	static String[] bulletin = new String[4];
	
	// Méthode pour saisie avec valeur en String + Texte
	static String scanString(String txt)  {
		System.out.print(txt);
		return scan.nextLine();
	}
	
	static int scanInt(String txt)  {
		System.out.print(txt);
		return scan.nextInt();
	}
	
	static String verifStatut (String txt) {
		int statut_nb = 0;
		do {
			statut_nb = scanInt(txt);
			if (statut_nb < 1 || statut_nb > 3) {
				System.out.println("Veuillez taper un chiffre entre 1 et 3");
			}
		}while (statut_nb < 1 || statut_nb > 3);
		

		switch (statut_nb) {
		case 1 : return "Cadre";
		case 2 : return "Agent de maîtrise";
		case 3 : return "Employé de bureau";
		}
		return "";
	}
	
	static int verifChildren(String txt) {
		int children_nb = -1;
		do {
			children_nb = scanInt(txt);
			if (children_nb < 0) {
				System.out.println("Veuillez taper un nombre d'enfant supérieur ou égal à 0");
			}
		}while (children_nb < 0);
		return children_nb;
	}
	
	static int verifHours(String txt) {
		int hours_nb = -1;
		do {
			hours_nb = scanInt(txt);
			if (hours_nb <= 0) {
				System.out.println("Veuillez taper un nombre d'heures supérieur à 0");
			}
		}while (hours_nb <= 0);
		return hours_nb;
	}
	
	static String verifHasString (String txt) {
		String has_string;
		do {
			has_string = scanString(txt);
			if (has_string.length() == 0) {
				System.out.println("Veuillez rentrer un nom/prénom");
			}
		}while (has_string.length() == 0);
		return has_string;
	}
	
	static String[] calculBulletin (int nbHours, int nbChildren) {
		String[] bulletinTemp = new String[9];
		float salaireBrut;
		float salaireNet;
		float prime = 0;
		float cotisation = 0;
		// Salaire de base (brut)
		System.out.println("Hours : " + nbHours);
		if(nbHours <= 169) 
			salaireBrut = nbHours * TAUX_HORAIRE;
		else if (nbHours <= 180) 
			salaireBrut = (float) (nbHours * (TAUX_HORAIRE * 1.50));
		else 
			salaireBrut = (float) (nbHours * (TAUX_HORAIRE * 1.60));
		System.out.println("SBRUT : " + salaireBrut);
		// Cotisations
			// Remboursement dette sociale etc
			cotisation += salaireBrut * 0.0349;
			// Contribution sociale généralisée non imposable
			cotisation += salaireBrut * 0.0615;
			// Assurance maladie
			cotisation += salaireBrut * 0.0095;
			// Asssurance vieillesse
			cotisation += salaireBrut * 0.0844;
			// Assurance chômage
			cotisation += salaireBrut * 0.0305;
			// Retraite complémentaire
			cotisation += salaireBrut * 0.0381;
			// Cotisation AGFF
			cotisation += salaireBrut * 0.0102;
		// Salaire (net)
			// Calcul prime
			if (nbChildren == 1)
				prime = 20;
			if (nbChildren == 2)
				prime = 50;
			if (nbChildren > 2)
				prime = 70 + 20 * (nbChildren - 2);
			// Calcul salaire à verser
			salaireNet = salaireBrut - cotisation + prime;
			
		// Affectation dans tableau
			bulletinTemp[5] = String.valueOf(salaireBrut);
			bulletinTemp[6] = String.valueOf(cotisation);
			bulletinTemp[7] = String.valueOf(prime);
			bulletinTemp[8] = String.valueOf(salaireNet);

		return bulletinTemp;

	}
	
	static void affichageBulletin (String[] bulletin) {
		System.out.println("----------------------------------------------------------------------------------");
		System.out.println("    BULLETIN DE PAYE\n");
		System.out.println("    " + bulletin[0] + " " + bulletin[1] + "\n\n");
		System.out.println("STATUT : " + bulletin[2]);
		System.out.println("NOMBRE D'ENFANTS : " + bulletin[3]);
		System.out.println("NOMBRE D'HEURES EFFECTUES : " + bulletin[4]);
		System.out.println("SALAIRE BRUT : " + bulletin[5]);
		System.out.println("COTISATIONS : " + bulletin[6]);
		System.out.println("PRIME : " + bulletin[7]);
		System.out.println("SALAIRE NET : " + bulletin[8]);
		System.out.println("\n----------------------------------------------------------------------------------");
	}
	
	static void affichageRecap (int nbBulletins, float sommeSalaireBrut) {
		System.out.println("-- Récap --");
		System.out.println("Nombre de bulletins : " + nbBulletins);
		System.out.println("Somme des salaires brut : " + sommeSalaireBrut);
	}
	
	public static void main(String[] args) {
		char stop;
		int nbBulletins = 0;
		float sommeSalaireBrut = 0;
		do {
			prenom = verifHasString("Prénom de l'employée ? ");
			nom = verifHasString("Nom de l'employée ? ");
			statut = verifStatut("Statut de l'employée ?\n1 - cadre\n2 - Agent de maitrise\n3 - employé de bureau\n");
			nbChildren = verifChildren("Nombre d'enfants ? ");
			nbHours = verifHours("Nombre d'heures effectué par un employé ? ");
			System.out.println("Hours1 : " + nbHours);

			bulletin = calculBulletin(nbHours,nbChildren);
			bulletin[0] = prenom;
			bulletin[1] = nom;
			bulletin[2] = statut;
			bulletin[3] = String.valueOf(nbChildren);
			bulletin[4] = String.valueOf(nbHours);
			affichageBulletin(bulletin);
			sommeSalaireBrut += Float.parseFloat(bulletin[5]);
			nbBulletins++;
			System.out.println("Voulez vous continuer ? (y/N)");
			stop = scan.next().charAt(0);
			scan.nextLine();
		}while(stop != 'N');

		affichageRecap(nbBulletins,sommeSalaireBrut);
		
	}
	

}
