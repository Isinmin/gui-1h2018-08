
#include "hangmangame.h"
#include <QFile>
#include <QDebug>
#include <QBuffer>
#include <QtConcurrent/QtConcurrentRun>

HangmanGame::HangmanGame(QObject *parent)
    : QObject(parent)
    , m_lock(QMutex::Recursive)
    , m_vowelsUnlocked(false)
{
    connect(this, &HangmanGame::vowelBought, this, &HangmanGame::registerLetterBought);

    QtConcurrent::run(this, &HangmanGame::initWordList);

    m_vowelsUnlocked = m_persistentSettings.value("Hangman/vowelsUnlocked", false).toBool();
    m_vowelsAvailable = m_persistentSettings.value("Hangman/vowelsAvailable", 0).toInt();
    m_wordsGiven = m_persistentSettings.value("Hangman/wordsGiven", 0).toInt();
    m_wordsGuessedCorrectly = m_persistentSettings.value("Hangman/wordsGuessedCorrectly", 0).toInt();
    m_score = m_persistentSettings.value("Hangman/score", 0).toInt();
}

void HangmanGame::reset()
{
    m_lettersOwned.clear();
    emit lettersOwnedChanged();
    emit errorCountChanged();
    chooseRandomWord();
}

void HangmanGame::reveal()
{
    m_lettersOwned += vowels() + consonants();
    emit errorCountChanged();
    emit lettersOwnedChanged();
}

void HangmanGame::gameOverReveal()
{
    m_lettersOwned += vowels() + consonants();
    emit lettersOwnedChanged();
}

void HangmanGame::requestLetter(const QString &letterString)
{
    Q_ASSERT(letterString.size() == 1);
    QChar letter = letterString.at(0);
    registerLetterBought(letter);
}

void HangmanGame::guessWord(const QString &word)
{
    if (word.compare(m_word, Qt::CaseInsensitive) == 0) {
        setVowelsAvailable(m_vowelsAvailable + calculateEarnedVowels());

        setScore(m_score + calculateEarnedPoints());
        m_lettersOwned += m_word.toUpper();
    } else {
        static int i=0;
        Q_ASSERT(i < 10);
        m_lettersOwned += QString::number(i++);
        emit errorCountChanged();
    }
    emit lettersOwnedChanged();
}

bool HangmanGame::isVowel(const QString &letter)
{
    Q_ASSERT(letter.size() == 1);
    QChar letterChar = letter.at(0);
    return vowels().contains(letterChar);
}

QString HangmanGame::vowels() const
{
    if(language == "ru")
    return QStringLiteral("ÓÅÛÀÎÝßÈÞ");
    if(language == "en")
        return QStringLiteral("EIYUOA");
}

QString HangmanGame::consonants() const
{
    if(language == "ru")
    return QStringLiteral("ÉÖÊÍÃØÙÇÕÔÂÏÐËÄÆ×ÑÌÒÁ");
    if(language == "en")
        return QStringLiteral("QWRTPSDFGHJKLZXCVBNM");
}

int HangmanGame::errorCount() const
{
    int count = 0;
    foreach (QChar c, m_lettersOwned) {
        if (!m_word.contains(c))
            ++count;
    }
    return count;
}

bool HangmanGame::vowelsUnlocked() const
{
    return m_vowelsUnlocked;
}

void HangmanGame::setVowelsUnlocked(bool vowelsUnlocked)
{
    if (m_vowelsUnlocked != vowelsUnlocked) {
        m_vowelsUnlocked = vowelsUnlocked;
        m_persistentSettings.setValue("Hangman/vowelsUnlocked", m_vowelsUnlocked);
        emit vowelsUnlockedChanged(m_vowelsUnlocked);
    }
}

int HangmanGame::vowelsAvailable() const
{
    return m_vowelsAvailable;
}

int HangmanGame::wordsGiven() const
{
    return m_wordsGiven;
}

int HangmanGame::wordsGuessedCorrectly() const
{
    return m_wordsGuessedCorrectly;
}

int HangmanGame::score() const
{
    return m_score;
}

void HangmanGame::setScore(int score)
{
    if (m_score != score) {
        m_score = score;
        m_persistentSettings.setValue("Hangman/score", m_score);
        emit scoreChanged(score);
    }
}

void HangmanGame::setWordsGiven(int count)
{
    if (m_wordsGiven != count) {
        m_wordsGiven = count;
        m_persistentSettings.setValue("Hangman/wordsGiven", m_wordsGiven);
        emit wordsGivenChanged(count);
    }
}

void HangmanGame::setWordsGuessedCorrectly(int count)
{
    if (m_wordsGuessedCorrectly != count) {
        m_wordsGuessedCorrectly = count;
        m_persistentSettings.setValue("Hangman/wordsGuessedCorrectly", m_wordsGuessedCorrectly);
        emit wordsGuessedCorrectlyChanged(count);
    }
}

void HangmanGame::setVowelsAvailable(int count)
{
    if (m_vowelsAvailable != count) {
        m_vowelsAvailable = count;
        m_persistentSettings.setValue("Hangman/vowelsAvailable", m_vowelsAvailable);
        emit vowelsAvailableChanged(count);
    }
}

void HangmanGame::registerLetterBought(const QChar &letter)
{
    if (m_lettersOwned.contains(letter))
        return;

    m_lettersOwned.append(letter);
    emit lettersOwnedChanged();

    if (!m_word.contains(letter))
        emit errorCountChanged();
}

void HangmanGame::chooseRandomWord()
{
    QMutexLocker locker(&m_lock);
        if (m_wordList.isEmpty())
            return;

        m_word = m_wordList.at(qrand() % m_wordList.size());
        emit wordChanged();
}

void HangmanGame::initWordList()
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

void HangmanGame::changeLanguage(const QString setLanguage)
{
    language = setLanguage;
    m_wordList.clear();
    QMutexLocker locker(&m_lock);
        qsrand(::time(0) + 1000);
        QFile file("");
        if(language == "ru"){
            qDebug() << language;
            file.setFileName(":/enable2.txt");
        }

        if(language == "en"){
            qDebug() << language;
            file.setFileName(":/lang_en.txt");
        }
        if (file.open(QIODevice::ReadOnly)) {
            QTextStream textStream(&file);
            textStream.setCodec("UTF-8");

            while (true) {
                QString line = textStream.readLine();
                if(line.isNull())
                    break;
                else
                {
                    m_wordList.append(line);
                    qDebug() << m_wordList;
                }
            }
        }
        qDebug() << !false;
        reset();
}


int HangmanGame::calculateEarnedVowels()
{
    int total = 0;
    for (int i = 0; i < m_word.length(); ++i) {
        if (isVowel(QString(m_word[i])) && !m_lettersOwned.contains(QString(m_word[i])))
            total++;
    }
    return total;
}

int HangmanGame::calculateEarnedPoints()
{
    int total = 0;
    for (int i = 0; i < m_word.length(); ++i) {
        if (consonants().contains(QString(m_word[i])) && !m_lettersOwned.contains(QString(m_word[i])))
            total++;
    }
    total += 8 - errorCount();
    return total;
}
