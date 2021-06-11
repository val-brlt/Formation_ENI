
public class DemoConversionTypes {

	public static void main(String[] args) {

		float f1 = 12; // 12 est un int converti implicitement en un float
					// puis stocké dans la variable f1
		
		System.out.println("f1 = " + f1);

		// f1 pourrait avoir une inforation plus précise qu'un simple entier
		f1 = 54.3f;
		
		// conversion explicite car il y a un risque de perte d'information
		int i1 = (int) f1; // "transtypage" explicite  OU  "cast" explicite
		
		System.out.println("i1 = " + i1);
		
		
		char c1 = 'a';
		System.out.println ( "c1 = " + c1 ) ;
		
		int i3 = c1;
		System.out.println("i3 = " + i3);
		
		// "Je sais ce que je fais, transforme la valeur de i3 en char"
		char c2 = (char) i3;
		System.out.println("c2 = " + c2);
		
		//***********************
		// Les opérateurs sont typés : la division de 2 entiers donne un entier (4/3 = 1)
		int op3 = 4;
		float op1 = op3;
		int op2 = 3;
		
		System.out.println( "4 / 3 = " + (op1/op2) );
		
		float f3 = op3 / op2;
		
		System.out.println("f3 = " + f3);
		
		
	}

}
