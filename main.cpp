#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"
#include "listmodel.h"
#include "listmodel2.h"
#include "listmodel3.h"
#include "listmodel4.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Подключаемся к базе данных
        DataBase database;
        //database.connectToDataBase();

        // Объявляем и инициализируем модель данных
        ListModel *model1 = new ListModel();
        ListModel2 *model2 = new ListModel2();
        ListModel3 *model3 = new ListModel3();
        ListModel4 *model4 = new ListModel4();

        //qmlRegisterType<DataBase>("DataBaseSQL", 1, 0, "DataBase");

        // Обеспечиваем доступ к модели и классу для работы с базой данных из QML
        engine.rootContext()->setContextProperty("mySrabModel", model1);
        engine.rootContext()->setContextProperty("myBreakModel", model2);
        engine.rootContext()->setContextProperty("myTechModel", model3);
        engine.rootContext()->setContextProperty("myMessModel", model4);
        engine.rootContext()->setContextProperty("baseConnection", &database);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
