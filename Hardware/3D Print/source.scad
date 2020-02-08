    
//SOURCE
translate([0,yPl,0])
    cube([xPl,lSo,hSo]); //left
translate([((aAc/2)+(gp3D/2)-gp3D),yPl,0])
    cube([xPl,lSo,hSo]);//right
translate([0,lSo+yPl-gp3D,0])
    cube([((aAc/2)+(gp3D/2)),yPp,hSo]); //back  
translate([0,yPl,0])
    cube([((aAc/2)+(gp3D/2)),yPp,(hSo - (eAc*2 + ePa))]); //front   
translate([iAc,yPl,(hSo - (eAc*2 + ePa))])
    cube([((aAc/2)+(gp3D/2)-iAc),yPp,((eAc*2 + ePa))]); //front append
translate([0,yPl,0])
    cube([((aAc/2)+(gp3D/2)),lSo,gp3D]); //base
    