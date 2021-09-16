import {Vendable} from "./Vendable";

export class Acheteur implements Vendable {

    private nom : string;
    private  prenom : string;
    meilleurEnchere: number;

    constructor(nom: string = "nom", prenom: string = "prenom") {
        this.nom = nom;
        this.prenom = prenom;
    }
    encherir(nouvelleEnchere: number, acheteur: Acheteur): void {
    }
}