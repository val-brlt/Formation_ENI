public class Joueur {
    
    private String nom;
    private int score;
    private final int SCORE_INITIAL = 0;


    public Joueur(String nom) {
        this.nom = nom;
        this.score = SCORE_INITIAL;
    }

    public String getNom() {
        return nom;
    }
    public int getScore() {
        return score;
    }

    public void ajouterAuScore(int pValeurAjoutee) {
        this.score += pValeurAjoutee;
    }
}
