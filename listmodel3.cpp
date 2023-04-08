#include "listmodel3.h"
#include "database.h"

ListModel3::ListModel3(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel3::data(const QModelIndex & index, int role) const {
    int columnId = role - IdTechRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel3::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdTechRole] = "idtech";
    roles[detail] = "detail";
    roles[dtRep] = "dtRep";
    roles[dtChng] = "dtChng";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel3::updateModel()
{
    //dbmutex = CreateMutex(NULL, FALSE, L"dbmutex");
    //WaitForSingleObject(dbmutex, 3000);
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT " TECHO_DNAME
                   ", " TECHO_DATEREP ", " TECHO_DATECHNG
                   " FROM " TECHO " order by id desc");
    //ReleaseMutex(dbmutex);
    Sleep(200);
}
