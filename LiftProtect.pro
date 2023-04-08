QT += qml quick widgets sql
LIBS += -lpthread libwsock32 libws2_32

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES +=  main.cpp \
            database.cpp \
            listmodel.cpp \
            listmodel2.cpp \
            listmodel3.cpp \
            listmodel4.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    database.h \
    listmodel.h \
    listmodel2.h \
    listmodel3.h \
    listmodel4.h

DISTFILES += \
    deployment.pri
