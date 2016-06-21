
        
            function generateId() {
                var custype;
                var custype = document.reg.cusType.value;
                if (custype === "Cultivator") {
                    custype1 = "CUL";
                } else {
                    custype1 = "COL";
                }
                var dayindex = document.reg.dayindex.value;
                if (dayindex < 10) {
                    dayindex = "0" + dayindex;
                }
                var d = new Date();
                var day = d.getUTCDate().toString();
                if (day < 10) {
                    day = "0" + day;
                }
                var month = d.getUTCMonth() + 1;
                if (month < 10) {
                    month = "0" + month;
                }
                var year = d.getUTCFullYear().toString();
                sysid = custype1 + year + month + day + dayindex;
                alert("System Id : " + sysid);

                document.reg.sysId.value = sysid;


            }
//-->
          