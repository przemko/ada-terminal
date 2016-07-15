all: colors cursor inter

colors: colors.adb terminal.ads terminal.adb
	gnatmake colors.adb

cursor: cursor.adb terminal.ads terminal.adb
	gnatmake cursor.adb

inter: inter.adb form.ads form.ads terminal.ads terminal.adb
	gnatmake inter.adb

clean:
	rm -f colors cursor inter *.o *.ali *~

