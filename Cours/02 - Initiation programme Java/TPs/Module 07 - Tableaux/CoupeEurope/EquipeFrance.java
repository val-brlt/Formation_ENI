import java.util.Arrays;

public class EquipeFrance {

	public static void showTab (String [] tab) {
		for (String  id :  tab) 
			System.out.println(id);
	}
	
	public static void main(String[] args) {

		String [] joueurs = {
			"Karim benzegras",
			"Antoine graisseman",
			"kylian mbouffé",
			"N'Golo kantine",
			"Paul pogba les oeufs",
			"Hugo Loriz",
			"Benjamin Bavoir",
			"Ousmane Aimelebayleys",
			"Olivier Girouspete",
			"Raphaël Varamener la coupe",
			};
		
		System.out.println(Arrays.toString(joueurs));
		showTab(joueurs);
		}
	}


