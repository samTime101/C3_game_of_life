## Game Of Life Implemented in [C3](https://c3-lang.org/)

Structure
```
- c3c
- lib
- libraylib.a
- main.c3
- Makefile
- msvc_build_libraries.py
- raylib.c3 
```

### Compilation
```make
make:
	./c3c compile -l ./libraylib.a -o test main.c3 raylib.c3
clean:
	rm test
```
