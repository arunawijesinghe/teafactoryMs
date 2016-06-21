 function setPrice() {

                var tot = document.dedForm.tot_weight.value;
                var mr = document.dedForm.montrate.value;

                document.dedForm.price.value = tot * mr;


            }
            function setPrice1() {
                var tot = document.fertiForm.tot_f_weight.value;
                var mfr = document.fertiForm.mon_f_rate.value;

                document.fertiForm.fert_price.value = tot * mfr;


            }/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


