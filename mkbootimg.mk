$(INSTALLED_BOOTIMAGE_TARGET): $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET)
	$(call pretty,"Target boot image: $@")
	$(hide) truncate -s '%4' $(INSTALLED_RAMDISK_TARGET)
	$(hide) $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET) $@ > /dev/null
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) $(recovery_kernel)
	$(call pretty,"Target recovery image: $@")
	$(hide) truncate -s '%4' $(recovery_ramdisk)
	$(hide) $(MKKRNLIMG) $(recovery_ramdisk) $@ > /dev/null
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
