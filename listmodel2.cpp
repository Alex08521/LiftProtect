#include "listmodel2.h"
#include "database.h"

ListModel2::ListModel2(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel2::data(const QModelIndex & index, int role) const {
    int columnId = role - IdBreaksRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel2::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdBreaksRole] = "idbreaks";
    roles[brID] = "brID";
    roles[brDt] = "brDt";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel2::updateModel()
{
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, 3000);
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT " BREAKS_BRID
                   ", " BREAKS_DATE
                   " FROM " BREAKS " order by id desc");
    //ReleaseMutex(dbmutex);
    Sleep(200);
}
