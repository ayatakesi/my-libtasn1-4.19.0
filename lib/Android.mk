# Modifications to GNU Libtasn1 to build on Android.
# Copyright (C) 2023 Free Software Foundation, Inc.

# These modifications are part of GNU Emacs.

# GNU Emacs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)

# Build libtasn1, but not gnulib.

include $(CLEAR_VARS)

libtasn1_la_SOURCES =	\
	ASN1.y		\
	coding.c	\
	decoding.c	\
	element.c	\
	element.h	\
	errors.c	\
	gstr.c		\
	gstr.h		\
	int.h		\
	includes/libtasn1.h	\
	libtasn1.map	\
	parser_aux.c	\
	parser_aux.h	\
	structure.c	\
	structure.h	\
	version.c

ifneq ($(findstring 64,$(TARGET_ARCH)),)
libtasn1_long_size := 8
else
libtasn1_long_size := 4
endif

LOCAL_SRC_FILES = $(filter %.c,$(libtasn1_la_SOURCES)) gl/strverscmp.c
LOCAL_MODULE := libtasn1
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/includes
LOCAL_C_INCLUDES := $(LOCAL_PATH)/includes $(LOCAL_PATH)/gl \
  $(LOCAL_PATH) $(LOCAL_PATH)/..
LOCAL_CFLAGS := -O2 -Wimplicit-function-declaration \
  -DSIZEOF_UNSIGNED_LONG_INT=$(libtasn1_long_size)  \
  -DHAVE_CONFIG_H
LOCAL_LDFLAGS = --no-undefined

include $(BUILD_SHARED_LIBRARY)
