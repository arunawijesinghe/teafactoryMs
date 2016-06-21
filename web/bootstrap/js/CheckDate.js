 function checkDate1() {
                var selectd = document.dailyCollection.date.value;

                var d = new Date();
                var m = d.getUTCMonth() + 1;
                if (m < 10) {
                    m = "0" + m;
                }
                var day = d.getUTCDate();
                if (day < 10) {
                    day = "0" + day;
                }
                var yr = d.getUTCFullYear();
                var currentd = (m + "/" + day + "/" + yr);
                if (selectd === currentd) {
                    document.dailyCollection.date.value = selectd;
                    document.getElementById("alert1").innerHTML = '<div class="alert alert-success" style="width:90%" >\
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\
 valid Date Selected.\
</div>';
                } else {
                    document.getElementById("alert1").innerHTML = '<div class="alert alert-danger" style="width:50%" >\
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\
 Invalid Date Selected.\
</div>';
                }


            }
        /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


