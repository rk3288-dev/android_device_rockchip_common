$(INSTALLED_BOOTIMAGE_TARGET): $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET)
	$(call pretty,"Target boot image: $@")
	$(hide) truncate -s '%4' $(INSTALLED_RAMDISK_TARGET)
	$(hide) $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET) $@ > /dev/null
