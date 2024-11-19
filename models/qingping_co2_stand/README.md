# Stand for Qingping CO2 & Temp & RH Monitor

Allows placement of Qingping CO2 monitor on flat surface with plugged in USB-C cable.

[printables.com/model/1074032-stand-for-qingping-co2-temp-rh-monitor](https://www.printables.com/model/1074032-stand-for-qingping-co2-temp-rh-monitor)

## Description

[Qingping CO2 & Temp & RH Monitor](https://www.qingping.co/co2-temp-rh-monitor/overview) is designed to be hanged on the wall with a provided hook. It's possible to place it on a flat surface out of the box, but then you don't have access to the USB-C port for charging and the screen may get unreadable if the device is below line of sight.

This stand is designed to be used with angled USB-C cables or straight ones with any generic angled adapter. It provides holes for routing cable to the left, right, or back of the stand. Moreover, there are legs added so you can stick adhesive rubber feet to stabilize the device. Designed to be printed upside-down without supports.

Printed with Hyper PLA-CF on Creality K1C at 0.16mm layers, but other materials should be fine as well. The rubber feet used are generic no-name with 10mm diameter and flat bottom (rounded one may cause the device to tip-over on higher angles). Tested USB-C adapters and cables are shown in photos.

Based on https://www.printables.com/model/188819-customizable-rounded-box and https://www.printables.com/model/853352-usb-c-cover

Source code and more context available at [github.com/danielskowronski/3d-usbc-vertical-stand](https://github.com/danielskowronski/3d-usbc-vertical-stand)

## How it's built

- all sizes in millimetres
- [Qingping CO2 & Temp & RH Monitor](https://www.qingping.co/co2-temp-rh-monitor/overview):
  - base is 77x28mm
  - USB-C port is on the bottom:
    - in X-axis (77mm) it's centred
    - in Y-axis (depth) it's skewed towards front: 70% instead of 50%
  - display is best read at an angle
- stand is a reversed base (main body) of a parametric box (bottom of the box is top of the stand)
  - width (X) and depth (Y) are controlled with `base_width` and `base_depth`; values set arbitrarily to approx +10mm size of the device
  - height is controlled with `base_height` and 20mm should be enough for cable; NOTE: this is max height of stand after angled cutting
  - top thickness is controlled with `top_thickness` and must be thin enough to ensure secure connection; 1.5mm seems fine
  - wall thickness is `wall_thickness`; set to be the same as `top_thickness` for ease of use
- legs are cylinders added to edges of base sand body, diameter set via `leg_dia`
- hole for USB-C cable is based on the USB-C cap, not just metal connector; otherwise plastic rim would not fit; offset from front is controlled with `cable_offset_from_front` as a percentage of depth (0.5 would mean centre)
- holes for cables:
  - all have minimal wall above them, i.e. height of the hole is nearly full height of the base; this is to save on material and avoid strain on cable as it's anyway completely flush with the top of the stand
  - side ones are aligned with the top USB-C hole and are wide enough for strain relief of typical cable; controlled with `side_cable_diameter`
  - back one is centred and is wide enough for the entire USB-C plug; this is much wider than the side holes as the depth of the stand is very short, and the adapter doesn't fit entirely inside; controlled with `back_cable_diameter`
- angle in degrees is set as parameter of `qp_stand_angled(angle)`:
  - 0 means no angle = no cutting
  - negative value makes the front of the device higher, suitable for looking at the device from top
  - positive value makes the front of the device lower, suitable for looking at the device from bottom
