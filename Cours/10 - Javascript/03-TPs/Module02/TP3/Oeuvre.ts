import {Affichable} from "./Affichable";
import {Vendable} from "./Vendable";
import {Acheteur} from "./Acheteur";

export class Oeuvre implements Affichable,Vendable {
    private annee : number;
    private titre : string;
    meilleurEnchere: number;

    constructor(annee: number = 0, titre: string = "titre") {
        this.annee = annee;
        this.titre = titre;
    }

    afficher(): string {
        return "";
    }

    encherir(nouvelleEnchere: number, acheteur: Acheteur): void {
    }

}