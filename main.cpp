#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dynamicfileshelper.h"

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "1");

    QGuiApplication app(argc, argv);

    app.setApplicationName("Moh3D");
    app.setApplicationDisplayName("Moh3D");
    app.setApplicationVersion("1.0");
    app.setOrganizationName("mohsenCompany");
    app.setOrganizationDomain("qt.io");

    QQmlApplicationEngine engine;

    // get a handle to the DynamicFilesHelper singleton
    auto dynamicFilesHelper = engine.singletonInstance<DynamicFilesHelper *>("Moh3D", "DynamicFilesHelper");

    // Install the starter templates
    dynamicFilesHelper->installStarterTemplates();

    // get the qmlls build dir
    const auto buildDirUrl = dynamicFilesHelper->qmllsBuildDir().toLocalFile();
    // TODO: Get the previous value first and append to it instead of overwriting it
    qputenv("QMLLS_BUILD_DIRS", buildDirUrl.toUtf8());

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);
    engine.loadFromModule("Moh3D", "Main");

    return app.exec();
}
