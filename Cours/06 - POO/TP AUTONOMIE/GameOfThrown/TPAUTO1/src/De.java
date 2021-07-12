import java.util.Random;

public class De {
    
    private int nbFaces;
    private int faceTiree;
    private Random rand;
    private final int NB_FACES_PAR_DEFAUT = 6;

    public De() {
    }

    public De(int nbFaces) {
        this.nbFaces = nbFaces;
    }

    public int getNbFaces() {
        return nbFaces;
    }
    public int getFaceTiree() {
        return faceTiree;
    }

    public int lancer() {
        rand = new Random();
        faceTiree = rand.nextInt(NB_FACES_PAR_DEFAUT) + 1;
        return faceTiree;
    }

}
