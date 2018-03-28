
folder_01.source = qml/hangman
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=


SOURCES += main.cpp \
    data.cpp

SOURCES += data_default.cpp



include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/hangman/Hangman.qml \
    enable1.txt \

HEADERS += \
    data.h

RESOURCES += \
    main.qrc
