#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QSqlQueryModel>
#include <windows.h>

class ListModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdSrabRole = Qt::UserRole + 1,
        mname,                      // Оборудование
        swOn,                          // Срабатывание
        swDt,                        // Дата
    };

    // объявляем конструктор класса
    explicit ListModel(QObject *parent = 0);

    // Переопределяем метод, который будет возвращать данные
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
    HANDLE dbmutex;

signals:

public slots:
    void updateModel();
};

#endif // LISTMODEL_H
