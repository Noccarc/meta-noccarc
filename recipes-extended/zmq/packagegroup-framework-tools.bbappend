# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe adds supprt for zmq in target

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


RDEPENDS_packagegroup-framework-tools-core += " \
					cppzmq-dev \
					czmq \
					"

RDEPENDS_packagegroup-framework-tools-python3 +=" \
						python3-pyzmq \
						"

