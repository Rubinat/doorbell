DoorBell
========

- detailed info at: http://www.doodle3d.com/help/wiki/building-openwrt-wifibox

- clone this repo in YOURFOLDER (for example: /Users/rick/Documents/VechtclubXL)
- rename the folder DoorBell to 'bell'. (folder name needs to match package name)
- open OpenWRT.sparsebundle
- go to /Volumes/OpenWRT/trunk
- copy feeds.conf.default to feeds.conf
- Add this line to feeds.conf: src-link bell YOURFOLDER
- ./scripts/feeds update -a
- ./scripts/feeds update packages; ./scripts/feeds install -a -p packages
- make menuconfig
    (select 'WR710n' as Target Profile)
- make defconfig (needed?)
- make
- check bin folder for image
- flash the box with your created image
