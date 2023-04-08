#ifndef LISTMODEL3_H
#define LISTMODEL3_H

#include <QObject>
#include <QSqlQueryModel>
#include <windows.h>

class ListModel3 : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdTechRole = Qt::UserRole + 1,
        detail,                      // Оборудование
        dtRep,                          // Срабатывание
        dtChng,                        // Дата
    };

    // объявляем конструктор класса
    explicit ListModel3(QObject *parent = 0);

    // Переопределяем метод, который будет возвращать данные
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
    HANDLE dbmutex;

signals:

public slots:
    void updateModel();
};

#endif // LISTMODEL3_H
