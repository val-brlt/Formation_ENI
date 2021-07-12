import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class jeuLettre {

    public static final int nb_words = 22506; 

    public static void main(String[] args) throws Exception {
        char[] t = new char[50] ;

        try(FileInputStream f = new FileInputStream("dico.txt");) {
            t = tirerMotAleatoirement(f);
            // System.out.println (t);
            t = melanger(t);
            afficher(t);
            Scanner s_word_user = new Scanner(System.in);
            char[] t_user = s_word_user.nextLine().toUpperCase().toCharArray();

            while (!bonnesLettres(t,t_user)) {
                System.err.println("Veuillez rentrez un mot valide");
                afficher(t);
                t_user = s_word_user.nextLine().toUpperCase().toCharArray();
            }
    
            while (!dansLeDico(t_user )) {
                System.err.println("Ce mot n'existe pas !");
                afficher(t);
                t_user = s_word_user.nextLine().toUpperCase().toCharArray();;
            }
    
            System.out.println("\nBravo vous avez trouvé le mot caché : ");
            System.out.print (t_user);
            s_word_user.close();
            f.close();
        }
        catch (IOException e) {
            System.out.print("Lecture impossible");
        }
    }

    
    public static char[] tirerMotAleatoirement(FileInputStream f) {
        char[] t = new char[50];

        // get random line between 0 and max_line of dico.txt
        int r = new Random().nextInt(nb_words + 1);

        // get random line
        Scanner s = new Scanner(f);
        for(int i=0; i<=r; i++)
            s.nextLine();
        t = s.nextLine().toUpperCase().toCharArray();
        s.close();
        s = null;

        return t;
    }

    public static char[] melanger (char[] t) {
        char[] t_mel = new char[t.length];
        int j = 0;
        // init t_mel
        for (int i=0;i<=t.length-1;i++)
            t_mel[i] = '0';
        // melange
        while (j != t.length) {
            int r = new Random().nextInt(t.length);
            if (t_mel[r] == '0') {
                t_mel[r] = t[j];
                j++;
            }
        }
        return t_mel;
    }

    public static void afficher(char[] tab) {
        System.out.printf("--------------------------------------\n");
        System.out.printf("Trouve le mot caché = ");
        System.out.print(tab);
        System.out.printf("\n--------------------------------------\n");
    }

    public static boolean bonnesLettres(char[] t_tir, char[] t_user) {
        int n_occ_u = 0;
        int n_occ_t = 0;

        /* Verif si même taille */
        if (t_tir.length != t_user.length) 
            return false;

        for (char c : t_tir) {
        /* Verif si le caractère est + de n fois */
            // count n occurences in tab user
            for(int i=0;i<t_user.length;i++) {
                if (t_user[i] == c) 
                    n_occ_u++;
            }
            // count n occurences in tab tirage
            for(int i=0;i<t_tir.length;i++) {
                if (t_tir[i] == c) 
                    n_occ_t++;
            }
            // Verif même nb occurences
            if(n_occ_t != n_occ_u)
                return false;
        }
        return true;
    }

    public static boolean dansLeDico(char[] t) throws FileNotFoundException {
        FileInputStream fa = new FileInputStream("dico.txt");
        Scanner sa = new Scanner(fa);
        char[] t_word = new char[50];
        boolean isInDico = false;
        while(sa.hasNextLine() && !isInDico) {
            t_word = sa.nextLine().toUpperCase().toCharArray();
            if (!(Arrays.equals(t_word, t)))
               isInDico = false;
            else 
                isInDico = true;
        }
        sa.close();
        if (isInDico)
            return true;
        return false;
    }
}
