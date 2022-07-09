import time
import os
import urllib

now = time.time()
now_tuple = time.localtime(now)
gmtNow_tuple = time.gmtime(now)

lastHour = now
lastHour_tuple = time.localtime(lastHour)
gmtLasthour_tuple = time.gmtime(lastHour)


def copyF(Bfile, Efile):
    urllib.urlretrieve(Bfile, Efile)
    os.system("gifsicle -b -O2 --use-col=web " + Efile)


# 	if not cmp.cmp(Bfile, Efile):


def main():
    # PIXDIR = "/wxdata/pix/"
    PIXDIR = "http://www.meteor.iastate.edu/pix/"
    data_dir = time.strftime(
        "/mnt/archivewx/data/%Y_%m_%d/", gmtLasthour_tuple
    )

    timestamp = time.strftime("%y%m%d%H", gmtLasthour_tuple)
    thisHour = gmtLasthour_tuple[3]

    conversions = [
        (PIXDIR + "proz1.gif", data_dir + "prof800m" + timestamp + ".gif"),
        (PIXDIR + "proz2.gif", data_dir + "prof1000m" + timestamp + ".gif"),
        (PIXDIR + "proz4.gif", data_dir + "prof9000m" + timestamp + ".gif"),
    ]

    if thisHour in range(1, 23, 3):
        for i in range(len(conversions)):
            copyF(conversions[i][0], conversions[i][1])


main()
