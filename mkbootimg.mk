$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) \
		$(INSTALLED_KERNEL_TARGET) \
		$(INSTALLED_RAMDISK_TARGET) \
		$(INSTALLED_RESOURCEIMAGE_TARGET)
	$(call pretty,"Target boot image: $@")

	# Round up the size of ramdisk.img to multiple of 4 bytes
	truncate -s '%4' $(INSTALLED_RAMDISK_TARGET)

	$(MKBOOTIMG) \
		--kernel $(INSTALLED_KERNEL_TARGET) \
		--ramdisk $(INSTALLED_RAMDISK_TARGET) \
		--second $(INSTALLED_RESOURCEIMAGE_TARGET) \
		--output $@
