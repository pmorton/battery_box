default: battery_box_2.stl battery_box_3.stl battery_box_4.stl battery_box_5.stl battery_box_6.stl battery_box_7.stl battery_box_8.stl battery_box_9.stl battery_box_10.stl battery_box_11.stl battery_box_12.stl

battery_box_2.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=2" design.scad
battery_box_3.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=3" design.scad
battery_box_4.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=4" design.scad
battery_box_5.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=5" design.scad
battery_box_6.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=6" design.scad
battery_box_7.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=7" design.scad
battery_box_8.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=8" design.scad
battery_box_9.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=9" design.scad
battery_box_10.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=10" design.scad
battery_box_11.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=11" design.scad
battery_box_12.stl:
	/usr/local/bin/openscad -o $@ -D "pack_size=12" design.scad