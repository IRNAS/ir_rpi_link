# ir_rpi_link

IR or infrared, communication is a common, inexpensive, and easy to use wireless communication technology. IR light is very similar to visible light, except that it has a slightly longer wavelength. This means IR is undetectable to the human eye - perfect for wireless communication. 

A common modulation scheme for IR communication is something called 38kHz modulation. There are very few natural sources that have the regularity of a 38kHz signal, so an IR transmitter sending data at that frequency would stand out among the ambient IR. 38kHz modulated IR data is the most common, but other frequencies can be used.


### Koruza IR Link
Koruza IR link is a working prototype that will be used in wireless optical system [KORUZA][koruzaLink1]. It represents a system that is capable of establishing infrared communication over distances to 200 m. This IR link uses [LIRC][lircLink1] (Linux Infrared Control) with Raspberry Pi and additional hardware for IR transmitter (High Power Infrared Emitting Diode) and IR receiver.

### LIRC
[LIRC][lircLink1] is a package that allows you to decode infrared signals of many (but not all) commonly used remote controls. LIRC runs as a daemon that will decode IR signals received by the device drivers and provide the information on a socket. 

#### Instaling LIRC
Upgrade RPi2 firmware to newest version using these commands in order:
```{r, engine='bash', count_lines}
sudo apt-get update
sudo apt-get upgrade
sudo rpi-update
sudo reboot
```
After reboot, type the following command to install LIRC:
```{r, engine='bash', count_lines}
sudo apt-get install lirc liblircclient-dev
```
#### Configuring LIRC
Open the **/etc/modules** file, and add these lines at the end to make LIRC start up on boot and set the IR sensor pin to Pin-18 and IR LED pin(for later) to Pin-17 (pins can be changed):
```{r, engine='bash', count_lines}
lirc_dev
lirc_rpi gpio_in_pin=18 gpio_out_pin=17
```
Now we need to edit the LIRC hardware configuration file **/etc/lirc/hardware.conf**.
Change the following lines:
```{r, engine='bash', count_lines}
DRIVER="default"
DEVICE="/dev/lirc0"
MODULES="lirc_rpi"
```
Reboot your Raspi once:
```{r, engine='bash', count_lines}
sudo reboot
```
To make LIRC work on Raspberry Pi 2, you need to edit **/boot/config.txt**,add the following line to it:
```{r, engine='bash', count_lines}
dtoverlay=lirc-rpi,gpio_in_pin=18,gpio_out_pin=17,gpio_in_pull=up
```



All configurantion files can be found in folder [**config_files**][configFilesLink1] of this repository.


##### Resources
[lirc][lircLink1] - LIRC home page

[Setting Up LIRC on the RaspberryPi][link1]

[How to Control the GPIO on a Raspberry Pi with an IR Remote][link2]

[Read/emulate remotes with Arduino and Raspberry Pi][link3]



  [koruzaLink1]: <http://koruza.net/>
  [lircLink1]: <http://www.lirc.org/>
  [configFilesLink1]: <https://github.com/VojislavM/ir_rpi_link/tree/master/config_files>  
  [link1]: <http://alexba.in/blog/2013/01/06/setting-up-lirc-on-the-raspberrypi/>
  [link2]: <http://ozzmaker.com/how-to-control-the-gpio-on-a-raspberry-pi-with-an-ir-remote/>
  [link3]: <http://www.instructables.com/id/How-To-Useemulate-remotes-with-Arduino-and-Raspber/?ALLSTEPS>
  
  

