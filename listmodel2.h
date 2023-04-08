#ifndef LISTMODEL2_H
#define LISTMODEL2_H

#include <QObject>
#include <QSqlQueryModel>
#include <windows.h>

class ListModel2 : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdBreaksRole = Qt::UserRole + 1,
        brID,                      // Оборудование
        brDt,                        // Дата
    };

    // объявляем конструктор класса
    explicit ListModel2(QObject *parent = 0);

    // Переопределяем метод, который будет возвращать данные
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
    HANDLE dbmutex;

signals:

public slots:
    void updateModel();
};

#endif // LISTMODEL2_H
