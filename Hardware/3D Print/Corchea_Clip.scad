//Este codigo es como hacer un clip que se ajusta automaticamente a un acrilico de un espesor z, un largo x a una profunidad y.Generalmente usamos el espesor del acrilico mas 1mm (grosor papel). Ademas se puede prolongar hasta una determinado extra para mayor presion. Con paredes de espesor de 3.
//input
//Medidas acrilico
eAc = 6; //espesor del acrilico
aAc = 151; //ancho del acrilico
//Medidas impresion 3D
gp3D = 3; // grosor de la pared impresa en 3D
c3D = 15; //cobertura del plastico que esta superpuesto al acrilico
//Medidas extensiones, son utiles para aumentar la superficie de contacto que alica presion sobre el extremo del acrilico.
pEx = 15; //protrusion de la extension desde el final del cuerpo mayor, cuando sale la extension. Suele ser similar al c3D.
aEx = 15; //ancho de la protusion del cuerpo mayor. Suele ser similar al c3D.
//Medidas papel
ePa = 1; //espesor del papel. Considerado para la presion que hara el clip sobre este. Suele ser consierado como 1mm.

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
cube([xPl,yPl,zPl]);
translate([(gp3D+aAc),0,0]) 
    cube([xPl,yPl,zPl]);

//Pared posterior
translate([0,(c3D),0]) 
    cube([xPp,yPp,zPp]);
    
//Paredes superior e inferior vistas de frente.
cube([xPs,yPs,zPs]);
translate([0,0,(zPl-gp3D)]) 
    cube([xPs,yPs,zPs]);  
  
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
//cube([30,16,30]);