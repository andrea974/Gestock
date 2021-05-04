const Database = require("../database"); // récup du fichier

var cnx = new Database(); // instanciation 

cnx.getDB(); // obtention des identifiants de la bdd


// récupérer l'id du vêtement
const queryString= window.location.search;
const urlParams= new URLSearchParams(queryString);
var idVet;

if (urlParams.get('idVet') != null) {
    var idVet= urlParams.get('idVet');
}
else{
    var idVet= 1;
}


// exécution d'une req et passage du résultat dans une fonction qu'on affiche dans la vue
cnx.execQuery("SELECT avis.* , vetement.nom FROM avis INNER JOIN vetement ON vetement.id=avis.id WHERE avis.idVet=?", [idVet], function (result) {
    
    result.forEach(commentairePoste => {
    console.log(commentairePoste);    
        // affichage
        $("#avisPoste tbody").append(
            '<tr>' +
                '<td>' + commentairePoste.commentaire + '</td>' +
                '<td>' + "<img src='../public/image/bin.png' alt='Supprimer'>" + '</td>' +  // affiche aps img
            '</tr>');
    })

});

// $(document).ready(function () {
//     $('#avisPoste').DataTable();
// });




















// action du bouton
function supprimer() {
    // exécution d'une req et passage du résultat dans une fonction qu'on affiche dans la vue
    cnx.execQuery("DELETE FROM avis WHERE ...", [], function (result) {
        

    });
}