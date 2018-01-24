* Run `qtchooser -l`
  * This lists all the qt versions configured in the QT conf files
  
* QT conf files
  * They are present in:
    * /usr/lib/x86_64-linux-gnu/qtchooser (Normally, just symlinks to the files in the folder on next line)
    * /usr/share/qtchooser  (Normally, contains the real .conf files)
  * The name of files are <Version>.conf
    * The <Version> is listed in `qtchooser -l`
  * The .conf files contain two lines
    * First line contains the path to QT bin directory e.g. /usr/lib/x86_64-linux-gnu/qt5/bin
    * Second line contains the path to QT libraries e.g. /usr/lib/x86_64-linux-gnu

* To choose a default qt versions, there are two ways:
  * set the QT_SELECT to one of the values from `qtchooser -l`
    * To see an example, run `qtchooser --print-env`
    * You can also set following env variables to override bin and lib directories:
      * `export QTTOOLDIR="/usr/lib/x86_64-linux-gnu/qt5/bin"`
      * `export QTLIBDIR="/usr/lib/x86_64-linux-gnu"`
  * Second option is to install qt-default or qt5-default, which will create a default conf (named default.conf in the conf folders mentioned above).
    * You can symlink this default.conf to any default conf you want.
    * E.g. to install qt5-default: `sudo apt-get install qt5-default`
    
* To test the selected version:
  * Run `qmake -v`
  * If qmake isn't found, install it e.g. `sudo apt-get install qt5-qmake`
  
