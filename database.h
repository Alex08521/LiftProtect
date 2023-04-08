#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <windows.h>

/* Директивы имен таблицы, полей таблицы и базы данных */
#define DATABASE_NAME       "LiftProtect.db"

#define SRAB                   "SrabTable"           // Название таблицы
#define SRAB_NAME              "MachineName"         // Вторая колонка
#define SRAB_SWITCH            "SrabSwitch"          // Третья колонка
#define SRAB_DATE              "SrabDate"            // Четвертая колонка
#define SRAB_SENDER            "Sender"              // Пятая колонка

#define BREAKS                 "BreaksTable"         // Название таблицы
#define BREAKS_BRID            "BreakID"             // Вторая колонка
#define BREAKS_DATE            "BreakDate"           // Третья колонка

#define TECHO                  "TechServTable"       // Название таблицы
#define TECHO_DNAME            "DetailName"          // Вторая колонка
#define TECHO_DATEREP          "RepairDate"          // Третья колонка
#define TECHO_DATECHNG         "ChangeDate"          // Четвертая колонка

#define MESSAGES               "MessagesTable"       // Название таблицы
#define MESSAGE_DATE           "MessageDate"         // Вторая колонка
#define MESSAGE_TEXT           "MessageText"         // Третья колонка

// Первая колонка содержит Autoincrement ID

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void connectToDataBase();

private:
    QSqlDatabase    db;
    HANDLE dbmutex;

private:
    bool openDataBase();        // Открытие базы данных
    bool restoreDataBase();     // Восстановление базы данных
    void closeDataBase();       // Закрытие базы данных
    bool createTable();         // Создание базы таблицы в базе данных

//signals:

public slots:
    bool insertIntoTable(QString tableName, QString first, QString second, QString third, bool switching);      // Добавление записей в таблицу
    bool getSwitchFromSrabTable(QString machName);      // Получение значения сигнала из базы по наименованию агрегата
    QString getWaterLevel();   // Получение значения уровня воды из базы
    QString getGasLevel();     // Получение значения уровня газа из базы
    QString getTemperature();  // Получение значения температуры из базы
    void lockMutex(); //Захватить мутекс
    void unlockMutex(); // Отпустить мутекс
};

#endif // DATABASE_H
