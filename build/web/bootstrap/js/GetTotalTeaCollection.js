function setNetWeight() {
                var tot = document.dailyCollection.total_weight.value;
                var ded = document.dailyCollection.deduct_weight.value;
                var net = tot - ded;
                document.dailyCollection.net_weight.value = net;


            }/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


