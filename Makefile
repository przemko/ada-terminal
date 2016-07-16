all: colors cursor test_form

colors: colors.adb terminal.ads terminal.adb
	gnatmake colors.adb

cursor: cursor.adb terminal.ads terminal.adb
	gnatmake cursor.adb

test_form: test_form.adb form.ads form.adb terminal.ads terminal.adb
	gnatmake test_form.adb

clean:
	rm -f colors cursor test_form *.o *.ali *~

