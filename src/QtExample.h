#ifndef QTEXAMPLE_H
#define QTEXAMPLE_H

#include <qmainwindow.h>
#include <qtmetamacros.h>
#include <qwidget.h>

namespace Ui {
	class QtExample;
}

class QtExample : public QMainWindow
{
	Q_OBJECT

public:
	explicit QtExample(QWidget* parent = nullptr);
	~QtExample();

private:
	Ui::QtExample* ui;
};

#endif // QTEXAMPLE_H
