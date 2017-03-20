$(INSTALLED_BOOTIMAGE_TARGET): $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET)
	$(call pretty,"Target boot image: $@")
	$(hide) truncate -s '%4' $(INSTALLED_RAMDISK_TARGET)
	$(hide) $(MKKRNLIMG) $(INSTALLED_RAMDISK_TARGET) $@ > /dev/null
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) $(recovery_kernel)
	$(hide) truncate -s '%4' $(recovery_ramdisk)
	$(hide) $(MKBOOTIMG) \
		--kernel $(recovery_kernel) \
		--ramdisk $(recovery_ramdisk) \
		--output $@
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
