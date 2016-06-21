function setTcolid() {
                // var sysid = document.dailyCollection.sysid.value;
                var day = new Date();
                var d = day.getUTCDate();
                var m = day.getUTCMonth() + 1;
                var yr = day.getUTCFullYear().toString();
                var index = document.dailyCollection.index.value;
                if (index < 10) {
                    index = "0" + index;
                }
                if (m < 10) {
                    m = "0" + m;
                }
                if (d < 10) {
                    d = "0" + d;
                }

                var tcolid = "TCOL" + yr + m + d + index;

                document.dailyCollection.collection_id.value = tcolid;

            }



/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


