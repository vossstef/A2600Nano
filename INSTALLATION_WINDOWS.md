# Installation using a Windows PC

This document explains how to install all the necessary files on the
Tang Nano 20K and the M0S Dock in order to use it as a A2600Nano
device.

This has been tested on Windows 11. It should work on older versions too.

Software needed:

  - [Gowin V1.9.10.03](https://www.gowinsemi.com/en/support/home/) **to synthesize the core**
  - [BouffaloLabDevCube](https://dev.bouffalolab.com/download) **to flash the BL616**
  - [Latest release](https://github.com/vossstef/A2600nano/releases/latest) of A2600Nano **FPGA** bitstream
  - [Latest release](http://github.com/harbaum/FPGA-Companion/releases/latest) of FPGA companion firmware **µC firmware** (if not otherwise stated in the release note.)

In order to use the SD card:

  - Cartridge images 

# Flashing the Tang Nano 20k

First download the Gowin IDE. The Education version is sufficient and
won't need a licence.

Install the IDE on your system (follow the installation instructions
from Gowin).  After the Installation you should have it as an shortcut
on your desktop or in your start menu.

 - Press the ```S2``` button on the Tang Nano 20K and keep it pressed
 - Connect the Tang Nano 20k to the USB on your computer. You should hear the connecting sound of Windows.
 - Release the ```S2``` button
 - Start Gowin. **You should see the following screen**

![](https://github.com/vossstef/A2600Nano/blob/main/.assets/gowin1.jpg)

Now press on the “programmer” marked red on the picture above. **You
should see following screen:**

![](https://github.com/vossstef/A2600Nano/blob/main/.assets/device.png)

-   Press save on the dialog
-   From there you can add a device for programming by pressing on the little
    icon with the green plus
-   At least one file have to be flashed:
    - The core itself: ```a2600nano_tn20k.fs```
-   Than you can choose from the drop downs the parameter you see on the
    pictures.

**Important**:

  - ```a2600nano_tn20k.fs``` is written to address 0x000000


  - For the FS file please choose the ```a2600nano_tn20k.fs``` you just downloaded
  - User Code and IDCODE can be ignored
  - Mark each of your configs and press the little icon with the green play
    button. You should see a progress bar and then:

![](https://github.com/vossstef/A2600Nano/blob/main/.assets/c64_flash.png)
**At a glance the memory layout of the SPI Flash:**
|                           | |          |          |         | | |
|-                          |-         |-         |-         |-        |-|-|
| Type                      | TN20k    | TP20k    |TP25k     | TM138k  |TM60k | |
| FPGA bitstream            | 0x000000 | 0x000000 | 0x000000 | 0x000000 |0x000000|ROM size |

For the TN9k there might be an older version of the programmer SW be needed.

**shell / command line Programming alternative**

Windows shell and Gowin Programmer<br>
```programmer_cli  -r 36 --fsFile a2600nano_tn9k.fs   --cable-index 1 --d GW1NR-9C```<br>
```programmer_cli  -r 36 --fsFile a2600nano_tn20k.fs --spiaddr 0x000000 --cable-index 1 --d GW2AR-18C```<br>
```programmer_cli  -r 36 --fsFile a2600nano_tp20k.fs --spiaddr 0x000000 --cable-index 1 --d GW2A-18C```<br>
```programmer_cli  -r 36 --fsFile a2600nano_tp25k.fs --spiaddr 0x000000 --cable-index 1 --d GW5A-25A```<br>
```programmer_cli  -r 36 --fsFile a2600nano_tm60k.fs --spiaddr 0x000000 --cable-index 1 --d GW5AT-60B```<br>
```programmer_cli  -r 36 --fsFile a2600nano_tm138k_pro.fs --spiaddr 0x000000 --cable-index 1 --d GW5AST-138B```<br>

**That´s it for the Tang Nano 20k**

## Flashing the BL616 µC

For the BL616 you have to extract and start the BuffaloLabDevCube. 

**If you use the internal BL616 present on the Tang Nano 20K you loose
your possibility to flash the Tang over the USB connection.** It is thus
strongly recommended to use an external BL616 (e.g. a M0S Dock).

However, when using the internal BL616 you will be able to flash the
[original firmware](https://github.com/harbaum/MiSTeryNano/blob/main/bl616/friend_20k)
to the internal BL616 again to restore the flasher functionality of
the Tang Nano 20K. Using an external M0S is nevertheless recommended.

-   Press the ```BOOT``` button on your M0S Dock before you plug the USB connection
    on your PC. You should hear the hardware detecting sound.
-   Start the BuffaloLabDevCube from the directory where you decompressed it it
    ask you what chip should be used. Select BL616/BL618 and press “finish”

![](https://github.com/vossstef/A2600Nano/blob/main/.assets/buffstart.png)

- You'll now see the program screen. On the right it should auto detect your
  device with a COM port. If not take a look in the device manager to check for
  the correct device detection.
- On the top click on MCU and browse to the firmware image file named
  ```fpga_companion_bl616.bin``` (contains a unified firmware)
- Choose “Open Uart” and than press “Create & Download”. The firmware should now be
  flashed

![](https://github.com/vossstef/A2600Nano/blob/main/.assets/bufffinish.png)

## Prepare the SD card

Format the SD card in FAT32. Copy your cartrige files files on
it. You can organize your files in subdirectories.  
These files can later be selected using the on-screen-display (OSD).  
Copy a 2600 rom cartrige image to your sdcard and rename it to a2600crt.bin as default boot image.

