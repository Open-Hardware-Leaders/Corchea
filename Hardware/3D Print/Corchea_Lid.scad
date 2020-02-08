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

//Paredes laterales vistas de frente.
cube([xPl,(yPl + lSo + gp3D),zPl]);
translate([(gp3D+aAc),0,0]) 
    cube([xPl,(yPl + lSo + gp3D),zPl]);
translate([((aAc/2)) - 0.5,c3D,0]) //0.5 es la mitad del 1 mm que dejaremos como libertad entre fuentes
    cube([xPl*2 + 1,(lSo + 2*gp3D),zPl]);

//Pared posterior
difference(){
    translate([0,(c3D),0]) 
cube([xPp,yPp,zPp]);
    translate([gp3D,(c3D),gp3D]) 
cube([iAc,(gp3D + 6),(eAc*2 + ePa)]);
    translate([xPs - (3 + iAc) ,(c3D),gp3D]) 
cube([iAc,(gp3D + 6),(eAc*2 + ePa)]);
 
}
translate([0,(lSo + c3D + gp3D),0]) 
    cube([xPp,yPp,zPp]);    
    
    
//Paredes superior e inferior vistas de frente.
cube([xPs,yPs,zPs]);
difference(){
    translate([0,0,(zPl-gp3D)]) 
cube([xPs,(yPs + lSo + gp3D),zPs]); 
    translate([27.5,45,0]) 
cylinder(r=ri3D,h=100, $fn=100, center= true);  
    translate([27.5,45,13]) 
cylinder(r=re3D,h=5, $fn=100, center= true);   
}  
//Extensiones
//Paredes laterales de las extenciones.
translate([0,-pEx,0]) //se traslada en y el valor negativo de su protrusion.
    cube([xPl,pEx,zPl]);
translate([(gp3D+aAc),-pEx,0]) // se traslada en x lo mismo que la pared lateral.
    cube([xPl,pEx,zPl]);

//Paredes superiores de las extenciones
translate([0,-pEx,0]) //se traslada en y el valor negativo de su protrusion.
    cube([(aEx + gp3D),pEx,gp3D]);
translate([0,-pEx,(zPl-gp3D)])
    cube([(aEx + gp3D),pEx,gp3D]);
translate([(aAc + gp3D - aEx),-pEx,0])
    cube([(aEx + gp3D),pEx,gp3D]);
translate([(aAc + gp3D - aEx),-pEx,(zPl-gp3D)])
    cube([(aEx + gp3D),pEx,gp3D]);

//testercube
color("blue")
cube([(3+50),30,30]);



