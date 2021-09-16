
const lstSavoir = document.getElementById("lstSavoir");
let compSavoir = 0;

function addSavoir() {
    let savoir = document.getElementById("savoir");
    let author = document.getElementById("auteur");
    let date = document.getElementById("date");

    // Verif si les champs sont remplis
    try {
        if (savoir.value == null)
            throw new Error('Veuillez remplir le champ Savoir');
        if (author.value == null)
            throw new Error('Veuillez remplir le champ Auteur');
        if (date.valueAsDate == null)
            throw new Error('Veuillez remplir le champ Date');
    }catch(er) {
        alert(er.message);
        return;
    }


    // Création du texte du savoir + txt auteur+date
    let txtSavoir = savoir.value;
    let dateFormatted = getFormattedDate(date.valueAsDate)
    let txtAuthorDate = 'Par ' + author.value + ",le " + dateFormatted;
    // Création de l'élement div (container d'un savoir)
    let div = document.createElement('div');
    div.classList.add('cont_savoir');
    // Création de l'élement h2 (txt du savoir) + Création de l'élement p (auteur + date)
    let h2 = document.createElement('h2');
    let p = document.createElement('p');
    let btnRemove = document.createElement('button');
    btnRemove.setAttribute('onclick', 'removeSavoir(this)');
    // Affectation du txt à l'élement
    h2.innerText = txtSavoir;
    p.innerText = txtAuthorDate;
    btnRemove.innerText = '❌';
    // Affectation de l'élément à la div
    div.appendChild(h2);
    div.appendChild(p);
    div.appendChild(btnRemove);
    document.getElementById("lstSavoir").insertAdjacentElement("beforeend",div);
}

function removeSavoir(e) {
    let elementToRemove = e.parentNode;
    elementToRemove.remove();
}

function getFormattedDate(date) {
    let month = appendLeadingZeroes(date .getMonth() + 1);
    let day = appendLeadingZeroes(date .getDate());
    let year = date .getFullYear();
    return day + "/" + month + "/" + year;
}

function appendLeadingZeroes(n){
    if(n <= 9){
        return "0" + n;
    }
    return n
}

