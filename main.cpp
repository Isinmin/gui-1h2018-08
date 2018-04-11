
#include <QtQuick>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QTextCodec>
#include "hangmangame.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QTextCodec * codec;
    codec = QTextCodec::codecForName("utf-8");
    QTextCodec::setCodecForLocale(codec);
    qmlRegisterType<HangmanGame>("org.qtproject.qthangman", 1, 0, "HangmanGame");

    QQmlApplicationEngine engine(QUrl("qrc:/qml/qthangman/main.qml"));

    return app.exec();
}
