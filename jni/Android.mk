TOP_PATH := $(call my-dir)/..



###########
# TermCap #
###########

LOCAL_PATH := $(TOP_PATH)/termcap

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
-DHAVE_STRING_H=1 \
-DHAVE_UNISTD_H=1 \
-DSTDC_HEADERS=1 \
-DTERMCAP_FILE=\"/etc/termcap\"

LOCAL_SRC_FILES := \
termcap.c \
tparam.c \
version.c

LOCAL_MODULE := libtermcap
#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)

################
# Lib ReadLine #
################

LOCAL_PATH := $(TOP_PATH)/readline

include $(CLEAR_VARS)

#LOCAL_SHARED_LIBRARIES := libtermcap
LOCAL_STATIC_LIBRARIES := libtermcap

LOCAL_CFLAGS := \
-DHAVE_CONFIG_H \
-DRL_LIBRARY_VERSION='"6.2"' \

LOCAL_SRC_FILES := \
readline.c \
vi_mode.c \
funmap.c \
keymaps.c \
parens.c \
search.c \
rltty.c \
complete.c \
bind.c \
isearch.c \
display.c \
signals.c \
util.c \
kill.c \
undo.c \
macro.c \
input.c \
callback.c \
terminal.c \
text.c \
nls.c \
misc.c \
compat.c \
xfree.c \
xmalloc.c \
history.c \
histexpand.c \
histfile.c \
histsearch.c \
shell.c \
mbutil.c \
tilde.c

LOCAL_MODULE := libreadline
#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)


################
# Lib Lua #
################

LOCAL_PATH := $(TOP_PATH)/proxmark3/liblua

include $(CLEAR_VARS)


LOCAL_CFLAGS := \
-O2 -Wall -DLUA_COMPAT_ALL 

LOCAL_SRC_FILES := \
	lapi.c \
	lcorolib.c \
	ldump.c \
	llex.c \
	lopcodes.c \
	lstrlib.c \
	luac.c \
	lauxlib.c \
	lctype.c \
	lfunc.c \
	lmathlib.c \
	loslib.c \
	ltable.c \
	lundump.c \
	lbaselib.c \
	ldblib.c \
	lgc.c \
	lmem.c \
	lparser.c \
	ltablib.c \
	lvm.c \
	lbitlib.c \
	ldebug.c \
	linit.c \
	loadlib.c \
	lstate.c \
	ltm.c \
	lzio.c \
	lcode.c \
	ldo.c \
	liolib.c \
	lobject.c \
	lstring.c \
	lua.c \


LOCAL_MODULE := liblua
include $(BUILD_STATIC_LIBRARY)

#############
# Proxmark3 #
#############

LOCAL_PATH := $(TOP_PATH)/proxmark3

include $(CLEAR_VARS)

#LOCAL_SHARED_LIBRARIES := libtermcap libreadline
LOCAL_STATIC_LIBRARIES := liblua libtermcap libreadline

LOCAL_CFLAGS := -std=c99 -DCMIN=1 -DCTIME=0

LOCAL_C_INCLUDES := \
$(LOCAL_PATH)/include \
$(LOCAL_PATH)/common \
$(LOCAL_PATH)/client \
$(TOP_PATH)/ \
$(TOP_PATH)/libusb \
$(LOCAL_PATH)/liblua \

LOCAL_SRC_FILES := \
	client/uart.c \
	client/util.c \
	client/sleep.c \
 	client/nonce2key/crapto1.c\
	client/nonce2key/crypto1.c\
	client/nonce2key/nonce2key.c\
	client/loclass/cipher.c \
	client/loclass/cipherutils.c \
	client/loclass/des.c \
	client/loclass/ikeys.c \
	client/loclass/elite_crack.c\
	client/loclass/fileutils.c\
	client/mifarehost.c\
	common/crc.c \
	common/crc16.c \
	common/crc64.c \
	common/iso14443crc.c \
	common/iso15693tools.c \
	client/data.c \
	client/graph.c \
	client/ui.c \
	client/cmddata.c \
	common/lfdemod.c \
	client/cmdhf.c \
	client/cmdhf14a.c \
	client/cmdhf14b.c \
	client/cmdhf15.c \
	client/cmdhfepa.c \
	client/cmdhflegic.c \
	client/cmdhficlass.c \
	client/cmdhfmf.c \
	client/cmdhfmfu.c \
	client/cmdhw.c \
	client/cmdlf.c \
	client/cmdlfio.c \
	client/cmdlfhid.c \
	client/cmdlfawid.c \
	client/cmdlfem4x.c \
	client/cmdlfhitag.c \
	client/cmdlfti.c \
	client/cmdparser.c \
	client/cmdmain.c \
	client/cmdlft55xx.c \
	client/cmdlfpcf7931.c\
	client/pm3_binlib.c\
	client/scripting.c\
	client/cmdscript.c\
	client/pm3_bitlib.c\
	client/aes.c\
	common/protocols.c\
	common/sha1.c\
	client/guidummy.c \
	client/proxmark3.c


LOCAL_MODULE := proxmark3
include $(BUILD_EXECUTABLE)

