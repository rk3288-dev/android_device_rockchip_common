#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <dirent.h>
#include <sys/socket.h>
#include <unistd.h>
#include <poll.h>

#include "cutils/log.h"
#include "cutils/memory.h"
#include "cutils/misc.h"
#include "cutils/properties.h"
#include "private/android_filesystem_config.h"

#define WIFI_CHIP_TYPE_PATH "/sys/class/rkwifi/chip"

int get_wifi_chip_type(char *type)
{
    int wififd, ret = 0;
    char buf[64];

    wififd = open(WIFI_CHIP_TYPE_PATH, O_RDONLY);
    if (wififd < 0) {
        ALOGD("Can't open %s, errno = %d", WIFI_CHIP_TYPE_PATH, errno);
        ret = -1;
        goto fail_exit;
    }
    memset(buf, 0, 64);

    if (0 == read(wififd, buf, 10)) {
        ALOGD("read %s failed", WIFI_CHIP_TYPE_PATH);
        close(wififd);
        ret = -1;
        goto fail_exit;
    }
    close(wififd);

    strcpy(type, buf);
    ALOGD("%s: %s", __func__, type);

fail_exit:
    return ret;
}
