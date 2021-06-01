const AvisManager = require("../js/avisManager.js"); // récup du fichier
var avisManager= new AvisManager

avisManager.list(function(result){
    result.forEach(vetement => {

        // affichage
        $("#listAvis tbody").append(
            '<tr>' +
                '<td>'+ vetement.nom+'</td>' +
                '<td> ' + vetement.NbCommentaire  + "</td>" +
                "<td value='" + vetement.id +"'>" + '<a href="../vue/avisVet.html?idVet=' + vetement.idVet + '"><button type="submit" onclick="voirAvis()">Voir</button></a>' +'</td>' +
            '</tr>');
    })

})