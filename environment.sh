#!/bin/sh

export BUILD_TYPE=Release

# If you want to build a Debug release, make sure to have the
# debugging version of Python installed and uncomment this line:
#export BUILD_TYPE=Debug

# Get the Python version as "pythonx.y", e.g. "python2.6"
PYTHONXY=`python -V 2>&1 | sed -e 's/Python 2\.\([0-9]*\).*/python2.\1/'`

export PYSIDESANDBOXPATH=/usr
export PATH=$PYSIDESANDBOXPATH/bin:$PATH
export PYTHONPATH=$PYSIDESANDBOXPATH/lib/$PYTHONXY/site-packages:$PYSIDESANDBOXPATH/lib64/$PYTHONXY/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PYSIDESANDBOXPATH/lib/pkgconfig:$PKG_CONFIG_PATH
export DYLD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$DYLD_LIBRARY_PATH

# If you want to use Qt Simulator, uncomment following line and set the
# enviroment variable $QT_SDK_HOME to the directory that contains the Qt
# tools for the Simulator platform (for example $HOME/qtsdk/Simulator/Qt/gcc/bin")

#Q_WS_SIMULATOR="yes"

# If you want to use Qt SDK, uncomment the following line, or set the
# environment variable $QT_SDK_HOME in something like your ~/.profile

#QT_SDK_HOME="$HOME/qtsdk/Desktop/Qt/474/gcc"

if [ "$QT_SDK_HOME" != "" ]; then
  export PATH=$QT_SDK_HOME/bin:$QT_SDK_HOME/qt/bin:$PATH
  export LD_LIBRARY_PATH=$QT_SDK_HOME/lib:$LD_LIBRARY_PATH
  export QTDIR=$QT_SDK_HOME:$QT_SDK_HOME/qt:$QTDIR
fi

