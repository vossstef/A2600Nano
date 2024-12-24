**Work in Progress!**

This site shows how to build and connect an Adapter or an Adapter cable to use a Playstation Dualshock 2 Controller,  
from now on named DS2, with the Spare Pin Header **J8** of the MiSTery Nano Midi Shield by Till Harbaum.  

![ds2_adaptercable](\.assets/ds2_adapter_cable.png)

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

Use an used DS2 Controller extension Cable and crimp or solder dupont connector
