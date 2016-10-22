#ubuntu16.04 tasks.json c/c++ 后缀名匹配 库包含匹配bash脚本
#$1->${fileBasename} $2->${fileExtname}
#2016.10.21 by:coderbaby
grep -q "gtk/gtk.h" $1
tempgtk=$?
grep -q "GL/glut.h" $1
tempopengl=$?
if [ ".c" = $2 ]; then 
    grep -q "gtk/gtk.h" $1
    if [ 0 = $? ]; then
        echo "gcc -g -O2 -std=gnu11 $1 -o `basename $1 .c` -lm `pkg-config --cflags --libs gtk+-3.0`" &&
        gcc -g -O2 -std=gnu11 $1 -o `basename $1 .c` -lm `pkg-config --cflags --libs gtk+-3.0` &&
        gnome-terminal -x bash -c "./`basename $1 .c`;read -n1 -p '请按任意键继续. . .'"
    else
        echo "gcc -g -O2 -std=gnu11 -static $1 -o `basename $1 .c` -lm" &&
        gcc -g -O2 -std=gnu11 -static $1 -o `basename $1 .c` -lm &&
		gnome-terminal -x bash -c "./`basename $1 .c`;read -n1 -p '请按任意键继续. . .'"
    fi
fi
if [ ".cpp" = $2 ]; then
    if [ 0 = $tempgtk ]; then
        echo "g++ -g -O2 -std=gnu++14 $1 -o `basename $1 .cpp` `pkg-config --cflags --libs gtk+-3.0`" &&
        g++ -g -O2 -std=gnu++14 $1 -o `basename $1 .cpp` `pkg-config --cflags --libs gtk+-3.0` &&
		gnome-terminal -x bash -c "./`basename $1 .cpp`;read -n1 -p '请按任意键继续. . .'"
    elif [ 0 = $tempopengl ]; then
        echo "g++ -g -O2 -std=gnu++14 $1 -o `basename $1 .cpp` -lGL -lGLU -lglut" &&
		g++ -g -O2 -std=gnu++14 $1 -o `basename $1 .cpp` -lGL -lGLU -lglut &&
		./`basename $1 .cpp`
    else
		echo "g++ -g -O2 -std=gnu++14 -static $1 -o `basename $1 .cpp`" &&
        g++ -g -O2 -std=gnu++14 -static $1 -o `basename $1 .cpp` &&
		gnome-terminal -x bash -c "./`basename $1 .cpp`;read -n1 -p '请按任意键继续. . .'"	
    fi
fi
