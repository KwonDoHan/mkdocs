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

