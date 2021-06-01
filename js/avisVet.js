const AvisManager = require("../js/avisManager.js"); // récup du fichier
var avisManager = new AvisManager





// récupérer l'id du vêtement
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
var idVet;

console.log(urlParams.get('idVet'))

if (urlParams.get('idVet') != null) {
    var idVet = urlParams.get('idVet');
}
else {
    var idVet = 1;
}


// exécution d'une req et passage du résultat dans une fonction qu'on affiche dans la vue
avisManager.getAvisByVetValide(1, idVet, function (result) {
    result.forEach(commentairePoste => {
        console.log(commentairePoste);
        // affichage
        $("#avisPoste tbody").append(
            '<tr>' +
            '<td>' + commentairePoste.commentaire + '</td>' +
            '<td>' + "<button type='button' data-id='" + commentairePoste.id + "' class='formSup btn btn-danger'>Supprimer</button>" + '</td>' +  // affiche aps img
            '</tr>');
    })
})
avisManager.getAvisByVetValide(0, idVet, function (result) {
    result.forEach(commentairePoste => {
        console.log(commentairePoste);
        // affichage
        $("#avisNonPoste tbody").append(
            '<tr>' +
            '<td>' + commentairePoste.commentaire + '</td>' +
            '<td>' + "<button type='button' data-id='" + commentairePoste.id + "' class='formSup btn btn-danger'>Supprimer</button> <button type='button' data-id='" + commentairePoste.id + "' class='formValide btn btn-success'>Valider</button>" + '</td>' +  // affiche aps img
            '</tr>');
    })
})

// Valider
$(document).on("click", ".formValide", function () {
    if (confirm("Voulez- vous vraiment le valider?")) {
        updateValide($(this).attr("data-id"))
        location.reload();
    }
})
function updateValide(idAvis) {
    avisManager.updateValide(idAvis, 1 , function (result) {
        alert("L'avis " + idAvis + " a bien été validé.")
    });
}




// Supprimer
$(document).on("click", ".formSup", function () {
    if (confirm("Voulez- vous vraiment le supprimer?")) {
        deleteAvis($(this).attr("data-id"))
        location.reload();
    }
})
function deleteAvis(idAvis) {
    avisManager.delete(idAvis, function (result) {
        alert("L'avis " + idAvis + " a bien été supprimé.")
    });
}















