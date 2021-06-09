import java.util.Scanner;

public class TableDeMultiplication {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int nb, i;
		
		
		System.out.print("Entrez le numéro de la table de multiplication : ");
		nb = scan.nextInt();
		
	
		System.out.println("\nAvec une boucle for : \n");
		for (i = 1; i<= 10; i++) 
			System.out.println(i + " x " + nb + " = " + i*nb);
		
		
		i = 0;
		System.out.println("\nAvec une boucle while : \n");
		while (i++ < 10) 
			System.out.println(i + " x " + nb + " = " + i*nb);
		
		scan.close();
	}
}
