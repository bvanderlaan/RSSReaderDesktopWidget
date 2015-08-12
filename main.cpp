#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFileInfo>
#include <QtQml>
#include "WidgetPositioner.hpp"
#include "Screens.hpp"

using namespace ImaginativeThinking::RSSReader;

int main(int argc, char *argv[])
{
    qmlRegisterType<WidgetPositioner>("ca.imaginativethinking", 1, 0, "WidgetPositioner");
    qmlRegisterType<Screens>("ca.imaginativethinking", 1, 0, "Screens" );

    QApplication app(argc, argv);
    app.setOrganizationName("Imaginative Thinking");
    app.setOrganizationDomain("imaginativethinking.ca");
    app.setApplicationName(QFileInfo(app.applicationFilePath()).baseName());

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
