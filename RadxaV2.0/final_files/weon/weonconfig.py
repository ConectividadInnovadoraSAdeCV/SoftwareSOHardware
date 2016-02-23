from os import system
import curses

screen = curses.initscr()

screen.border(0)
screen.addstr(12, 25, "Python curses in action!")
screen.refresh()
curses.noecho()
while True:
	x = screen.getch()
#	out = system("ls")
	if x == 49:
		screen.addstr(12, 15, str(x))
		screen.refresh()
		#screen.clear()

#curses.endwin()
		
