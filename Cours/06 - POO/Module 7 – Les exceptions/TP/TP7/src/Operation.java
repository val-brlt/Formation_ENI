public class Operation {
    
    public static long x,y;
   
    public static int ajouter(int x, int y) throws DepassementCapaciteException {
        long rst_l = x + y;
        int rst = 0;
        if (rst_l < -2147483648 || rst_l > 2147483647)
            throw new DepassementCapaciteException("Erreur dépassement");
        return rst;
    }

    public static int soustraire(int x, int y) {
        return x - y;
    }

    public static int multiplier(int x, int y) {
        return x * y;
    }

}
