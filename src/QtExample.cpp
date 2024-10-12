#include <qaction.h>
#include <qmainwindow.h>
#include <qwidget.h>
#include "QtExample.h"
#include "ui_QtExample.h"

QtExample::QtExample(QWidget* parent)
	: QMainWindow(parent)
	, ui(new Ui::QtExample)
{
	ui->setupUi(this);
}

QtExample::~QtExample()
{
	delete ui;
	ui = nullptr;
}
