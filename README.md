# A2600Nano
The A2600Nano is a port of the [MiSTer](https://github.com/MiSTer-devel/Atari2600_MiSTer) FPGA core of the [Atari 2600 VCS](https://en.wikipedia.org/wiki/Atari_2600) to the 
[Tang Nano 20k](https://wiki.sipeed.com/nano20k) ([Gowin GW2AR](https://www.gowinsemi.com/en/product/detail/38/)) with enhancements from the A7800 core such as cartridge type autodetect and the video stabilizer.<br>

This is based on the [C64Nano](https://github.com/vossstef/tang_nano_20k_c64) project and also relies on a [M0S Dock µC](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) being connected to the Tang Nano 20K. Alternately you can use a [Raspberry Pi Pico](https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html) or [esp32-s2](https://www.espressif.com/en/products/socs/esp32-s2)/[s3](https://www.espressif.com/en/products/socs/esp32-s3) and use the [FPGA companion firmware](http://github.com/harbaum/FPGA-Companion).

Original A2600 core by [Retromaster](https://retromaster.wordpress.com/a2601/)  
All HID, SDcard and µC firmware by [Till Harbaum](http://www.harbaum.org/till/mist)<br>

Features:
* PAL 768x576p or NTSC 768x480p HDMI Video and Audio Output
* Scanline length auto adjust
* Cartridge type autodetect
* NTSC / PAL region autodetct
* Superchip autodetct
* USB Keyboard via µC
* [USB Joystick](https://en.wikipedia.org/wiki/Joystick) via µC
* [USB Gamepad](https://en.wikipedia.org/wiki/Gamepad) Stick via µC as paddle emulation<br>
* [legacy D9 Joystick](https://en.wikipedia.org/wiki/Atari_CX40_joystick) (Atari / Commodore digital type) [MiSTeryNano shield](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k/README.md)<br>
* Joystick emulation on Keyboard [Numpad](https://en.wikipedia.org/wiki/Numeric_keypad)<br>
* [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) Keys & Stick as Joystick<br>
* [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) Sticks as paddle emulation (analog mode)<br>
* Cartridge ROM loader [boot default is homebrew 'Hunchy' Chris Walton](https://videogamehomebrew.fandom.com/wiki/Chris_Walton)  

Planned features:
* ROM mapper control override via file extension
* Mapper updates
* Mouse as paddle support

> [!IMPORTANT]  
> PROJECT IS STILL WORK IN PROGRESS!

<br>
<img src="./.assets/a2600nano.png" alt="image" width="80%" height="auto">
<br>

HID interfaces aligned in pinmap and control to match [FPGA-Companion](https://github.com/harbaum/FPGA-Companion).<br> Basically a µC M0S/BL616 / Raspberry Pi Pico RP2040 / ESP32-S2/S3 acts as USB host for USB devices and as an OSD controller using a [SPI communication protocol](https://github.com/harbaum/MiSTeryNano/blob/main/SPI.md).
<br>

## Installation

The installation of A2600Nano on the Tang Nano 20k board can be done using a Linux PC or a Windows PC
[Instruction](INSTALLATION_WINDOWS.md).<br>

## Cartridge ROM Loader
ROM can be loaded via OSD file selection.<br>

### Supported mappers
* Auto detected<br>
F8 F6 FE E0 3F F4 P2 FA CV 2K UA E7 F0 32<br>

### four Button Joystick or Gamepad
* Gamepad Button ```Trigger A (DS2 circle)``` Trigger

* Gamepad Button ```Trigger B (DS2 cross)``` Paddle Trigger and enable 

* Gamepad Button ```Trigger X (DS2 triangle)``` Paddle 2nd Trigger and enable

* Gamepad Button ```Trigger Y (DS2 square)``` revert Paddle mode to Joystick mode

* Gamepad Button ```START``` as core function **START**<br>

* Gamepad Button ```SELECT``` as core function **SELECT**<br>

### Paddle
* DualShock 2 or USB Gamepad.<br>

Core switches to paddle mode if paddle ```Trigger B``` or ```Trigger X``` is pressed.  <br>
Can be reverted by pressing Gamepad Button ```Trigger Y```.

### Keyboard
* Key **F11** as core function ```START``` <br>
* Key **PAGE UP** as core function ```SELECT``` <br>

## Push Button utilization
* **S2** keep pressed during power-up to prevent FPGA bitstream load from FLASH.<br>

* **S1** reserved <br>

## OSD
invoke by F12 keypress<br>
* Reset<br>
* Cold Reset<br>
* Audio Volume + / -<br>
* Scanlines effect %<br>
* Region switch Auto/NTSC/PAL<br>
* HID device selection for Joystick Port<br>
* Loader file selection<br>
* Difficulty A, B Core switch
* Black & White Core video switch
* Joystick port swap
* Invert Paddle
* De-comb
* SuperChip Auto/off/on

## Gamecontrol support

 ![controller](\.assets/controller-layout.png)<br>

legacy single D9 Digital Joystick. OSD: **Retro D9**<br>
or<br>
USB Joystick(s) or Gamepad(s). OSD: **USB #1 Joy** or **USB #2 Joy** <br>
or<br>
Gamepad Stick as Joystick. OSD: **DualShock2**
<br>**left stick** for Move and ```square triangle cross circle``` Buttons for Trigger:<br>
| Buttons | - | - |
| - | - | -  |
| square<br>Trigger 1 | Up  | cross<br>Trigger 2 |
| Left | - | Right |
| triangle<br>Trigger 4  | Down | circle<br>Trigger 3 |<br>

or Keyboard Numpad. OSD: **Numpad**<br>
| | | |
|-|-|-|
|0<br>Trigger|8<br>Up||
|4<br>Left|-|6<br>Right|
|-|2<br>Down|-|

or Mouse. OSD: **Mouse**<br>
not supported yet

or Dualshock2 Gamepad left stick as Paddle. OSD: **DualShock2**<br>
**cross / triangle** Trigger<br>
You have first to set the DS2 Sticks into analog mode by pressing the DS2 ANALOG button.<br> Mode indicated by red light indicator.<br>Configure DIGITAL mode (press ANALOG button again) when using the **Joystick** mode again.<br>

## LED UI

| LED | function        | TN20K | TP20K | TP25K | TM138K |TN9k|
| --- |        -        | -     |-      | -     | -      |-|
| 1   | crt  | x     |x      |  x    | x      |N/A|

**Multicolor RGB LED**
* **<font color="green">green</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;all fine and ready to go<br>
* **<font color="red">red</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;something wrong with SDcard / default boot image<br>
* **<font color="blue">blue</font>**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;µC firmware detected valid FPGA core<br>
* **white**&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;-<br>
## Powering
Prototype circuit with Keyboard can be powered by Tang USB-C connector from PC or a Power Supply Adapter. 
## Synthesis
Source code can be synthesized, fitted and programmed with GOWIN IDE Windows or Linux.<br>
Alternatively use the command line build script **gw_sh.exe** build_tn20k.tcl<br>
## HW circuit considerations
**Pinmap TN20k Interfaces** <br>
 Sipeed M0S Dock, digital Joystick D9 and DualShock Gamepad connection.<br>
 ![wiring](\.assets/wiring_spi.png)

**Pinmap D-SUB 9 Joystick Interface** <br>
- Joystick interface is 3.3V tolerant. Joystick 5V supply pin has to be left floating !<br>
![pinmap](\.assets/vic20-Joystick.png)

| Joystick pin |IO| Tang Nano pin | FPGA pin | Joystick Function |
| ----------- |-----| ---   | --------  | ----- |
| 1 |2| J6 10  | 25   | UP | 
| 2 |1| J6 9  | 28 | DOWN |
| 3 |4| J6 12 | 29 | LEFT |
| 4 |3| J5 11 | 26 | RIGHT |
| 5 |-| - | - | POT Y | - |
| 6 |0| J5 8 | 27 | TRIGGER|
| 7 |-| n.c | n.c | 5V | - |
| 8 |-| J5 20 | - | GND | - |
| 9 |-| - | - | POT X | - |

**Pinmap Dualshock 2 Controller Interface** <br>
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
[Sipeed Tang Nano 20k](https://wiki.sipeed.com/nano20k) <br>
microSD or microSDHC card FAT/exFAT formatted<br>
TFT Monitor with HDMI Input and Speaker<br>
<br>

| HID and Gamecontrol Hardware option | TN20k | alternative option |Primer 25K|Mega 138K|Primer 20K|
| ----------- | --- |--- | ---  | ---| -|
| USB Keyboard | [USB-C to USB-A adapter](https://www.aliexpress.us/item/3256805563910755.html) | [4 port mini USB hub](https://a.aliexpress.com/_EIidgjH)  |x|x|x|
| [USB Joystick(s)](https://www.speedlink.com/en/COMPETITION-PRO-EXTRA-USB-Joystick-black-red/SL-650212-BKRD)| [4 port mini USB hub](https://a.aliexpress.com/_EIidgjH) | - |x|x|x|
| USB Mouse | [4 port mini USB hub](https://a.aliexpress.com/_EIidgjH) | -  |x|x|x|
| USB Gamepad |[4 port mini USB hub HS8836A](https://a.aliexpress.com/_EIidgjH)  | -  |x|x|x|
| Commodore/[Atari](https://en.wikipedia.org/wiki/Atari_CX40_joystick) compatible retro D9 Joystick| [MiSTeryNano shield](https://github.com/harbaum/MiSTeryNano/tree/main/board/misteryshield20k/README.md)|D-SUB 9 M connector, breadboard to wire everything up, some jumper wires|-|-|-|
| [Dualshock 2 Controller Gamepad](https://en.wikipedia.org/wiki/DualShock) | Gamepad Adapter Board (Sipeed Joystick to DIP) | breadboard to wire everything up and some jumper wires |-|x|x|
