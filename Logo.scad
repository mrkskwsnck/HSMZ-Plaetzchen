module Marke() {
    mirror([1, 0, 0])
        import(file = "Logo.dxf");
}

absoluteHeight = 23;
stepSize = 1;

difference() {
    union() {
        // Pyramide
        for (i = [0:stepSize:absoluteHeight]) {
            translate([0, 0, absoluteHeight - i])
                linear_extrude(height = stepSize)
                    offset(r = 0.4 + i / 10)
                        Marke();
        }

        // Sockel
        linear_extrude(height = 3)
            offset(r = 3)
                Marke();
    }
    
    // Innenkörper
    linear_extrude(height = absoluteHeight * 3, center = true)
        Marke();
}
