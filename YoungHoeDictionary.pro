QT += quick  widgets xml  network
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
RC_FILE += res.rc

SOURCES += \
        collect.cpp \
        getbookword.cpp \
        getinfo.cpp \
        learncore.cpp \
        main.cpp \
        searchword.cpp \
        teachcore.cpp \
        word.cpp \
        wordbooks.cpp \
        wordfilesystem.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    collect.h \
    getbookword.h \
    getinfo.h \
    learncore.h \
    searchword.h \
    teachcore.h \
    word.h \
    wordbooks.h \
    wordfilesystem.h
