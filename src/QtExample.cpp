#include <new>
#include <qmainwindow.h>
#include <qwidget.h>
#include "QtExample.h"
#include "ui_qtexample.h"

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
