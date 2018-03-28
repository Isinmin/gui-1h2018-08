#include "data.h"
#include <QFile>
#include <QDebug>
#include <time.h>
#include <QBuffer>
#include <QtConcurrent/QtConcurrentRun>
//#include "QSqlQuery"
Data *Data::m_instance = 0;

Data::Data(QObject *parent)
    : QObject(parent)
    , m_lock(QMutex::Recursive)
{
    m_instance = this;
    qsrand(::time(0));

    QtConcurrent::run(this, &Data::initWordList);
}
void Data::initDb(){

}

void Data::initWordList()
{
    QMutexLocker locker(&m_lock);
    qsrand(::time(0) + 1000);
    QFile file(":/enable2.txt");
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream textStream(&file);
        textStream.setCodec("UTF-8");
        while (true) {
            QString line = textStream.readLine();
            if(line.isNull())
                break;
            else
                m_wordList.append(line);
        }
    }
    chooseRandomWord();
}

void Data::reset()
{
    m_lettersOwned.clear();
    emit lettersOwnedChanged();
    emit errorCountChanged();
    chooseRandomWord();
}

void Data::chooseRandomWord()
{
    QMutexLocker locker(&m_lock);
    if (m_wordList.isEmpty())
        return;

    m_word = m_wordList.at(qrand() % m_wordList.size());
    emit wordChanged();
}

QString Data::vowels() const
{
    return QStringLiteral("УЕЫАОЭЯИЮ");
}

QString Data::consonants() const
{
    return QStringLiteral("ЙЦКНГШЩЗХЪФВПРЛДЖЧСМТБ");
}

<<<<<<< HEAD
void Data::reveal()
{
    m_lettersOwned += vowels() + consonants();
    emit lettersOwnedChanged();
    emit errorCountChanged();
}

void Data::guessWord(const QString &word)
{
    if (word.compare(m_word, Qt::CaseInsensitive) == 0) {
        m_lettersOwned += m_word.toUpper();
    } else {
        // Small hack to get an additional penalty for guessing wrong
        static int i=0;
        Q_ASSERT(i < 10);
        m_lettersOwned += QString::number(i++);
        emit errorCountChanged();
    }
    emit lettersOwnedChanged();
}
=======
int Data::errorCount() const
{
    int count = 0;
    foreach (QChar c, m_lettersOwned) {
        if (!m_word.contains(c))
            ++count;
    }
    return count;
}

void Data::gameOverReveal()
{
    m_lettersOwned += vowels() + consonants();
    emit lettersOwnedChanged();
}


>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15

int Data::errorCount() const
{
    int count = 0;
    foreach (QChar c, m_lettersOwned) {
        if (!m_word.contains(c))
            ++count;
    }
    return count;
}

void Data::gameOverReveal()
{
    m_lettersOwned += vowels() + consonants();
    emit lettersOwnedChanged();
}


void Data::requestLetter(const QString &letterString)
{
    Q_ASSERT(letterString.size() == 1);
    QChar letter = letterString.at(0);
        registerLetterBought(letter);
}

void Data::registerLetterBought(const QChar &letter)
{
    if (m_lettersOwned.contains(letter))
        return;

    m_lettersOwned.append(letter);
    emit lettersOwnedChanged();

    if (!m_word.contains(letter))
        emit errorCountChanged();
}


