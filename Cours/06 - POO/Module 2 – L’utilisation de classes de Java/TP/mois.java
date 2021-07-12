import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Scanner;

public class mois {
    

    public static void afficherMois(int month, int year) {
        GregorianCalendar dateSpe = new GregorianCalendar(year, month - 1, 2);
        int nb_day_in_month = 1;
        int cursor = 0;

        // Get nb jours dans le mois
        while(dateSpe.get(GregorianCalendar.DAY_OF_MONTH) != 1) {
            dateSpe.add(GregorianCalendar.DAY_OF_MONTH, 1);
            nb_day_in_month++;
        }
        //reset 
        dateSpe.set(year, month - 1, 1);

        // GET FIRST DAY OF THE WEEK
        switch (dateSpe.getDisplayName(GregorianCalendar.DAY_OF_WEEK,GregorianCalendar.SHORT_FORMAT, Locale.FRANCE)) {
            case "lun." : cursor = 0;break;
            case "mar." : cursor = 3;break;
            case "mer." : cursor = 6;break;
            case "jeu." : cursor = 9;break;
            case "ven." : cursor = 12;break;
            case "sam." : cursor = 15;break;
            case "dim." : cursor = 18;break;
        }

        /* AFFICHAGE */
        // PRINT  * mois année *
        System.out.print(" * " + dateSpe.getDisplayName(GregorianCalendar.MONTH, GregorianCalendar.LONG_FORMAT, Locale.FRANCE) + " " + year + " *\nL  Ma Me J  V  S  D\n");


        // FIRST DAY
        for (int j=0; j<cursor;j++) {
            System.out.print(" ");
        }
        System.out.print(dateSpe.get(GregorianCalendar.DAY_OF_MONTH) + "  ");
        dateSpe.add(GregorianCalendar.DAY_OF_MONTH, 1);
        cursor += 3;
        cursor = verifCursor(cursor);

        // OTHERS DAYS
        for (int i=1; i<nb_day_in_month; i++) {
            int d = dateSpe.get(GregorianCalendar.DAY_OF_MONTH);
            if (String.valueOf(d).length() == 1){
                System.out.print(dateSpe.get(GregorianCalendar.DAY_OF_MONTH) + "  ");
            }
            else 
                System.out.print(dateSpe.get(GregorianCalendar.DAY_OF_MONTH) + " ");

            cursor += 3;
            cursor = verifCursor(cursor);
            dateSpe.add(GregorianCalendar.DAY_OF_MONTH, 1);
        }

    }
    
    public static int verifCursor(int cursor) {
        if (cursor >= 20) {
            System.out.println("");
            return 0;
        }
        return cursor;
    }
    
    public static void showMenu() {
        System.out.println("\n\n----------------------------------------------------");
        System.out.println("                 MENU CALENDRIER");
        System.out.println("1 - Consulter le mois précédent");
        System.out.println("2 - Consulter le mois suivant");
        System.out.println("3 - Consulter le mois et année de votre choix");
        System.out.println("4 - Quittez le programme");
        System.out.println("----------------------------------------------------");
    }
    
    public static void main(String[] args) throws Exception {
        GregorianCalendar dateTod = new GregorianCalendar();
        Scanner s = new Scanner(System.in);
        int rep_user = 0;
        int rep_month = 0;
        int rep_year = 0;
        boolean stop = false;
        System.out.println("\n----------------------------------------------------\n");
        afficherMois((dateTod.get(GregorianCalendar.MONTH) + 1), dateTod.get(GregorianCalendar.YEAR));

        while(stop != true) {
            showMenu();
            rep_user = s.nextInt();
            System.out.println("\n----------------------------------------------------\n");
            switch (rep_user) {
                case 1 : dateTod.add(GregorianCalendar.MONTH, -1);afficherMois((dateTod.get(GregorianCalendar.MONTH) + 1), dateTod.get(GregorianCalendar.YEAR));break;
                case 2 : dateTod.add(GregorianCalendar.MONTH, 1);afficherMois((dateTod.get(GregorianCalendar.MONTH) + 1), dateTod.get(GregorianCalendar.YEAR));break;
                case 3 : 
                do {
                    System.out.println("Veuillez choisir le mois souhaité (MM) :");
                    rep_month = s.nextInt();
                    if (rep_month <= 0 || rep_month >= 13)
                        System.out.println("Veuillez saisir un mois entre 1 et 12 !");
                } while (rep_month <= 0 || rep_month >= 13);
                System.out.println("Veuillez choisir l'année souhaité (YYYY) :");
                rep_year = s.nextInt();
                dateTod.set(rep_year, rep_month, 1);
                System.out.println("\n----------------------------------------------------\n");
                afficherMois(rep_month, rep_year);
                break;
                case 4 : stop = true;break;
                default : System.out.println("Veuillez choisir une option entre 1 et 4 !");
            }
        }
        s.close();

    }
}
