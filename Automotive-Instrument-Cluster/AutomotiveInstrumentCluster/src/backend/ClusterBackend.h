#ifndef CLUSTERBACKEND_H
#define CLUSTERBACKEND_H

#include <QObject>
#include <QString>

class ClusterBackend : public QObject {
    Q_OBJECT
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int fuel READ fuel WRITE setFuel NOTIFY fuelChanged)
    Q_PROPERTY(QString gear READ gear WRITE setGear NOTIFY gearChanged)

public:
    explicit ClusterBackend(QObject *parent = nullptr) : QObject(parent) {}

    int speed() const { return m_speed; }
    void setSpeed(int v) {
        if (m_speed == v) return;
        m_speed = v;
        emit speedChanged();
    }

    int fuel() const { return m_fuel; }
    void setFuel(int v) {
        v = std::clamp(v, 0, 100);
        if (m_fuel == v) return;
        m_fuel = v;
        emit fuelChanged();
    }

    QString gear() const { return m_gear; }
    void setGear(const QString &g) {
        if (m_gear == g) return;
        m_gear = g;
        emit gearChanged();
    }

signals:
    void speedChanged();
    void fuelChanged();
    void gearChanged();

private:
    int m_speed = 0;
    int m_fuel = 100;
    QString m_gear = "P";
};


#endif // CLUSTERBACKEND_H
