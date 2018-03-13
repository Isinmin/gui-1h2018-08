#include "data.h"
#include <QFile>
#include <QDebug>
#include <time.h>
#include <QBuffer>
#include <QtConcurrent/QtConcurrentRun>

Data *Data::m_instance = 0;


void Data::initWordList()
{
    QMutexLocker locker(&m_lock);
    qsrand(::time(0) + 1000);

    //Чтение из файла
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


void Data::chooseRandomWord()
{
    QMutexLocker locker(&m_lock);
    if (m_wordList.isEmpty())
        return;

    m_word = m_wordList.at(qrand() % m_wordList.size());
}


QString Data::vowels() const
{
    return QStringLiteral("УЕЫОЭЯИЮ");
}


QString Data::consonants() const
{
    return QStringLiteral("ЙЦКНГШЩЗХФВПРЛДЖЧСМТБ");
}


int Data::errorCount() const
{
    int count = 0;
    foreach (QChar c, m_lettersOwned) {
        if (!m_word.contains(c))
            ++count;
    }
    return count;
}


