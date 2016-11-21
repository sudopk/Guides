'''
# Current directory
LOCAL_PATH:= $(call my-dir)

# Clear all LOCAL_ prefixed vars
include $(CLEAR_VARS)

# Build only for eng builds
LOCAL_MODULE_TAGS := eng

# Variables holding directory names
some_module_dir := moduleDir
app_dir := app

# Location of support libraries
ifeq ($(TARGET_BUILD_APPS),)
support_library_root_dir := frameworks/support
else
support_library_root_dir := prebuilts/sdk/current/support
endif

src_dirs := $(app_dir)/src/main/java $(some_module_dir)/src/main/java
res_dirs := $(app_dir)/src/main/res $(some_module_dir)/src/main/res
asset_dirs :=

# Main manifest file
LOCAL_MANIFEST_FILE := $(app_dir)/src/main/AndroidManifest.xml
# Other manifest files, will be merged with main manifest file
LOCAL_FULL_LIBS_MANIFEST_FILES := $(LOCAL_PATH)/$(some_module_dir)/src/main/AndroidManifest.xml

# All src files
LOCAL_SRC_FILES := $(call all-java-files-under, $(src_dirs))

# All res files, need absolute path from aosp root
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, $(res_dirs)) \
    $(support_library_root_dir)/v7/cardview/res \
    $(support_library_root_dir)/v7/recyclerview/res \
    $(support_library_root_dir)/v7/appcompat/res \
    $(support_library_root_dir)/v7/preference/res \
    $(support_library_root_dir)/design/res \
    $(support_library_root_dir)/v14/preference/res

# All asserts
LOCAL_ASSET_DIR := $(addprefix $(LOCAL_PATH)/, $(asset_dirs))

# R.* are resolved from these packages
# You library package should be added here. Add the package name of the android library
LOCAL_AAPT_FLAGS := \
    --auto-add-overlay \
    --extra-packages com.mydomain.somepackage \
    --extra-packages android.support.annotations \
    --extra-packages android.support.multidex \
    --extra-packages android.support.v13 \
    --extra-packages android.support.v14.preference \
    --extra-packages android.support.v4 \
    --extra-packages android.support.design \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.v7.cardview \
    --extra-packages android.support.v7.preference \
    --extra-packages android.support.v7.recyclerview

# Libraries to pack with the app
LOCAL_STATIC_JAVA_LIBRARIES := \
    lib-gson \
    lib-otto \
    lib-dagger \
    lib-daggercompiler \
    lib-glassfish-inject \
    guava \
    lib-inject \
    android-common \
    android-support-annotations \
    android-support-v14-preference \
    android-support-v4 \
    android-support-design \
    android-support-v7-appcompat \
    android-support-v7-cardview \
    android-support-v7-preference \
    android-support-v7-recyclerview
    #android-support-multidex \
    #android-support-v13 \

#LOCAL_STATIC_ANDROID_LIBRARIES := \

# Module name
LOCAL_PACKAGE_NAME := MyApp

# Certificate used to sign the app
LOCAL_CERTIFICATE := shared

LOCAL_PRIVILEGED_MODULE := false

# Jack compiler flags
#LOCAL_JACK_FLAGS += -D jack.dex.output.policy=minimal-multidex

# Proguard files
LOCAL_PROGUARD_FLAG_FILES := \
    ../../../sdk/files/proguard-android.txt \
    $(app_dir)/proguard-rules.pro \
    $(some_module_dir)/proguard-rules.pro
# default value for LOCAL_PROGUARD_ENABLED is "full"
#LOCAL_PROGUARD_ENABLED := disabled

# CompileSdkVersion
LOCAL_SDK_VERSION := current
# MinSdkVersion
LOCAL_MIN_SDK_VERSION := 21

# dagger 2, these libraries must also be in LOCAL_STATIC_JAVA_LIBRARIES
PROCESSOR_LIBRARIES := \
    lib-daggercompiler \
    lib-dagger \
    lib-dagger-producers \
    lib-inject \
    guava


PROCESSOR_CLASSES := \
    dagger.internal.codegen.ComponentProcessor

LOCAL_MODULE := $(LOCAL_PACKAGE_NAME)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

# see external/dagger2/java_annotation_processors.mk
# Map the library names to actual JARs.
PROCESSOR_JARS := $(call java-lib-deps, $(PROCESSOR_LIBRARIES))

# Add a javac -processorpath flag.
LOCAL_JACK_FLAGS += --processorpath $(call normalize-path-list,$(PROCESSOR_JARS))

# Specify only one processor class per -processor option as
# the indexing tool does not parse the -processor value as a
# comma separated list.
LOCAL_JACK_FLAGS += $(foreach class,$(PROCESSOR_CLASSES),--processor $(class))

# Create a source directory into which the code will be generated.
GENERATED_SOURCE_DIR := $(local-generated-sources-dir)/annotation_processor_output/

# Tell javac to generate source files in the source directory.
LOCAL_JAVACFLAGS += -s $(GENERATED_SOURCE_DIR)
LOCAL_GENERATED_SOURCES := $(GENERATED_SOURCE_DIR)

# Add dependency between the jar being built and the processor jars so that
# they are built before this one.
LOCAL_ADDITIONAL_DEPENDENCIES += $(PROCESSOR_JARS) $(GENERATED_SOURCE_DIR)

$(GENERATED_SOURCE_DIR):
		mkdir -p $@

# Clean up all the extra variables to make sure that they don't escape to
# another module.
PROCESSOR_LIBRARIES :=
PROCESSOR_CLASSES :=
PROCESSOR_JARS :=
GENERATED_SOURCE_DIR :=
LOCAL_MODULE :=
LOCAL_MODULE_CLASS :=

include $(BUILD_PACKAGE)

# Jars are handled as prebuilts
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

# Name of the prebuild:Jar file
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    lib-otto:libs/otto-1.3.8.jar \
    lib-gson:libs/gson-2.7.jar \
    lib-dagger:libs/dagger-2.5.jar \
    lib-inject:libs/javax.inject-1.jar \
    lib-glassfish-inject:libs/javax.annotation-10.0-b28.jar \
    lib-dagger-producers:libs/dagger-producers-2.5.jar \
    lib-daggercompiler:libs/dagger-compiler-2.5.jar

include $(BUILD_MULTI_PREBUILT)

# Host Jars
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_PREBUILT_JAVA_LIBRARIES := \
    lib-dagger:libs/dagger-2.5.jar \
    lib-inject:libs/javax.inject-1.jar \
    lib-dagger-producers:libs/dagger-producers-2.5.jar \
    lib-daggercompiler:libs/dagger-compiler-2.5.jar

include $(BUILD_HOST_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
'''
