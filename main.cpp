#include <QColor>
#include <QGuiApplication>
#include <QMap>
#include <QObject>
#include <QQuickItem>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view(QStringLiteral("qrc:/main.qml"));

    QVariantMap map;
    map.insert("0.0", QColor(255,100,100));
    map.insert("0.5", QColor(100,255,100));
    map.insert("1.0", QColor(100,100,255));

    QMetaObject::invokeMethod(view.rootObject(), "insertGrads1",
                              Q_ARG(QVariant, QVariant::fromValue(map)));
    QMetaObject::invokeMethod(view.rootObject(), "insertGrads2",
                              Q_ARG(QVariant, QVariant::fromValue(map)));

    view.show();
    return app.exec();
}
