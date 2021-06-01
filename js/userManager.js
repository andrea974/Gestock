const Database = require("../database");

class UserManager extends Database{

    getNbByNamePasswword(username, pwd, callback){
       super.getDB();
     
       super.execQuery("SELECT COUNT(id) 'nbUser' FROM user WHERE name=? AND pwd =?", [username, pwd], function(result){
  
          callback(result[0]["nbUser"]);
       });
    }
 }
 
 module.exports = UserManager