import os
import time

svr_orig = "/data/text/Severe/"
pub_orig = "/data/text/Public/"
data_dest = "/mnt/archivewx/data/"


def main():
    now = time.time()
    now = now - 2 * 86400
    now_tuple = time.localtime(now)

    filename = time.strftime("Severe.%d", now_tuple)
    filename2 = time.strftime("Public.%d", now_tuple)
    new_filename = time.strftime("sev%Y_%m_%d.txt", now_tuple)
    new_filename2 = time.strftime("pub%Y_%m_%d.txt", now_tuple)
    dirname = time.strftime("%Y_%m_%d/", now_tuple)

    os.system(
        "cp " + svr_orig + filename + " " + data_dest + dirname + new_filename + " "
    )

    os.system(
        "cp " + pub_orig + filename2 + " " + data_dest + dirname + new_filename2 + " "
    )


if __name__ == "__main__":
    main()
