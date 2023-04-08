#include "listmodel.h"
#include "database.h"

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel::data(const QModelIndex & index, int role) const {
    int columnId = role - IdSrabRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdSrabRole] = "idsrab";
    roles[mname] = "mname";
    roles[swOn] = "swOn";
    roles[swDt] = "swDt";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel::updateModel()
{
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, 3000);
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT " SRAB_NAME
                   ", case when " SRAB_SWITCH " = false then 'Выключено' when " SRAB_SWITCH " = true then 'Включено' end, " SRAB_DATE
                   " FROM " SRAB " order by id desc");
    //ReleaseMutex(dbmutex);
    Sleep(200);
}

