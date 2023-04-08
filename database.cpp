#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{
    dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
    if(!QFile(DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}

bool DataBase::restoreDataBase()
{
    // Если база данных открылась ...
    if(this->openDataBase()){
        // Производим восстановление базы данных
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Не удалось восстановить базу данных";
        return false;
    }
    return false;
}

bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(DATABASE_NAME);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

void DataBase::closeDataBase()
{
    db.close();
}

bool DataBase::createTable()
{
    QSqlQuery query;
    if(!query.exec("CREATE TABLE " TECHO " ("
                                                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                                TECHO_DNAME     " VARCHAR(255)    NOT NULL, "
                                                TECHO_DATEREP  " VARCHAR(255)    NOT NULL, "
                                                TECHO_DATECHNG     " VARCHAR(255)    NOT NULL"
                                            " );"
                    )){
        qDebug() << "DataBase: error of create";
        qDebug() << query.lastError().text();
        return false;
    }
    if(!query.exec("CREATE TABLE " SRAB " ("
                            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            SRAB_NAME     " VARCHAR(255)    NOT NULL, "
                            SRAB_SWITCH   " BOOLEAN    NOT NULL, "
                            SRAB_DATE     " VARCHAR(255)    NOT NULL, "
                            "Sender  VARCHAR(255)    NOT NULL"
                        " );"
                    )){
        qDebug() << "DataBase: error of create";
        qDebug() << query.lastError().text();
        return false;
    }
    if(!query.exec("CREATE TABLE " BREAKS " ("
                                                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                                BREAKS_BRID     " VARCHAR(255)    NOT NULL, "
                                                BREAKS_DATE     " VARCHAR(255)    NOT NULL"
                                            " );"
                    )){
        qDebug() << "DataBase: error of create";
        qDebug() << query.lastError().text();
        return false;
    }
    if(!query.exec("CREATE TABLE " MESSAGES " ("
                                                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                                MESSAGE_DATE  " VARCHAR(255)    NOT NULL, "
                                                MESSAGE_TEXT     " VARCHAR(999)    NOT NULL"
                                            " );"
                    )){
        qDebug() << "DataBase: error of create";
        qDebug() << query.lastError().text();
        return false;
    }
    return true;
}

bool DataBase::insertIntoTable(QString tableName, QString first, QString second, QString third, bool switching)
{
    QSqlQuery query;
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, INFINITE);

    if(tableName == MESSAGES){
    query.prepare("INSERT INTO " MESSAGES " ( " MESSAGE_DATE ", "
                                                MESSAGE_TEXT " ) "
                  "VALUES (:MDate, :MText)");
    query.bindValue(":MDate",       first);
    query.bindValue(":MText",      second);
    }
    else if(tableName == SRAB){
        query.prepare("INSERT INTO " SRAB " ( " SRAB_NAME ", "
                                                SRAB_SWITCH ", "
                                                SRAB_DATE ", "
                                                SRAB_SENDER ") "
                      "VALUES (:SName, :SSwitch, :SDate, 'user')");
        query.bindValue(":SName",      first);
        query.bindValue(":SSwitch",    switching);
        query.bindValue(":SDate",      second);
    }
    else if(tableName == TECHO){
        query.prepare("INSERT INTO " TECHO " ( " TECHO_DNAME ", "
                                                 TECHO_DATEREP ", "
                                                 TECHO_DATECHNG " ) "
                      "VALUES (:DName, :Drep, :Dchng)");
        query.bindValue(":DName",      first);
        query.bindValue(":Drep",       second);
        query.bindValue(":Dchng",      third);
    }
    else if(tableName == BREAKS){
        query.prepare("INSERT INTO " BREAKS " ( " BREAKS_BRID ", "
                                                  BREAKS_DATE " ) "
                      "VALUES (:BrID,:BrDate)");
        query.bindValue(":BrID",      first);
        query.bindValue(":BrDate",    second);
    }
    else {
        qDebug() << "Таблица с именем " << tableName << " не найдена";
        this->closeDataBase();
        ReleaseMutex(dbmutex);
        return false;
    }
    // После чего выполняется запросом методом exec()
    if(!query.exec())
    {
        qDebug() << "error insert into " << tableName;
        qDebug() << query.lastError().text();
    }
    Sleep(20);
    //ReleaseMutex(dbmutex);
    return true;
}

bool DataBase::getSwitchFromSrabTable(QString smachName)
{
    QSqlQuery query;
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, INFINITE);
    bool res = false;
    if(!query.exec("select " SRAB_SWITCH " from " SRAB " where id = (select max(id) from " SRAB " where " SRAB_NAME " = '" + smachName + "')"))
    {
        qDebug() << "error select from " << SRAB << " in " << smachName;
        qDebug() << query.lastError().text();
        qDebug() << query.lastQuery();
    }
    Sleep(20);
    query.first();
    res = query.value(0).toBool();
    //ReleaseMutex(dbmutex);
    qDebug() << "select " + smachName + " = " + query.value(0).toString();
    return res;
}

QString DataBase::getWaterLevel()
{
    QSqlQuery query;
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, INFINITE);
    query.prepare("select waterLevel from ResTable");
    if (!query.exec())
    {
        qDebug() << "error select from ResTable";
        qDebug() << query.lastError().text();
    }
    Sleep(20);
    query.first();
    //ReleaseMutex(dbmutex);
    qDebug() << "select from ResTable waterLevel = " + query.value(0).toString() + " mm";
    return query.value(0).toString() + " mm";
}

QString DataBase::getGasLevel()
{
    QSqlQuery query;
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, INFINITE);
    query.prepare("select gasLevel from ResTable");
    if(!query.exec())
    {
        qDebug() << "error select from ResTable";
        qDebug() << query.lastError().text();
    }
    Sleep(20);
    query.first();
    //ReleaseMutex(dbmutex);
    qDebug() << "select from ResTable gasLevel = " + query.value(0).toString() + " %";
    return query.value(0).toString() + " %";
}

QString DataBase::getTemperature()
{
    QSqlQuery query;
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, INFINITE);
    query.prepare("select temperLevel from ResTable");
    if(!query.exec())
    {
        qDebug() << "error select from ResTable";
        qDebug() << query.lastError().text();
    }
    Sleep(20);
    query.first();
    //ReleaseMutex(dbmutex);
    qDebug() << "select from ResTable temperLevel = " + query.value(0).toString() + " C";
    return query.value(0).toString() + " C";
}

void DataBase::lockMutex()
{
    dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    WaitForSingleObject(dbmutex, INFINITE);
    this->connectToDataBase();
}

void DataBase::unlockMutex()
{
    this->closeDataBase();
    ReleaseMutex(dbmutex);
}
