#include <qapplication.h>
#include "QtExample.h"

int main(int argc, char* argv[])
{
	QApplication application(argc, argv);
	QtExample qtExample;
	qtExample.show();
	return application.exec();
}
