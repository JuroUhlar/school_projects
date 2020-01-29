/*var x = ""

for(i=10; i<=40; i++) {
  x = x.concat("SUM(AX_CT_" + i +") as Vehicle_class_0" + i + ", \n" )
}

console.log(x) */


var y = ""

for(i=10; i<=40; i++) {
  y = y.concat("Vehicle_class_" + i + " as Class_" + i + "_count, f_values.AX_CT_" + i + " as Class_"+i+"_F_value, Vehicle_class_"+i+" * f_values.AX_CT_"+i+" as N130_class_"+i+", \n" )
}

console.log(y)