# Note: These instructions are for Linux, but wouldn't be much different for other platforms.

# Setup Android SDK
1. Download [Android sdk](https://developer.android.com/studio/index.html) (should be at the bottom of the page)
1. Extract the sdk package. Lets assume that the sdk root directory is `$HOME/bin/android-sdk`
1. Add following to your `~/.bashrc` or preferably to `~/.profile` file:

  ```bash
  export ANDROID_HOME="${HOME}/bin/android-sdk"
  export PATH="${ANDROID_HOME}/tools:${PATH}"
  export PATH="${ANDROID_HOME}/platform-tools:${PATH}"
  ```

# Setup Android Studio (AS)
1. Download [Android Studio](https://developer.android.com/studio/index.html)
1. Extract it. Lets assume that the AS directory is `$HOME/bin/android-studio`
1. Add AS's bin directory to the path by adding the following in your `~/.bashrc` or preferably to `~/.profile` file:
  
  ```bash
  export PATH="${HOME}/bin/android-studio/bin:${PATH}"
  ```
1. Use command `studio.sh` to launch AS.
  
# Setting up JAVA
> Instructions will be Java 8, since Android supports Java 8 now. Process is similar for Java 7

1. Download [JDK8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
1. Assuming you download for linux 64 bit and file is `~/Downloads/jdk-8u101-linux-x64.tar.gz`
1. Run following commands in terminal:

  ```bash
  sudo cp ~/Downloads/jdk-8u101-linux-x64.tar.gz /usr/lib/jvm
  cd /usr/lib/jvm
  sudo tar -xzvf jdk-8u101-linux-x64.tar.gz
  sudo rm -f jdk-8u101-linux-x64.tar.gz
  ```
1. Now you should have Java 8 extracted in `/usr/lib/jvm/jdk1.8.0_101` (Folder name `jdk1.8.0_101` might differ for you)
1. Add following to your `~/.bashrc` or preferably to `~/.profile` file:

  ```bash
  export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_101"
  export JDK_HOME="$JAVA_HOME"
  export STUDIO_JDK="$JAVA_HOME"
  ```
1. If this doesn't work, AS will ask you the location of JDK and you can point it to `/usr/lib/jvm/jdk1.8.0_101`

# AS Settings

Create file `~/studio64.vmoptions` with following content:

  ```
  #
  # See http://tools.android.com/tech-docs/configuration
  #
  -Xms1g
  -Xmx3g
  -XX:MaxPermSize=350m
  -XX:ReservedCodeCacheSize=240m
  -XX:+UseConcMarkSweepGC
  -XX:SoftRefLRUPolicyMSPerMB=50
  -ea
  -XX:-OmitStackTraceInFastThrow
  -Djna.nosys=true
  -Djna.boot.library.path=
  
  -Djna.debug_load=true
  -Djna.debug_load.jna=true
  -Dsun.io.useCanonCaches=false
  -Djava.net.preferIPv4Stack=true
  -XX:+HeapDumpOnOutOfMemoryError
  -XX:-OmitStackTraceInFastThrow
  -Dawt.useSystemAAFontSettings=lcd
  ```
  
The settings above use minimum 1 GB and maximum 3 GB of RAM for AS. You can change them by change the settings `-Xms1g` and `-Xmx3g` respectively.
  
----------------
  
Create another file `~/studio.properties` with following content:

  ```
  #
  # See http://tools.android.com/tech-docs/configuration
  #
  # Use ${idea.home.path} macro to specify location relative to IDE installation home.
  # Use ${xxx} where xxx is any Java property (including defined in previous lines of this file) to refer to its value.
  # Note for Windows users: please make sure you're using forward slashes (e.g. c:/idea/system).
  
  #---------------------------------------------------------------------
  # Uncomment this option if you want to customize path to IDE config folder. Make sure you're using forward slashes.
  #---------------------------------------------------------------------
  idea.config.path=${user.home}/.AndroidStudio/config
  
  #---------------------------------------------------------------------
  # Uncomment this option if you want to customize path to IDE system folder. Make sure you're using forward slashes.
  #---------------------------------------------------------------------
  idea.system.path=${user.home}/.AndroidStudio/system
  
  #---------------------------------------------------------------------
  # Uncomment this option if you want to customize path to user installed plugins folder. Make sure you're using forward slashes.
  #---------------------------------------------------------------------
  idea.plugins.path=${idea.config.path}/plugins
  
  #---------------------------------------------------------------------
  # Uncomment this option if you want to customize path to IDE logs folder. Make sure you're using forward slashes.
  #---------------------------------------------------------------------
  idea.log.path=${idea.system.path}/log
  
  #---------------------------------------------------------------------
  # Maximum file size (kilobytes) IDE should provide code assistance for.
  # The larger file is the slower its editor works and higher overall system memory requirements are
  # if code assistance is enabled. Remove this property or set to very large number if you need
  # code assistance for any files available regardless their size.
  #---------------------------------------------------------------------
  idea.max.intellisense.filesize=2500
  
  #---------------------------------------------------------------------
  # This option controls console cyclic buffer: keeps the console output size not higher than the specified buffer size (Kb).
  # Older lines are deleted. In order to disable cycle buffer use idea.cycle.buffer.size=disabled
  #---------------------------------------------------------------------
  idea.cycle.buffer.size=1024
  
  #---------------------------------------------------------------------
  # Configure if a special launcher should be used when running processes from within IDE.
  # Using Launcher enables "soft exit" and "thread dump" features
  #---------------------------------------------------------------------
  idea.no.launcher=false
  
  #---------------------------------------------------------------------
  # To avoid too long classpath
  #---------------------------------------------------------------------
  idea.dynamic.classpath=false
  
  #---------------------------------------------------------------------
  # Uncomment this property to prevent IDE from throwing ProcessCanceledException when user activity
  # detected. This option is only useful for plugin developers, while debugging PSI related activities
  # performed in background error analysis thread.
  # DO NOT UNCOMMENT THIS UNLESS YOU'RE DEBUGGING IDE ITSELF. Significant slowdowns and lockups will happen otherwise.
  #---------------------------------------------------------------------
  #idea.ProcessCanceledException=disabled
  
  #---------------------------------------------------------------------
  # There are two possible values of idea.popup.weight property: "heavy" and "medium".
  # If you have WM configured as "Focus follows mouse with Auto Raise" then you have to
  # set this property to "medium". It prevents problems with popup menus on some
  # configurations.
  #---------------------------------------------------------------------
  idea.popup.weight=heavy
  
  #---------------------------------------------------------------------
  # Use default anti-aliasing in system, i.e. override value of "Settings|Editor|Appearance|Use anti-aliased font"
  # option. May be useful when using Windows Remote Desktop Connection for instance.
  #---------------------------------------------------------------------
  idea.use.default.antialiasing.in.editor=false
  
  #---------------------------------------------------------------------
  # Disabling this property may lead to visual glitches like blinking and fail to repaint
  # on certain display adapter cards.
  #---------------------------------------------------------------------
  sun.java2d.noddraw=true
  
  #---------------------------------------------------------------------
  # Removing this property may lead to editor performance degradation under Windows.
  #---------------------------------------------------------------------
  sun.java2d.d3d=false
  
  #---------------------------------------------------------------------
  # Workaround for slow scrolling in JDK6
  #---------------------------------------------------------------------
  swing.bufferPerWindow=false
  
  #---------------------------------------------------------------------
  # Removing this property may lead to editor performance degradation under X Window.
  #---------------------------------------------------------------------
  sun.java2d.pmoffscreen=false
  
  #---------------------------------------------------------------------
  # Workaround to avoid long hangs while accessing clipboard under Mac OS X.
  #---------------------------------------------------------------------
  #ide.mac.useNativeClipboard=True
  
  #---------------------------------------------------------------------
  # Maximum size (kilobytes) IDEA will load for showing past file contents -
  # in Show Diff or when calculating Digest Diff
  #---------------------------------------------------------------------
  #idea.max.vcs.loaded.size.kb=20480
  
  #---------------------------------------------------------------------
  # IDEA file chooser peeks inside directories to detect whether they contain a valid project
  # (to mark such directories with a corresponding icon).
  # Uncommenting the option prevents this behavior outside of user home directory.
  #---------------------------------------------------------------------
  #idea.chooser.lookup.for.project.dirs=false
  
  #---------------------------------------------------------------------
  # IDEA can copy library .jar files to prevent their locking.
  # By default this behavior is enabled on Windows and disabled on other platforms.
  # Uncomment this property to override.
  #---------------------------------------------------------------------
  # idea.jars.nocopy=false
  
  #---------------------------------------------------------------------
  # The VM option value to be used to start a JVM in debug mode.
  # Some JREs define it in a different way (-XXdebug in Oracle VM)
  #---------------------------------------------------------------------
  idea.xdebug.key=-Xdebug
  
  #-----------------------------------------------------------------------
  # Change to 'disabled' if you don't want to receive instant visual notifications
  # about fatal errors that happen to an IDE or plugins installed.
  #-----------------------------------------------------------------------
  idea.fatal.error.notification=enabled
  ```

-----------------

Add following to your `~/.bashrc` or preferably to `~/.profile` file:

  ```
  #Intellij dbus- https://youtrack.jetbrains.com/issue/IDEA-78860
  export IBUS_ENABLE_SYNC_MODE=1
  
  # vmoptions for Android Studio
  export STUDIO_VM_OPTIONS="${HOME}/studio64.vmoptions"
  export STUDIO_PROPERTIES="${HOME}/studio.properties"
  ```

# Gradle tunning
> Gradle is build system for Android

Create the file `~/.gradle/gradle.properties` with following content:

  ```
  # Project-wide Gradle settings.
  
  # IDE (e.g. Android Studio) users:
  # Settings specified in this file will override any Gradle settings
  # configured through the IDE.
  
  # For more details on how to configure your build environment visit
  # http://www.gradle.org/docs/current/userguide/build_environment.html
  
  # The Gradle daemon aims to improve the startup and execution time of Gradle.
  # When set to true the Gradle daemon is to run the build.
  # TODO: disable daemon on CI, since builds should be clean and reliable on servers
  org.gradle.daemon=true
  
  # Specifies the JVM arguments used for the daemon process.
  # The setting is particularly useful for tweaking memory settings.
  # Default value: -Xmx10248m -XX:MaxPermSize=256m
  org.gradle.jvmargs=-Xmx2048m -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
  
  # When configured, Gradle will run in incubating parallel mode.
  # This option should only be used with decoupled projects. More details, visit
  # http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:decoupled_projects
  org.gradle.parallel=true
  
  # Enables new incubating mode that makes Gradle selective when configuring projects. 
  # Only relevant projects are configured which results in faster builds for large multi-projects.
  # http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:configuration_on_demand
  org.gradle.configureondemand=true
  ```

These settings specify 2 GB (`2048m`) to Gradle JVM, if you want to reduce or increase it, change the value of `org.gradle.jvmargs`

# Key Store
If you do not already have a key store and a key, create one:

1. Open AS
1. Create or import a project
1. Go to `Build->Generate Signed Apk...->Create New...`
1. Create a new key store and a key, lets **assume** (**do not literally use them**) the following names/values:
  * Key store path: `${HOME}/Documents/android_keys/KeyStore.jks`
  * Key store password: `storePassword`
  * Key alias: `keyAlias`
  * Key password: `keyPassword`

Add following to your `~/.bashrc` or preferably to `~/.profile` file:

  ```bash
  export STORE_FILE="${HOME}/Documents/android_keys/KeyStore.jks"
  export STORE_PASSWORD="storePassword"
  export KEY_ALIAS="keyAlias"
  export KEY_PASSWORD="keyPassword"
  ```

Then make following changes in the app module's `build.gradle` file;

  ```groovy
  android {
      signingConfigs {
          release {
              storeFile file(String.valueOf(System.env.STORE_FILE))
              storePassword System.env.STORE_PASSWORD
              keyAlias System.env.KEY_ALIAS
              keyPassword System.env.KEY_PASSWORD
          }
      }
  
      // compileSdkVersion should be minimum 24
      compileSdkVersion 24
      buildToolsVersion "24.0.1"
      defaultConfig {
          // compileSdkVersion should be minimum 24
          targetSdkVersion 24
          
          ...
  
          jackOptions {
              enabled true
          }
      }
      compileOptions {
          sourceCompatibility JavaVersion.VERSION_1_8
          targetCompatibility JavaVersion.VERSION_1_8
      }
      buildTypes {
          release {
              signingConfig signingConfigs.release
              
              ...
          }
      }
      ...
  }
  ```
