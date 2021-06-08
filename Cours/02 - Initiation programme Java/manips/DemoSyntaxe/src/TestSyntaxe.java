
public class TestSyntaxe {
	
	// variable "globale"
	static String langue = "Klingon";

	
	final float TVA_PAR_DEFAUT = -9000.0f;
	// Definition d'une "constante"
	final float TVA = 20.0f; // une "constante" plus constante serait déclarée comme ! static final float TVA = 20.f

	public static void main(String[] args) {
		
		final String ENI_ECOLE = "ENi Ecole";
		

		// déclaration d'une variable "locale" nommée "note" 
		// et dont le type est entier
		int note; // integer
		
		
		// une variable est locale au bloc dans lequel elle est définie 
		{
			float glycemie = 12;
			System.out.println(glycemie);
		}
		// Impossible : la portee de la variable est le bloc dans lequel elle est définie
//		System.out.println(glycemie);
		
		// la variable "langue" est utilisable partout
		//dans le bloc où elle est définie
		System.out.println(langue);
		
		// Déclarer une variable locale de type reférence String
		// dont on ne connait pas la valeur ( indiqué par le litéral null)
		String titreFilm = null;
		
		System.out.println("titreFilm : " + titreFilm);
		
		// Les 2seuls valeurs litterales d'un booléen : true / false
		boolean estAllumé = true;
		
	}

}
