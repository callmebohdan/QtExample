#include <qaction.h>
#include <qmainwindow.h>
#include <qwidget.h>
#include "QtExample.h"
#include "UI_QtExample.h"

QtExample::QtExample(QWidget* parent)
	: QMainWindow(parent)
	, ui(new Ui::QtExample)
{
	ui->setupUi(this);
	connect(ui->actionExit, &QAction::triggered, this, &QtExample::actionExit);
}

QtExample::~QtExample()
{
	delete ui;
	ui = nullptr;
}

void QtExample::actionExit()
{
	close();
}
