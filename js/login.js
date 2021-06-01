
const UserManager = require("../js/userManager.js"); // récup du fichier
var userManager = new UserManager
const electron = require('electron');
const { ipcRenderer } = electron;

function serializeForm(formId) {
    var formArray = $("form#" + formId).serializeArray();
    var returnArray = {};
    for (var i = 0; i < formArray.length; i++) {
        returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    return returnArray;
}

$("#send_form").click(function () {
    var form = serializeForm("loginForm");
    userManager.getNbByNamePasswword(form.username, form.pwd, function (nb) {
        if (nb >= 1) {

            ipcRenderer.send('security:login:allow', true);
            window.location.href = "index.html";
        }
        else {
            alert("Identifiants incorrects");

        }
    });
})
