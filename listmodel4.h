#ifndef LISTMODEL4_H
#define LISTMODEL4_H

#include <QObject>
#include <QSqlQueryModel>
#include <windows.h>

class ListModel4 : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdMessRole = Qt::UserRole + 1,
        messDate,                  // Дата
        mess,                      // Сообщение
    };

    // объявляем конструктор класса
    explicit ListModel4(QObject *parent = 0);

    // Переопределяем метод, который будет возвращать данные
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
    HANDLE dbmutex;

signals:

public slots:
    void updateModel();
};

#endif // LISTMODEL4_H
