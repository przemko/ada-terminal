all: colors cursor

colors: colors.adb terminal.ads terminal.adb
	gnatmake colors.adb

cursor: cursor.adb terminal.ads terminal.adb
	gnatmake cursor.adb

clean:
	rm -f colors cursor *.o *.ali *~

