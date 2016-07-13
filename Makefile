all: colors

colors: colors.adb terminal.ads terminal.adb
	gnatmake colors.adb

clean:
	rm -f colors *.o *.ali *~

