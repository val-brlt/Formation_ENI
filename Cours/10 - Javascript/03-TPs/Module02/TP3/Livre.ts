import {Oeuvre} from "./Oeuvre";

class Livre extends Oeuvre{
    constructor(annee: number = 0, titre: string = "titre") {
        super(annee, titre);
    }
}