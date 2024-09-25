/********************************************************************************
** Form generated from reading UI file 'QtExample.ui'
**
** Created by: Qt User Interface Compiler version 6.7.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_QTEXAMPLE_H
#define UI_QTEXAMPLE_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_QtExample
{
public:
    QAction *actionExit;
    QWidget *centralWidget;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QLabel *textLabel;

    void setupUi(QMainWindow *QtExample)
    {
        if (QtExample->objectName().isEmpty())
            QtExample->setObjectName("QtExample");
        QtExample->setEnabled(true);
        QtExample->resize(649, 101);
        QtExample->setWindowTitle(QString::fromUtf8("QtExample"));
        QtExample->setToolButtonStyle(Qt::ToolButtonStyle::ToolButtonTextOnly);
        QtExample->setAnimated(true);
        QtExample->setDocumentMode(false);
        QtExample->setUnifiedTitleAndToolBarOnMac(false);
        actionExit = new QAction(QtExample);
        actionExit->setObjectName("actionExit");
        QIcon icon(QIcon::fromTheme(QIcon::ThemeIcon::ApplicationExit));
        actionExit->setIcon(icon);
        actionExit->setMenuRole(QAction::MenuRole::QuitRole);
        centralWidget = new QWidget(QtExample);
        centralWidget->setObjectName("centralWidget");
        verticalLayoutWidget = new QWidget(centralWidget);
        verticalLayoutWidget->setObjectName("verticalLayoutWidget");
        verticalLayoutWidget->setGeometry(QRect(10, 10, 629, 81));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        textLabel = new QLabel(verticalLayoutWidget);
        textLabel->setObjectName("textLabel");
        QFont font;
        font.setPointSize(30);
        textLabel->setFont(font);

        verticalLayout->addWidget(textLabel);

        QtExample->setCentralWidget(centralWidget);

        retranslateUi(QtExample);

        QMetaObject::connectSlotsByName(QtExample);
    } // setupUi

    void retranslateUi(QMainWindow *QtExample)
    {
        actionExit->setText(QCoreApplication::translate("QtExample", "Exit", nullptr));
        textLabel->setText(QCoreApplication::translate("QtExample", "Welcome to the QtExample project!", nullptr));
        (void)QtExample;
    } // retranslateUi

};

namespace Ui {
    class QtExample: public Ui_QtExample {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_QTEXAMPLE_H
