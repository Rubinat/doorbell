DoorBell
========
- detailed info about building: http://www.doodle3d.com/help/wiki/building-openwrt-wifibox
- clone this repo in YOURFOLDER (for example: `/Users/rick/Documents/VechtclubXL`)
- rename the folder DoorBell to 'bell'. (folder name needs to match package name)
- open `OpenWRT.sparsebundle`
- go to /Volumes/OpenWRT/trunk
- copy `feeds.conf.default` to `feeds.conf`
- Add this line to `feeds.conf`: `src-link bell YOURFOLDER`
- `./scripts/feeds update -a`
- `./scripts/feeds update packages; ./scripts/feeds install -a -p packages`
- `make menuconfig`
    (select 'WR710n' as Target Profile)
- `make defconfig` (needed?)
- `make V=s`
- check `bin` folder for image
- flash the box with your created image

additional Notes/steps:

- clone this repo in YOURFOLDERPATH (for example: /Users/rick/Documents/VechtclubXL)
- rename the folder `Doorbell` to `Bell` (this is because the name of the folder needs to match the name of the package)
- open `OpenWRT.sparsebundle`
- go to `/Volumes/OpenWRT/trunk`
- copy `feeds.conf.default` to `feeds.conf` (cp in bash)
- add this line to `feeds.conf`: `src-link doorbell YOURFOLDERPATH`
- then in the trunk directory bash: `./scripts/feeds update -a`
- also for the following line: `./scripts/feeds update packages; ./scripts/feeds install -a -p packages`
- then type `make menuconfig` (this will open a graphic configuration menu after a few seconds)
- in the menuconfig select your router as `Target Profile` (in our case: TP-Link TL-WR710N)
- after that scroll down a little bit, until you get to `Bell`.
- include `Bell` by entering the folder and selecting the contents of it with the `Y`-button
- exit the menuconfig (when it asks you to safe or not, say `yes` ofcourse)
- then you should return to bash in the terminal again
- here type: `make` (use `make V=s` for more information when you get an error)
- after this go to your trunk directory
- navigate to `bin/ar71xx`
- in here you can find binaries to flash a router with your new made image

raspberry pi server:

- nodejs is running a TCP server at `bel.vcxl.nl:3000`. you can connect to this server by using netcat (nc): `nc bel.vcxl.nl 3000` or from any other client.
- apache is serving `http://bel.vcxl.nl/bell-latest.ipk` from `/var/www`
- `/var/www` is owned by `pi` instead of `root`
- to build and upload a new version of the Bell package: 
    `make package/Bell/install V=s && scp /Volumes/VechtclubXL/trunk/bin/ar71xx/packages/bell/bell_0.1.0-1_ar71xx.ipk pi@bel.vcxl.nl:/var/www/`
- on the raspberry pi you can write to a tmp file `/tmp/bellwrite`. The contents of this file is send to all connected clients whereafter the file is deleted.
- to update all connected clients: `echo update > /tmp/bellwrite` or to turn on a bell for testing: `echo 3,1 > /tmp/bellwrite` or to turn it of again: `echo off > /tmp/bellwrite`

updating package through ssh:

- `ssh root@10.0.0.169 "opkg install http://bel.vcxl.nl/bell-latest.ipk"`   
