import {Oeuvre} from "./Oeuvre";

class Sculpture extends Oeuvre {
    private matiere : string;

    constructor(matiere: string = "matiere") {
        super();
        this.matiere = matiere;
    }
}