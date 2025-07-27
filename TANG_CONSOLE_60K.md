# A2600 Nano on Tang Console 60K / 138K NEO

A2600 Nano can be used in the [Tang Console 60K / 138K NEO](https://wiki.sipeed.com/hardware/en/tang/tang-console/mega-console.html).

Besides the significantly bigger FPGA over the Tang Nano 20K, the Tang Mega 60K adds several more features of
which some can be used in the area of retro computing as well. 

The Tang Console comes with DDR3-SDRAM as well as a slot for the [Tang
SDRAM](https://wiki.sipeed.com/hardware/en/tang/tang-PMOD/FPGA_PMOD.html#TANG_SDRAM). Using
this board allows to use the same SDR-SDRAM memory access
methods.  

The [M0S Dock BL616](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) required to control the board is to be mounted in the
**lower right PMOD** connector with the help of the [M0S PMOD Adapter](https://github.com/harbaum/MiSTeryNano/blob/main/board/m0s_pmod).

Alternatively a [PMOD RP2040-Zero](/board/pizero_pmod/README.md) can be plugged right away into the **lower right PMOD** connector.

It is also possible to make use of the onboard BL616 µC for the FPGA-Companion firmware.  
> [!NOTE]
> The onboard BL616 configuration will require an extern powered USB Hub + USB-A (M) to USB-A cable (M) + USB-A Power Supply Adapter 2 Amps. It will supply the Console board and at the same time provide USB ports for USB Keyboard and e.g. USB Joystick or Mouse including needed power. Also a multifunctional USB-Hub with Power Delivery pass-through had been reported to work.  

An optional Plastation Dualshock 2 PMOD may by inserted in the second PMOD
closer to the HDMI connector. 

Both Audio Amplifier and the LCD Interface for a 5" TFT-LCD module 800x480 Type [SH500Q01Z](https://dl.sipeed.com/Accessories/LCD/500Q01Z-00%20spec.pdf) (Ilitek ILI6122)
is in additionto HDMI actiavted.  

The firmware for the M0S Dock / PiPico is the [same version as for the Tang
Nano 20K and all other boards](https://github.com/harbaum/FPGA-Companion).

The whole setup will look like this:

![A2600Nano on Console 60K NEO RP2040-Zero](./.assets/console60k_zero.png)

![A2600Nano on Console 60K NEO M0S Dock](./.assets/console60k_m0s.png)

![A2600Nano on Console 60K NEO onboard BL616](./.assets/console_usbhub_and_power_over_usb-a.png)
