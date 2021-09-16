import {Acheteur} from "./Acheteur";

export interface Vendable {
    meilleurEnchere : number;
    encherir(nouvelleEnchere : number, acheteur : Acheteur):void;
}