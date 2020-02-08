//Este codigo es como hacer un clip que se ajusta automaticamente a un acrilico de un espesor z, un largo x a una profunidad y.Generalmente usamos el espesor del acrilico mas 1mm (grosor papel). Ademas se puede prolongar hasta una determinado extra para mayor presion. Con paredes de espesor de 3.
//input
//Medidas acrilico
eAc = 3; //espesor del acrilico
aAc = 100; //ancho del acrilico
iAc = 25; //medidas del inserto de acrilico en el dispositivo.
//Medidas impresion 3D
gp3D = 3; // grosor de la pared impresa en 3D
c3D = 15; //cobertura del plastico que esta superpuesto al acrilico
re3D = 17.5; //radio externo del filtro
ri3D = 13.5; //radio interno del filtro
em3D = 2; //embutido del filtro en la pared 3D
//Medidas extensiones, son utiles para aumentar la superficie de contacto que alica presion sobre el extremo del acrilico.
pEx = 15; //protrusion de la extension desde el final del cuerpo mayor, cuando sale la extension. Suele ser similar al c3D.
aEx = 15; //ancho de la protusion del cuerpo mayor. Suele ser similar al c3D.
//Medidas papel
ePa = 1; //espesor del papel. Considerado para la presion que hara el clip sobre este. Suele ser consierado como 1mm.

//Medidas Source
lSo = 50; //largo de la fuente.
aSo = aAc; //ancho de la fuente. Modificable aunque suele ser del ancho del acrilico.
hSo = 67;

//output
//Medidas del clip
xPl = gp3D; // componente de la pared lateral en el eje x.
yPl = gp3D + c3D; // componente de la pared lateral en el eje y.
zPl = 2*eAc + 2*gp3D + ePa; // componente de la pared lateral en el eje z.
xPp = aAc + 2*gp3D; // componente de la pared posterior en el eje x.
yPp = gp3D; // componente de la pared posterior en el eje y.
zPp = zPl; // componente de la pared posterior en el eje z.
xPs = xPp; // componente de la pared superior en el eje x.
yPs = yPl; // componente de la pared superior en el eje y.
zPs = gp3D; // componente de la pared superior en el eje z.

//SOURCE
translate([0,yPl,0])
    cube([xPl,lSo,hSo]); //left
translate([((aAc/2)+(gp3D/2)-gp3D),yPl,0])
    cube([xPl,lSo,hSo]);//right
translate([0,lSo+yPl-gp3D,0])
    cube([((aAc/2)+(gp3D/2)),yPp,hSo]); //back  
translate([0,yPl,0])
    cube([((aAc/2)+(gp3D/2)),yPp,(hSo - (eAc*2 + ePa))]); //front   
translate([iAc+3,yPl,(hSo - (eAc*2 + ePa))])
    cube([((aAc/2)+(gp3D/2)-iAc-3),yPp,((eAc*2 + ePa))]); //front append
translate([0,yPl,0])
    cube([((aAc/2)+(gp3D/2)),lSo,gp3D]); //base