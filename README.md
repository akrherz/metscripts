## metscripts

Scripts (currently a disaster mismatch of stuff) that generate various images
stored on various ISU meteorology web servers.

# Archiving locations

Part of the biggest issue is that we currently archive things in 3 places!

| script variable | PATH |
| --------------- | ---- |
| $CURRENT        | /home/www/meteor/html/wx/data/current |
| $WEBPIX         | /home/www/meteor/html/pix |
| $ARCHIVE        | /mnt/mtarchive/data |
| $ddir2          | /mnt/mtarchive/data/%Y/%m/%d |
