class Database {

    constructor(cnx) {
        this.cnx = cnx;
    }

    setBdd() {
        var mysql = require('mysql');

        this.cnx = mysql.createConnection({
            host: "localhost",
            user: "root",
            password: null,
            database: "bhl_clothes"
        });

        // connect to mysql
        connection.connect(function (err) {
            // in case of error
            if (err) {
                console.log(err.code);
                console.log(err.fatal);
            }
        });

    }

    execBdd(query, tabValeur) {

        cnx.query($query, function (err, rows, fields) {
            if (err) {
                console.log("An error ocurred performing the query.");
                console.log(err);
                return;
            }

            callback(rows);

            console.log("Query succesfully executed");
        });
    }

}