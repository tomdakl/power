const parse = require('date-format-parse')
const fs = require('fs');

var iFile = 2;

while (iFile < process.argv.length){
    // Read file
    fs.readFile( process.argv[iFile] , 'utf8', function f(err,data){
        var dataArray = data.split(/\r?\n/);
        var i=1;
        for(;i<dataArray.length;i++){
                var col = dataArray[i].split(",");
                var dts = col[0].replace("th","").replace("st","").replace("nd","").replace("rd","").replace ('"','')
                var dt  = parse.parse(dts ,"h:mmA DD MMMM YYYY");
                dts = parse.format(dt,"YYYY-MM-DD HH:mm:ss"); // Now formatted for SQL
                var kwh = col[1].substring(1).split(" ")[0];
                var cost = col[2].substring(2).replace('"','');
                console.log("insert ignore into power.genesis_raw(`DH`,`usage`,`dollars`) values ('"+dts+"',"+kwh+","+cost+") ON DUPLICATE KEY UPDATE `DH`=`DH`;");
                if(i == 1){
                    console.log("select '"+dts+"' AS '';")
                }
                 //console.log(dt + ": "+parse.parse(dt ,"h:mmA dd MMMM YYYY").parse.format("YYYY-MM-dd HH:mmT"));
            /// console.log(col[0],readTime.toString());
        }

    });
    iFile ++
}

