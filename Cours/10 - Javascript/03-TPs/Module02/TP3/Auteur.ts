import {Oeuvre} from "./Oeuvre";
import {Affichable} from "./Affichable";

export class Auteur implements Affichable {
    private nom : string;
    private prenom : string;
    private oeuvres  : Oeuvre[];

    constructor(nom: string = "nom", prenom: string = "prenom", oeuvres: Oeuvre[] = null) {
        this.nom = nom;
        this.prenom = prenom;
        this.oeuvres = oeuvres;
    }

    afficher(): string {
        return "";
    }
}