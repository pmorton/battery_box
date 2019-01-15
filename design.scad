// Configurables
pack_size = 2;
 
// Constants
wall_thickness = 2;
inner_radius = 9.4;
support_height = 12;
track_width = 9;
dimple_stool = 1;
dimple_radius = 3;
buckle = 4;
gutter = 0.5;
double_gutter = gutter * 2;

// Calculations
outer_radius = 9.5 + (wall_thickness);
outer_diameter = outer_radius * 2;
inner_diameter = inner_radius * 2;
track_centering = (outer_diameter + wall_thickness - track_width)/2;
plate_height = wall_thickness * 2;
plate_size = (outer_diameter * pack_size);

module base_plate() {
  linear_extrude (height = plate_height) {
    difference() {
      square(size = [plate_size, outer_diameter]);
       for(i=[1:pack_size-1]) {
         translate([i*outer_diameter-buckle,0,0]) square(size = [buckle*2,buckle]);
         translate([i*outer_diameter-buckle,outer_diameter-buckle,0]) square(size = [buckle*2,buckle]);
      }
    }
  }
}

module exterior_wall() {
  for(i=[0:pack_size-1]) {
    xmove = (i*(outer_diameter)) -(i*0.01) +outer_radius;
    translate([xmove,outer_radius,0]) cylinder(r=outer_radius, h= support_height + wall_thickness, $fn=100);
  }
}

module wiring_slot() {
  translate([-1,track_centering+(track_width/2),wall_thickness*2-wall_thickness]) union() {
    length = ((outer_diameter)*(pack_size))-wall_thickness-5;
    centering = -track_width/2;
    
    difference() {
      rotate([0,-90,180]) cylinder(r=track_width/2,h=length);
      translate([-gutter,centering-gutter,centering]) linear_extrude (height = track_width/2) {
        square(size = [length + 2, track_width +2 ]);
      }
    }
  }
}

module battery_well() {
  for(i=[0:pack_size-1]) {
    xmove = (i*(outer_diameter)) +outer_radius;
    translate([xmove,outer_radius,wall_thickness]) cylinder(r=inner_radius, h= support_height +1,$fn=100);
  }
}

module battery_dimple() {
  for(i=[0:pack_size-1]) {
        xmove = (i*(outer_diameter)) +outer_radius;
        translate([xmove,outer_radius,0]) union() {
            stool = dimple_stool + wall_thickness;
            linear_extrude (height = stool) circle(r = dimple_radius, $fn=100);
            translate([0,0,stool])scale([dimple_radius,dimple_radius,2]) sphere(r = 1, $fn=100);
        }
    }
}

module nut_catch() {
  translate([-outer_diameter/2+gutter,0,0]) difference() { 
    linear_extrude(height = support_height + wall_thickness) square(size = [outer_diameter/2, outer_diameter]);

   // Nut Catch 
    translate([2,2,2]) linear_extrude(height = support_height + wall_thickness+gutter  ) square(size = [ outer_diameter/2 - wall_thickness*2, outer_diameter - (wall_thickness*2)]);
    
    // Screw Hole
    translate([gutter+3,outer_radius,(support_height+wall_thickness)/2 + 1]) rotate([0,-90]) cylinder(r=1.5, h = wall_thickness*4 + double_gutter , $fn=100);
    
    //Wiring Slot
    translate([wall_thickness ,track_centering*2,wall_thickness*2]) union() {
      
        translate([0,0,-0.001]) rotate([0,-90,180]) linear_extrude(height=outer_diameter + double_gutter)
          polygon(points=[[0,0],[track_width/2,track_width/2],[0,track_width]], paths=[[0,1,2]]);
      
       rotate([-180,0,0]) linear_extrude (height = wall_thickness) {
            square(size = [outer_diameter, track_width ]);
        }
    }
  } 
}

union() {
    difference() {
        union() {
            base_plate();
            exterior_wall();
        }

        wiring_slot();
        battery_well();
    }

    battery_dimple();
    nut_catch();
}



