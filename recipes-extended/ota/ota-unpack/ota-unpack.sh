#!/bin/bash

OTA_DIR=/usr/local
OTA_PATH=/usr/local/VCB-OTA
OTA_TAR_FILE=VCB-OTA.tar.xz

if [ ! -d "${OTA_PATH}" ]
then
	cd "${OTA_DIR}" && tar -xvf "${OTA_TAR_FILE}" 
	chmod -R +x "${OTA_PATH}"
fi
