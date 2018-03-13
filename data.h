#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QStringList>
#include <QMutex>

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString word READ word NOTIFY wordChanged)
    Q_PROPERTY(QString lettersOwned READ lettersOwned NOTIFY lettersOwnedChanged)
    Q_PROPERTY(QString vowels READ vowels CONSTANT)
    Q_PROPERTY(QString consonants READ consonants CONSTANT)
    Q_PROPERTY(int errorCount READ errorCount NOTIFY errorCountChanged)
public:
    explicit Data(QObject *parent = 0);

   

    QString word() const { return m_word; }
    QString lettersOwned() const { return m_lettersOwned; }
    QString vowels() const;
    QString consonants() const;
    int errorCount() const;

    static Data *instance() { return m_instance; }

signals:
    void wordChanged();
    void lettersOwnedChanged();
    void errorCountChanged();
    void vowelBought(const QChar &vowel);

private slots:
    void registerLetterBought(const QChar &letter);

private:
    QString m_word;
    QString m_lettersOwned;
    QStringList m_wordList;
    static Data *m_instance;
    QMutex m_lock;
};

#endif // DATA_H
