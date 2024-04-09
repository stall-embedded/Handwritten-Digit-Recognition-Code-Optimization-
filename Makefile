CC=gcc
#CC=path of your cross compiler
CFLAGS=-Wall -g 

LIBS = -lm -lrt
LDFLAGS = ${LIBS}
OBJECTS = recognition_seq.o main.o

include C:/AndroXStudio/Tools/make_comm

all: seq

.PHONY: all seq clean

seq: recognition_seq

recognition_seq: $(OBJECTS)
	${CC} ${CFLAGS} $(EXEC_LDFLAGS) -save-temps -O2 -fPIE -pie -mfloat-abi=softfp -mfpu=neon -o \
	$@ $^ $(LLIB)/libgcc.a
	
	echo 
	echo "**** Install:" /data/local/tmp/recognition "****"
	$(ADB) push recognition_seq /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/recognition



clean:
	rm -f recognition_seq.o main.o recognition_seq
