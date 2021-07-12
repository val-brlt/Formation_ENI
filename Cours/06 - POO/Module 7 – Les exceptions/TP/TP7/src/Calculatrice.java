import java.util.Scanner;

public class Calculatrice {
    
    public static Scanner s = new Scanner(System.in);

    public static void main(String[] args){
        int x = 0;
        int y = 0;
        long xl = 0;
        long yl = 0;
        System.out.printf("Saisir un nombre entier :");
        boolean yes = false;
        while (!yes) {
            //x = s.nextInt();
           // y = s.nextInt();
            xl = x;
            yl = y;
            try {
                System.out.printf("Saisir un nombre entier : ");
                if (s.hasNextInt()) {
                    x = s.nextInt();
                    yes = true;
                }
                else {
                    throw new DepassementCapaciteException("La valeur saisie dépasse les capacités de cette calculatrice. ");
                }
             }
            catch(DepassementCapaciteException e) {
                System.out.println(e);
                s.nextLine();
            }
        }


        System.out.printf("\n FIN PROG\n");

    }
}


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
                    throw new DepassementCapaciteException("ERREUR DEPASSEMENT MA GUEULE");
             }
            catch(DepassementCapaciteException e) {
                System.out.println(e);
                s.nextLine();
            }

            */