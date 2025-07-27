# A2600Nano

The A2600Nano is a port of the [MiSTer](https://github.com/MiSTer-devel/Atari2600_MiSTer) FPGA core components of the [Atari 2600 VCS](https://en.wikipedia.org/wiki/Atari_2600) with enhancements from the A7800 core such as cartridge type autodetect and the video stabilizer for the:<br>

| Board      | FPGA       | support |Note|
| ---        |        -   | -     |-|
| [Tang Nano 9k](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-9K/Nano-9K.html)       | [GW1NR](https://www.gowinsemi.com/en/product/detail/38/)  |HDMI / LCD|micro SD card [HW modification](TANG_NANO_9K.md#hw-modification) needed|
| [Tang Nano 20k](https://wiki.sipeed.com/nano20k)     | [GW2AR](https://www.gowinsemi.com/en/product/detail/38/)  |HDMI / LCD  |twin Dualshock<br> MiSTeryShield20k spare header + Joy to DIP |
| [Tang Primer 20K Dock ext Board](https://wiki.sipeed.com/hardware/en/tang/tang-primer-20k/primer-20k.html)| [GW2A](https://www.gowinsemi.com/en/product/detail/46/)| HDMI / LCD|twin Dualshock |
| [Tang Primer 25K](https://wiki.sipeed.com/hardware/en/tang/tang-primer-25k/primer-25k.html) | [GW5A-25](https://www.gowinsemi.com/en/product/detail/60/)  | HDMI |no Dualshock, no retro D9 Joystick |
| [Tang Mega 60k NEO](https://wiki.sipeed.com/hardware/en/tang/tang-mega-60k/mega-60k.html)|[GW5AT-60](https://www.gowinsemi.com/en/product/detail/60/)| HDMI / LCD|twin Dualshock |
| [Tang Mega 138k Pro](https://wiki.sipeed.com/hardware/en/tang/tang-mega-138k/mega-138k-pro.html)|[GW5AST-138](https://www.gowinsemi.com/en/product/detail/60/) | HDMI / LCD |twin Dualshock |
| [Tang Console 60K NEO](https://wiki.sipeed.com/hardware/en/tang/tang-console/mega-console.html)|[GW5AT-60](https://www.gowinsemi.com/en/product/detail/60/) | HDMI / LCD |twin Dualshock, no Retro D9 Joystick|
| [Tang Console 138K NEO](https://wiki.sipeed.com/hardware/en/tang/tang-console/mega-console.html)|[GW5AST-138](https://www.gowinsemi.com/en/product/detail/60/)|HDMI / LCD |twin Dualshock, no Retro D9 Joystick|

This project relies on an external µC being connected to the Tang Nano 20K. You can use a [M0S Dock BL616](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html), [Raspberry Pi Pico (W)](https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html) or [esp32-s2](https://www.espressif.com/en/products/socs/esp32-s2)/[s3](https://www.espressif.com/en/products/socs/esp32-s3) and use the [FPGA companion firmware](http://github.com/harbaum/FPGA-Companion). Basically a µC acts as USB host for USB devices and as an OSD controller using a [SPI communication protocol](https://github.com/harbaum/MiSTeryNano/blob/main/SPI.md).

Onboard BL616 µC  
* A dedicated FPGA bitstream and FPGA companion firmware is needed in that configuration. The onboard BL616 µC is presently supported for TN20K and Console 60K/138k boards. There is an extern powered (see ->) [USB Hub](https://github.com/harbaum/FPGA-Companion/blob/main/console_usbhub_and_power_over_usb-a.png) + USB-A to USB-A cable + USB-A Power Supply Plug needed to supply the board and at the same time provide USB ports for USB Keyboard and e.g. USB Joystick or Mouse.

For the [M0S Dock (BL616 µC)](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) there is a:

* [Custom carrier board MiSTeryShield20k](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k/README.md)
* [Dualshock Adapter / Cable](https://github.com/vossstef/tang_nano_20k_c64/tree/main/board/misteryshield20k_ds2_adapter/misteryshield20k_ds2_adapter_cable.md)
* [M0S PMOD Adapter](https://github.com/harbaum/MiSTeryNano/blob/main/board/m0s_pmod) for Primer / Mega / Console Boards
* [Case](https://github.com/harbaum/MiSTeryNano/blob/main/board/misteryshield20k/housing3D)

and for the Raspberry PiPico (RP2040 µC) there is a:

* [Custom carrier board MiSTeryShield20k Raspberry PiPico](https://github.com/vossstef/tang_nano_20k_c64/tree/main/board/misteryshield20k_rpipico/README.md)
* [Dualshock Adapter / Cable](https://github.com/vossstef/tang_nano_20k_c64/tree/main/board/misteryshield20k_ds2_adapter/misteryshield20k_ds2_adapter_cable.md)
* [Custom PMOD RP2040-Zero](https://github.com/vossstef/tang_nano_20k_c64/tree/main/board/pizero_pmod/README.md) for Primer / Mega / Console Boards
* case (upcoming)  

Original A2600 core by [Retromaster](https://retromaster.wordpress.com/a2601/)  
All HID, SDcard and µC firmware by [Till Harbaum](http://www.harbaum.org/till/mist)<br>

Features:

* PAL 768x576p or NTSC 768x480p HDMI Video and Audio Output
* TFT-LCD module 800x600 [SH500Q01Z](https://dl.sipeed.com/Accessories/LCD/500Q01Z-00%20spec.pdf) + Speaker support
* Scanline length auto adjust
* Cartridge type autodetect
* NTSC / PAL region autodetct
* Superchip autodetct
* [USB Keyboard](https://en.wikipedia.org/wiki/Computer_keyboard) USB Keyboard
* [USB Joystick](https://en.wikipedia.org/wiki/Joystick)
* [USB Gamepad](https://en.wikipedia.org/wiki/Gamepad) Stick as paddle emulation
* [USB XBOX 360 Controller](https://en.wikipedia.org/wiki/Xbox_360_controller) as Joystick or Paddle
* [USB Mouse](https://en.wikipedia.org/wiki/Computer_mouse) as paddle emulation
* supports 2nd Trigger Button for modified Games
* [legacy D9 Joystick](https://en.wikipedia.org/wiki/Atari_CX40_joystick) (Atari / Commodore digital type)
* Joystick emulation on Keyboard [Numpad](https://en.wikipedia.org/wiki/Numeric_keypad)
* [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) for [MiSTeryShield20k](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k/README.md) via spare [pinheader](/board/misteryshield20k_ds2_adapter/misteryshield20k_ds2_adapter_cable.md)
* [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) Keys & Stick as Joystick
* [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) Sticks as paddle emulation (analog mode)
* Cartridge ROM loader. [Boot default is homebrew 'Hunchy' Chris Walton](https://videogamehomebrew.fandom.com/wiki/Chris_Walton)  

<img src="./.assets/a2600nano.png" alt="image" width="80%" height="auto">

## A2600Nano on Tang Nano 9K

See [Tang Nano 9K](TANG_NANO_9K.md)

## A2600Nano on Tang Primer 20K (Dock ext board)

See [Tang Primer 20K](TANG_PRIMER_20K.md)

## A2600Nano on Tang Primer 25K

See [Tang Primer 25K](TANG_PRIMER_25K.md)

## A2600Nano on Tang Mega 60k NEO

See [Tang Mega 60K NEO](TANG_MEGA_60K.md)

## A2600Nano on Tang Mega 138k Pro

See [Tang Mega 138K Pro](TANG_MEGA_138Kpro.md)

## A2600Nano on Tang Console 60k / 138K NEO

See [Tang Console 60K / 138K NEO](TANG_CONSOLE_60K.md)

## A2600Nano with LCD and Speaker

See [Tang Nano LCD](TANG_LCD.md)

## Installation

The installation of A2600Nano on the Tang Nano 20k board can be done using a Linux PC or a Windows PC
[Instruction](INSTALLATION_WINDOWS.md).  

## Cartridge ROM Loader

ROM can be loaded via OSD file selection.  

### Supported mappers

* Auto detected  (F8 F6 FE E0 3F F4 P2 FA CV 2K UA E7 F0 32)  
  
LED 1 to 5 are activated as hint in case an unsupported game (mapper) detected  

### single / dual Button Joystick

* Button ```Trigger```
* 2nd Button ```Trigger 2```

### Gamepad

* Gamepad Button ```Trigger A (DS2 circle)``` 1st Trigger Button

* Gamepad Button ```Trigger B (DS2 cross)``` 2nd Trigger Button

* Gamepad Button ```Trigger X (DS2 triangle)``` 1st Paddle Trigger and enable

* Gamepad Button ```Trigger Y (DS2 square)``` 2nd Paddle Trigger and enable

* Gamepad Button ```START``` as core function **START**

* Gamepad Button ```SELECT``` as core function **SELECT**

> [!NOTE]
> Gamepad button keymap optimized for legacy USB Logitech RumblePad 2 or Dual Action. Keymap might differ for other Gamepads.

### Paddle

* DualShock 2 (left Stick), USB Gamepad or USB Mouse.  

1st Paddle 1st Gamepad use ```Trigger X (DS2 #1 triangle)``` or ```left Mouse Button```

2nd Paddle 1st Gamepad use ```Trigger Y (DS2 #1 square)``` or ```right Mouse Button```

3rd Paddle 2nd Gamepad use ```Trigger X (DS2 #2 triangle)```

4th Paddle 2nd Gamepad use ```Trigger Y (DS2 #2 square)```

### Keyboard

* Key **F1** toggle ```SELECT```
* Key **F2** toggle ```START / RESET```
* Key **F3** toggle ```B/W```
* Key **F4** toggle ```Difficulty Left```
* Key **F5** toggle ```Difficulty Right```
* Key **F6** toggle ```PAUSE``` (Note: Video is blank or disturbed)
* Key **F12** OSD

| Numpad     |         |Numpad|
| -          |-        |-         |
|0  Trigger|8  Up  |.  Trigger 2|
|4  Left   |-        |6  Right|
|-           |2  Down|-         |

## Push Button utilization

* S1 reserved
* S2 open OSD

## OSD

invoke by F12 keypress

* Reset
* Cold Reset
* Audio Volume + / -
* Scanlines effect %
* Region switch Auto/NTSC/PAL
* HID device selection for Joystick Port
* Loader file selection
* Difficulty A, B Core switch
* Black & White Core video switch
* Joystick port swap
* Invert Paddle
* De-comb
* SuperChip Auto/off/on

## Gamecontrol support

A 2nd Trigger Button (B) is supported for modified Games.

![controller](\.assets/controller-layout.png)  

legacy single D9 Digital Joystick. OSD: **Retro D9**  
or  
USB Joystick(s) or Gamepad(s). OSD: **USB #1 Joy** or **USB #2 Joy**  
Also [RII Mini Keyboard i8](http://www.riitek.com/product/220.html) left Multimedia Keys are active if **USB #1 Joy** selected.  
```Button A and B``` Buttons as Trigger:  

or  
Dualshock 2 Gamepad Stick or Dpad as Joystick. OSD: **DS #1 Joy** or **DS #2 Joy**<br>
At the moment Dpad only for original Pad. Some clone devices support at the same time Dpad and left stick simultaniously.
<br>```circle and cross``` Buttons as Trigger:<br>

> [!IMPORTANT]
> In a [MiSTeryShield20k](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k) configuration Dualshock is supported via the internal ``spare J8`` pinheader. <br>
> See [MiSTeryShield20k DS2 Adapter / Cable](/board/misteryshield20k_ds2_adapter/misteryshield20k_ds2_adapter_cable.md) for further information. Thx [venice1200](https://github.com/venice1200) !<br>

> [!NOTE]
> TN20k: You have to select OSD "DS2 **#2** Joy" for a ``MiSTeryShield20k`` configuration.<br>
> TN20k: You have to select OSD "DS2 **#1** Joy" if you use the ``Sipeed Joy to DIP`` adapter.<br>
Both DS interface ports can be active at the same time meaning twin Dualshock support if the MiSTeryShield20k MIDI interface is not populated (Resistor R9 and IC U3 removed).  

or  
Keyboard Numpad. OSD: **Numpad**  

or  
Mouse. OSD: **Mouse**  
```left Mouse Button``` and ```right Mouse Button``` as Trigger for Paddle 1 or 2.  

or  
USB Gamepad as Paddle. OSD: **USB #1 Padd** or **USB #2 Padd**  
 ```Trigger X``` and ```Trigger Y``` 

or  
Dualshock2 Gamepad left stick as Paddle. OSD: **DS #1 Paddle** or **DS #2 Paddle**  

 ```Trigger triangle``` and ```Trigger square```

## LED UI

| LED | function         |TN9K|TN20K|TP20K   |TP25K  |TM60K   |TM138k|Console60k|
| --- |        -         |-   |-     |-      | -     | -      | -   |-|
| 0   |Cartridge selected|x   |x     |x      | x     | x      | x   |-|
| 1   | Game unsupported |x   |x     |x      | x     | x      | x   |x|
| 2   | Game unsupported |x   |x     |x      |  -    | -      | x   |-|
| 3   | Game unsupported |x   |x     |x      |  -    | -      | x   |-|
| 4   | Game unsupported |x   |x     |x      |  -    | -      | x   |-|
| 5   | Game unsupported |x   |x     |x      |  -    | -      | x   |-|

LED 1..5 are activated as hint in case an unsupported game (mapper) detected<br>

**Multicolor RGB LED**

* **<font color="green">green</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;all fine and ready to go<br>
* **<font color="red">red</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;something wrong with SDcard / default boot image<br>
* **<font color="blue">blue</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;µC firmware detected valid FPGA core<br>
* **<font color="yellow">yellow</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;FPGA core can't detect valid firmware<br>
* **white**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;-<br>

## Powering

Prototype circuit with Keyboard can be powered by Tang USB-C connector from PC or a Power Supply Adapter.

## Synthesis

Source code can be synthesized, fitted and programmed with GOWIN IDE Windows or Linux.  
Alternatively use the command line build script **gw_sh.exe** build_tn20k.tcl  

## HW circuit considerations

**Pinmap TN20k Interfaces**  

 Sipeed M0S Dock, digital Joystick D9 and DualShock Gamepad connection.  
![wiring](\.assets/wiring_spi.png)

**Pinmap D-SUB 9 Joystick Interface**  

Joystick interface is 3.3V tolerant. Joystick 5V supply pin has to be left floating !  
![pinmap](\.assets/vic20-Joystick.png)

| Joystick pin|IO    | Tang Nano pin | FPGA pin | Joystick Function |
| ----------- |----- | ---           | -------- | -----             |
| 1           |     2| J6 10         | 25       | UP        |
| 2 |1| J6 9  | 28   | DOWN             |
| 3 |4| J6 12 | 29   | LEFT |
| 4 |3| J5 11 | 26   | RIGHT |
| 5 |-| -     | -    | POT Y |
| 6 |0| J5 8  | 27   | TRIGGER|
| 7 |-| n.c   | n.c  | 5V |
| 8 |-| J5 20 | -    | GND |
| 9 |-| - | - | POT X|

**Pinmap Dualshock 2 Controller Interface**  

<img src="./.assets/controller-pinout.jpg" alt="image" width="30%" height="auto">

| DS pin | Tang Nano pin | FPGA pin | DS Function |
| ----------- | ---   | --------  | ----- |
| 1 | J5 18 | 71 MISO | JOYDAT  |
| 2 | J5 19 | 53 MOSI  | JOYCMD |
| 3 | n.c. | - | 7V5 |
| 4 | J5 15 | - | GND |
| 5 | J5 16| - | 3V3 |
| 6 | J5 17 | 72 CS | JOYATN|
| 7 | J5 20 | 52 MCLK | JOYCLK |
| 8 | n.c. | - | JOYIRQ |
| 9 | n.c. | - | JOYACK |

## Getting started

In order to use this Design the following things are needed:

[Sipeed M0S Dock](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) or Raspberry Pi Pico RP2040 or ESP32-S2/S3<br>
[Tang Nano 20k](https://wiki.sipeed.com/nano20k) <br>
or [Tang Primer 20K with Dock ext Board](https://wiki.sipeed.com/hardware/en/tang/tang-primer-20k/primer-20k.html)<br>
and [M0S PMOD adapter](https://github.com/harbaum/MiSTeryNano/tree/main/board/m0s_pmod/README.md).<br>
and [PMOD DS2x2](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#PMOD_DS2x2)<br>
or [Tang Nano 9k](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-9K/Nano-9K.html)<br>
or [Tang Primer 25k](https://wiki.sipeed.com/hardware/en/tang/tang-primer-25k/primer-25k.html)<br>
and [PMOD DVI](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#PMOD_DVI)<br>
and [PMOD TF-CARD V2](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#PMOD_TF-CARD)<br>
and [PMOD SDRAM](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#TANG_SDRAM)<br>
and [M0S PMOD adapter](https://github.com/harbaum/MiSTeryNano/tree/main/board/m0s_pmod/README.md)
 or ad hoc wiring + soldering.<br>
or [Tang Mega 60K NEO](https://wiki.sipeed.com/hardware/en/tang/tang-mega-60k/mega-60k.html)<br>
and [PMOD DS2x2](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#PMOD_DS2x2)<br>
and [M0S PMOD adapter](https://github.com/harbaum/MiSTeryNano/tree/main/board/m0s_pmod/README.md)<br>
or [Tang Mega 138k Pro](https://wiki.sipeed.com/hardware/en/tang/tang-mega-138k/mega-138k-pro.html)<br>
and [PMOD DS2x2](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#PMOD_DS2x2)<br>
and [M0S PMOD adapter](https://github.com/harbaum/MiSTeryNano/tree/main/board/m0s_pmod/README.md)<br>
microSD or microSDHC card FAT/exFAT formatted
TFT Monitor with HDMI Input and Speaker
  
| HID and Gamecontrol Hardware option | TN20k needs | alternative option |Primer 25K|Mega 60K|Mega 138K Pro|
| -----------                         | ---         | ---                | ---      | -      | -       |
| USB Keyboard | [USB-C to USB-A adapter](https://www.aliexpress.us/item/3256805563910755.html) | [4 port mini USB hub HS8836A](https://a.aliexpress.com/_EIidgjH)  |x|x|x|
| [USB Joystick(s)](https://www.speedlink.com/en/COMPETITION-PRO-EXTRA-USB-Joystick-black-red/SL-650212-BKRD)| [4 port mini USB hub HS8836A](https://a.aliexpress.com/_EIidgjH) | - |x|x|x|
| USB Mouse   | [4 port mini USB hub HS8836A](https://a.aliexpress.com/_EIidgjH)  | -  |x|x|x|
| USB Gamepad |[4 port mini USB hub HS8836A](https://a.aliexpress.com/_EIidgjH)  | -  |x|x|x|
| Commodore/[Atari](https://en.wikipedia.org/wiki/Atari_CX40_joystick) compatible retro D9 Joystick| [MiSTeryNano shield](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k/README.md)|D-SUB 9 M connector, breadboard to wire everything up, some jumper wires|-|adhoc SDRAM1 Joy D9|adhoc PMOD Joy D9|
| [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) | Gamepad Adapter Board (Sipeed Joystick to DIP) respectively<br> PMOD DS2x2 | breadboard to wire everything up and some jumper wires |-|PMOD DS2x2|PMOD DS2x2|

