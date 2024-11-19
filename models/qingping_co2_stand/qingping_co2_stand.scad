include <../../rounded_box.scad>

base_width=85;
base_depth=35;
base_height=20;

back_cable_diameter=15;
side_cable_diameter=7.5;

wall_thickness=1.5;
top_thickness=1.5;

leg_dia=10;

cable_offset_from_front=0.4;

module qp_base(){
    rounded_box(
        part_selector=1,
        external_length=base_width,
        external_width=base_depth,
        base_height=base_height,
        wall_thickness=wall_thickness,
        bottom_thickness=top_thickness,
        external_corner_radius=leg_dia/2
    );
}
module qp_cable_hole(){
    translate([-122.25,-125.25,0]) // align source STL to have edges on XYZ axes
    translate([
        base_width/2 - 11.3/2, // X: center on base, center on plug center
        base_depth*cable_offset_from_front - 5.6/2, // Y: 30% from front, center on plug center
        -0
    ])
    import("../../usb c cover.stl"); //11.3 x 5.6 x 8 mm
}
module qp_side_holes(){
    translate([0,base_depth*cable_offset_from_front-side_cable_diameter/2,2*top_thickness])
    cube([base_width,side_cable_diameter,base_height]);
}
module qp_back_hole(){
    translate([base_width/2-back_cable_diameter/2,base_depth-wall_thickness,2*top_thickness])
    cube([back_cable_diameter,wall_thickness,base_height]);
}

module qp_leg(){
    translate([leg_dia/2,leg_dia/2,base_height/2])
    cylinder(base_height, leg_dia/2, leg_dia/2, center=true, $fn=360);
}
module qp_all_legs(){
    qp_leg();
    translate([base_width-leg_dia,0,0]) qp_leg();
    translate([base_width-leg_dia,base_depth-leg_dia,0]) qp_leg();
    translate([0,base_depth-leg_dia,0]) qp_leg();
}

module qp_stand_simple(){
    qp_all_legs();
    difference(){
        qp_base();
        qp_cable_hole();
        qp_side_holes();
        qp_back_hole();
    };
}

module qp_stand_angled(angle){
    difference(){
        qp_stand_simple();
        
        color("red")
        translate([base_width/2,base_depth/2,2*base_height-abs(base_depth*sin(angle))/2]) 
        rotate([(angle),0,0])
        cube(center=true,[1*base_width,2*base_depth,2*base_height]); 
    }
}

qp_stand_angled(-5);
