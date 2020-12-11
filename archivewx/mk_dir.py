import os
import time

data_dest = "/mnt/archivewx/data/"


def main():
    now = time.time()
    now = now + 24 * 3600  # Tommarrow
    now_tuple = time.localtime(now)

    new_dir = time.strftime("%Y_%m_%d", now_tuple)
    os.mkdir(data_dest + new_dir)
    os.mkdir(data_dest + new_dir + "/skew")
    os.mkdir(data_dest + new_dir + "/DMX")
    # os.system("chown akrherz.palsdata "+data_dest+new_dir)
    os.system("chmod 775 " + data_dest + new_dir)
    os.system("chmod 775 " + data_dest + new_dir + "/skew")
    os.system("chmod 775 " + data_dest + new_dir + "/DMX")


if __name__ == "__main__":
    main()
