import time
import urllib

now = time.time() - 3 * 24 * 3600  # 3 days ago
now_tuple = time.localtime(now)
gmtNow_tuple = time.gmtime(now)


def main():
    dataDir = time.strftime("/mnt/archivewx/data/%Y_%m_%d/", gmtNow_tuple)

    for i in range(24):
        i = ("0" + str(i))[-2:]
        timestamp = time.strftime("nowrad%y%m%d" + i + ".gif", gmtNow_tuple)
        getFile = time.strftime(
            "%Y/%m/%Y%m%d_" + i + "00_nowrad.gif", gmtNow_tuple
        )

        remoteURL = (
            "http://www.ncdc.noaa.gov/pub/data/nexrad/natcompnew/" + getFile
        )
        localFile = dataDir + timestamp

        urllib.urlretrieve(remoteURL, localFile)


main()
