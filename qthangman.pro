QT += quick qml multimedia multimediawidgets
!android: !ios: !blackberry: qtHaveModule(widgets): QT += widgets multimedia multimediawidgets

SOURCES += main.cpp \
    hangmangame.cpp

HEADERS += \
    hangmangame.h

RESOURCES += \
    resources.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/purchasing/qthangman
INSTALLS += target

CONFIG+=config_openal
OTHER_FILES += \
    qml/qthangman/GameView.qml \
    qml/qthangman/GuessWordView.qml \
    qml/qthangman/Hangman.qml \
    qml/qthangman/HowToView.qml \
    qml/qthangman/Key.qml \
    qml/qthangman/Letter.qml \
    qml/qthangman/LetterSelector.qml \
    qml/qthangman/main.qml \
    qml/qthangman/MainView.qml \
    qml/qthangman/PageHeader.qml \
    qml/qthangman/ScoreItem.qml \
    qml/qthangman/SimpleButton.qml \
    qml/qthangman/SplashScreen.qml \
    qml/qthangman/StoreItem.qml \
    qml/qthangman/Word.qml \
    enable2.txt

DISTFILES += \
    lang_en.txt \
    Win.wav


win32:CONFIG(release, debug|release): LIBS += -L'C:/Program Files (x86)/OpenAL 1.1 SDK/libs/Win64/' -lOpenAL32
else:win32:CONFIG(debug, debug|release): LIBS += -L'C:/Program Files (x86)/OpenAL 1.1 SDK/libs/Win64/' -lOpenAL32d

INCLUDEPATH += 'C:/Program Files (x86)/OpenAL 1.1 SDK/includes'
DEPENDPATH += 'C:/Program Files (x86)/OpenAL 1.1 SDK/includes'

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/'OpenAL 1.1 SDK/libs/Win64/' -lOpenAL32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/'OpenAL 1.1 SDK/libs/Win64/' -lOpenAL32d
else:unix: LIBS += -L$$PWD/'OpenAL 1.1 SDK/libs/Win64/' -lOpenAL32

INCLUDEPATH += $$PWD/'OpenAL 1.1 SDK/AL'
DEPENDPATH += $$PWD/'OpenAL 1.1 SDK/AL'
