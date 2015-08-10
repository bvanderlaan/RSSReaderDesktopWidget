#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFileInfo>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setOrganizationName("Imaginative Thinking");
    app.setOrganizationDomain("imaginativethinking.ca");
    app.setApplicationName(QFileInfo(app.applicationFilePath()).baseName());

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
