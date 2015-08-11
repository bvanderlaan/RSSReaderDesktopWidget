TEMPLATE = app
QT += qml quick widgets
CONFIG += C++14

SOURCES += main.cpp \
    WidgetPositioner.cpp

HEADERS += \
    WidgetPositioner.hpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

