#include "listmodel4.h"
#include "database.h"

ListModel4::ListModel4(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel4::data(const QModelIndex & index, int role) const {
    int columnId = role - IdMessRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel4::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdMessRole] = "idmess";
    roles[messDate] = "messDate";
    roles[mess] = "mess";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel4::updateModel()
{
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, 3000);
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT " MESSAGE_DATE
                   ", " MESSAGE_TEXT
                   " FROM " MESSAGES " order by id desc");
    //ReleaseMutex(dbmutex);
    Sleep(200);
}
