#  Copyright (C) 2016  Terence Brouns

#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.

#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = EyeStalker
TEMPLATE = app

QT       += core gui

CONFIG += c++11

unix {
QMAKE_CXXFLAGS += -fopenmp
QMAKE_LFLAGS += -fopenmp

QMAKE_LFLAGS += -Wl,-rpath,"'\$$ORIGIN'"

# LibUSB
 INCLUDEPATH += /usr/local/include/libusb-1.0/
 LIBS += -L/usr/local/lib -lusb-1.0

# OpenCV
INCLUDEPATH += "/usr/local/include/opencv2"
LIBS += `pkg-config --cflags --libs opencv`

# Eigen
INCLUDEPATH += "/usr/local/include/eigen3"

# Boost
LIBS += -L$$PWD/../../../../usr/local/lib/ -lboost_filesystem
INCLUDEPATH += $$PWD/../../../../usr/local/include
DEPENDPATH += $$PWD/../../../../usr/local/include

# Qwt
LIBS += -L$$PWD/../../../../usr/local/qwt-6.1.2/lib/ -lqwt
INCLUDEPATH += $$PWD/../../../../usr/local/qwt-6.1.2/include
DEPENDPATH += $$PWD/../../../../usr/local/qwt-6.1.2/include

# UEye
LIBS += -L$$PWD/../../../../../usr/lib/ -lueye_api
INCLUDEPATH += $$PWD/../../../../../usr/include
DEPENDPATH += $$PWD/../../../../../usr/include
}

win32 {
# OpenCV
INCLUDEPATH += C:/libs/OpenCV-2.4.9/include
LIBS += -LC:\\libs\\OpenCV-2.4.9\\build-qt\\lib \
    -lopencv_calib3d249d \
    -lopencv_contrib249d \
    -lopencv_core249d \
    -lopencv_features2d249d \
    -lopencv_flann249d \
    -lopencv_gpu249d \
    -lopencv_highgui249d \
    -lopencv_imgproc249d \
    -lopencv_legacy249d \
    -lopencv_ml249d \
    -lopencv_nonfree249d \
    -lopencv_objdetect249d \
    -lopencv_ocl249d \
    -lopencv_photo249d \
    -lopencv_stitching249d \
    -lopencv_superres249d \
    -lopencv_ts249d \
    -lopencv_video249d \
    -lopencv_videostab249d

# Eigen
INCLUDEPATH += C://libs//Eigen_3.3.0

# Boost
INCLUDEPATH += C://libs//boost_1_62_0

LIBS += -L$$PWD/../../../../libs/boost_1_62_0/stage/lib/ -lboost_filesystem-mgw49-mt-1_62
LIBS += -L$$PWD/../../../../libs/boost_1_62_0/stage/lib/ -lboost_system-mgw49-mt-1_62
LIBS += -L$$PWD/../../../../libs/boost_1_62_0/stage/lib/ -lboost_filesystem-mgw49-mt-d-1_62
LIBS += -L$$PWD/../../../../libs/boost_1_62_0/stage/lib/ -lboost_system-mgw49-mt-d-1_62

# UEye
INCLUDEPATH += C://libs//UEye//include
LIBS += C://libs//UEye//Lib//uEye_api.lib
LIBS += C://libs//UEye//Lib//uEye_api_64.lib
LIBS += C://libs//UEye//Lib//uEye_tools.lib
LIBS += C://libs//UEye//Lib//ueye_tools_64.lib
}

SOURCES += main.cpp\
        mainwindow.cpp \
    source/drawfunctions.cpp \
    source/eyetracking.cpp \
    source/mainwindowexperiment.cpp \
    source/mainwindowparameters.cpp \
    source/mainwindowreview.cpp \
    source/parameters.cpp \
    source/qimageopencv.cpp \
    source/sliderdouble.cpp \
    source/startupwindow.cpp \
    source/ueyeopencv.cpp \
    source/confirmationwindow.cpp \

HEADERS  += \
    headers/confirmationwindow.h \
    headers/constants.h \
    headers/drawfunctions.h \
    headers/eyetracking.h \
    headers/mainwindow.h \
    headers/parameters.h \
    headers/qimageopencv.h \
    headers/sliderdouble.h \
    headers/startupwindow.h \
    headers/structures.h \
    headers/ueyeopencv.h

RESOURCES += \
    resources/qdarkstyle/style.qrc
