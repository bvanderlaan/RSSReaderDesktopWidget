TEMPLATE = app
QT += qml quick widgets
CONFIG += C++14

SOURCES += main.cpp \
    WidgetPositioner.cpp \
    Screens.cpp

HEADERS += \
    WidgetPositioner.hpp \
    Screens.hpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

