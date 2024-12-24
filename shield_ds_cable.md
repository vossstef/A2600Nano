**Work in Progress!**

This site shows how to build and connect an Adapter or an Adapter cable with the Spare Pin Header **J8**  
of the [MiSTery Nano Midi Shield by Till Harbaum](https://github.com/harbaum/MiSTeryNano/blob/main/board/misteryshield20k/README.md) to use a Playstation Dualshock 2 (DS2) Controller.



## Pinout
The Pinout of the Playstation Pad Connector:  
![ds2_pinmap](\.assets/ps_pad_connector.png)
  
The Pinout of the Spare Pin Header J8 on the Nano Shield:
![ds2_pinmap](\.assets/pcb_m0s_j8_pinout.png)

## Connection Table

|DS2 Connector Pin|DS2 Signal Name|DS2 Function|MiSTery Shield J8 Pin|
|:---:|:---:|:---:|:---:|
|1|DAT|Pad data|3|
|2|CMD|Pad Command|2|
|3|7.6v|Rumble Voltage|nc|
|4|GND|Ground|6|
|5|VCC|3.3v|7|
|6|ATN|Attention|4|
|7|CLK|Clock|1|
|8|IRQ|not in use|nc|
|9|ACK|Acknowledge|nc|

nc = not connected

## Building your own Adapter
Use the female end of an used DS2 Controller extension cable and cut it 25-30 centimeters behind the connector.  
Remove **careful** the main isolation and **more careful** the isolation of the cables.  
Be **very careful** not to break/cut the thin wires.  

Here https://store.curiousinventor.com/guides/PS2/ you can see a variant of the cable colors from an opened DS2 Controller cable.  
**Be careful, you colours can be different.** Use a Multimeter for measure or beep the correct cable.  

Crimp or solder some female dupont terminals to the cables.  
Use the above connection table for correct orientation of the terminals within the cable housing.  

Double check your Adapter cable to make sure the voltage pins are at the correct position.

Your adapter could end up looking like this:  
![ds2_adaptercable](\.assets/ds2_adapter_cable.png)

If your Adapter cable is finished make sure you connect it in the correct orientation.  
See the above Board Layout for the correct position of J8-Pin1 which should match Pin1 of your cable.
Activate the DS2 Controller using **DS2 #2 Joy** in the Menu and test it.  

## DS2 Buttons
Circle should be Trigger Button #1
Square should be Trigger Button #2
Traingle and Cross activate the "Paddle Mode"

## PCB based Adapter
An adapter PCB board is currently being planned and will be released once the parts have arrived and been tested.
