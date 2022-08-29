#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include<QCoreApplication>
#include <QQmlApplicationEngine>
#include"wordbooks.h"
#include<QApplication>
#include "searchword.h"
#include"getbookword.h"
#include"getinfo.h"
#include"collect.h"
#include"QIcon"
#include"teachcore.h"
#include"learncore.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ///
    ///s
    ///


    qmlRegisterType<Collect>("Collect",1,0,"CollectCore");  //收藏模块
    qmlRegisterType<GetInfo>("GetInfo",1,0,"InfoCore");  //软件信息模块
    qmlRegisterType<SearchWord>("Searchword",1,0,"SearchCore");      //单词查找模块
    qmlRegisterType<WordBooks>("WordBooks",1,0,"BookCore");          //单词书模块
    qmlRegisterType<GetBookWord>("WordBooks",1,0,"BookWordList");    //单词书模块（写的太乱，暂时想不起来这个是干嘛的了。）

    //0.7功能
    qmlRegisterType<TeachCore>("Teach",1,0,"TeachCore");  //阅读模块
    qmlRegisterType<LearnCore>("Learn",1,0,"LearnCore");    //学习模块

    qDebug()<<QSslSocket::sslLibraryBuildVersionString();



    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
