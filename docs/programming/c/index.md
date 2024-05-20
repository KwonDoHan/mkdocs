# C Language

## 라이브러리 파일 생성

### 정적(static) 라이브러리 파일

1. 라이브러리로 쓸 함수가 포함된 파일 만들기
```c
// file1.c
#include <stdio.h>

void test1() {
    printf("TEST 1\n");
}

void test2() {
    printf("TEST 2\n");
}
```
```c
// file2.c
#include <stdio.h>

void test3() {
    printf("TEST 3\n");
}
```

2. 컴파일해서 오브젝트 파일 만들기<br/>아래 명령어로 소스파일을 컴파일하면 `file1.o`, `file2.o` 파일이 생성된다.
```shell
$ gcc -c file1.c file2.c
```

3. 두 개의 오브젝트 파일을 하나의 라이브러리로 합치기<br />결과물로 `libmylib.a` 파일이 생성된다.
```shell
$ ar rscv libmylib.a file1.o file2.o
a - file1.o
a - file2.o
```

4. 라이브러리를 사용할 메인 프로그램 작성
```c
// mylib.h
extern void test1();
extern void test2();

extern void test3();
```
```c
// main.c
#include <stdio.h>
#include "mylib.h"

int main() {
    test1();
    test2();
    test3();

    return 0;
}
```

5. 라이브러리를 포함해서 컴파일
```sh
$ gcc -o main main.c -L./ -lmylib
```

### 공유(shared) 라이브러리 파일

1. 라이브러로 사용할 함수 파일과 메인 프로그램 작성
```
// foo.h
#ifndef foo_h__
#define foo_h__

extern void foo(void);

#endif // foo_h__
```
```
// foo.c
#include <stdio.h>

void foo(void)
{
    puts("Hello, I am a shared library");
}
```
```
// main.c
#include <stdio.h>
#include "foo.h"

int main(void)
{
    puts("This is a shared library test...");
    foo();
    return 0;
}
```

2. Position-independent code (PIC) 만들기
```sh
$ gcc -c -Wall -Werror -fpic foo.c
```

3. 오브젝트 파일로부터 공유 라이브러리 만들기
```sh
$ gcc -shared -o libfoo.so foo.o
```

4. 공유 라이브러리 연결하기
```sh
$ gcc -Wall -o c-ex02-shared main.c -L./ -lfoo
```

5. 런타임(runtime)에서 라이브러리 사용하기
    - `LD_LIBRARY_PATH` 환경변수 사용하기
    - `rpath` 사용하기
    - `ldconfig` 사용하기

#### 참조

- [Shared libraries with GCC on Linux](https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html)

