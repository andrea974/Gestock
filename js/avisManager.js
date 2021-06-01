const Database = require("../database");

class AvisManager extends Database{
   
 
   // liste des vêtements avec leurs avis
    list(callback){
       super.getDB();
       super.execQuery("SELECT COUNT(commentaire) as 'NbCommentaire', nom, idVet, avis.id FROM avis INNER JOIN vetement ON vetement.id=avis.id GROUP BY idVet", [], function(result){
          callback(result);
       },  );
    }

   

   updateValide(id,valide){
      super.getDB();
      super.execQuery("UPDATE avis SET valide=? WHERE id=?", [valide, id]);
   }



    // procédure bdd
    rechercheAvisMot(mot, callback){
      super.getDB();
      super.execQuery("call recherche_avis_mot(?)", [mot], function(result){
         callback(result);
      },  );
   }
 
   // liste des avis pour un vêtement
    getAvisByVetValide(valide, id, callback){
       super.getDB();
       super.execQuery("SELECT avis.* , vetement.nom FROM avis INNER JOIN vetement ON vetement.id=avis.id WHERE avis.idVet=? AND valide=?", [id, valide], function(result){
          callback(result);
       });
    }
    
    delete(id){
       super.getDB();
       super.execQuery("DELETE FROM avis WHERE id = ?", [id]);
    }
 }
 
 module.exports = AvisManager