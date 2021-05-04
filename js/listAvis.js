const Database = require("../database"); // récup du fichier

var cnx = new Database(); // instanciation 

cnx.getDB(); // obtention des identifiants de la bdd

// exécution d'une req et passage du résultat dans une fonction qu'on affiche dans la vue
cnx.execQuery("SELECT COUNT(commentaire) as 'NbCommentaire', nom, idVet, avis.id FROM avis INNER JOIN vetement ON vetement.id=avis.id GROUP BY idVet", [], function (result) {
    console.log(result);
    result.forEach(commentaire => {

        // affichage
        $("#listAvis tbody").append(
            '<tr>' +
                '<td>'+ commentaire.nom+'</td>' +
                '<td> ' + commentaire.NbCommentaire  + "</td>" +
                "<td value='" + commentaire.id +"'>" + '<a href="../vue/avisVet.html?idVet=' + commentaire.idVet + '"><button type="submit" onclick="voirAvis()">Voir</button></a>' +'</td>' +
            '</tr>');
    })

});




