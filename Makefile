all: test_colors test_cursor test_form route66

test_colors: test_colors.adb terminal.ads terminal.adb
	gnatmake test_colors.adb

test_cursor: test_cursor.adb terminal.ads terminal.adb
	gnatmake test_cursor.adb

test_form: test_form.adb form.ads form.adb terminal.ads terminal.adb
	gnatmake test_form.adb

route66: route66.adb
	gnatmake route66.adb

clean:
	rm -f test_colors test_cursor test_form route66 *.o *.ali *~

