import java.util.Scanner;

public class Calculatrice {
    
	private static Scanner s = new Scanner(System.in);
	
	public static int getValue() {
		return 0;
	}
	
	public static char getOperator() {
		return s.nextLine().charAt(0);
	}
	
	public static void main(String[] args) {
	
		int result = 0;
		
		while (/* Tant que quelque chose ... */) {
			
			int value1 = getValue();
			char operator = getOperator();
			int value2 = getValue();
			try {
				switch (operator) {
					case '+':
						result = Operation.ajouter(value1, value2);
						break;
					case '-':
						result = Operation.soustraire(value1, value2);
						break;
					case 'x':
						result = Operation.multiplier(value1, value2);
						break;
					case '/':
						result = value1 / value2;
						break;
					case '%':
						result = value1 % value2;
						break;
					case 'q':
						/* Quelque chose */
						break;
					default:
						break;
				}
			} catch (Exception e) {
				System.err.printf("%s\n", e.getMessage());
			}
		}
		if (s != null)
			s.close();
	}

}


/*        while (!yes) {
            //x = s.nextInt();
           // y = s.nextInt();
            xl = x;
            yl = y;
            try {
                long t = xl/yl;
                if (yl == 0) 
                    throw new DivByZero("La division par zéro n'est pas définie !");

             }
            catch(DivByZero e) {
                //System.out.println(e);
                //s.nextLine();
            }
        }*/

/* Le résultat dépasse la capacité de la calulatrice 
        while (!yes) {
            x = s.nextInt();
            y = s.nextInt();
            long xl = x;
            long yl = y;
            try {
                if (y * x != xl * yl)
                    throw new DepassementCapaciteException("ERREUR DEPASSEMENT MA GUEULE");
                else 
                    yes = true;

             }
            catch(DepassementCapaciteException e) {
                System.out.println(e);
                //e.printStackTrace();
                //System.exit(1);
            }
        }
    */


    /*  Saisie incorrecte. Réessayez...

            try {
                System.out.printf("Saisir un nombre entier : ");
                if (s.hasNextInt()) {
                    x = s.nextInt();
                    yes = true;
                }
                else 
                    throw new DepassementCapaciteException("");
             }
            catch(DepassementCapaciteException e) {
                System.out.println(e);
                s.nextLine();
            }

            */