# GoLand IDE

JetBrains 도구에 대한 라이선스를 얻을 수 있었다. 그래서 Golang 개발환경으로 Visual Studio Code 대신 Goland를 사용해 볼 계획이다.

## WSL 연동

## Docker

```go linenums="1"
package main

import (
    "fmt"
    "log"
    "net/http"
    "os"
    "runtime"
)

func homeHandler(w http.ResponseWriter, r *http.Request) {
    myOS, myArch := runtime.GOOS, runtime.GOARCH
    inContainer := "inside"
    if _, err := os.Lstat("/.dockerenv"); err != nil && os.IsNotExist(err) {
        inContainer = "outside"
    }

    w.Header().Set("Content-Type", "text/plain")
    w.WriteHeader(http.StatusOK)

    _, _ = fmt.Fprintf(w, "Hello, %s!\n", r.UserAgent())
    _, _ = fmt.Fprintf(w, "I'm running on %s/%s.\n", myOS, myArch)
    _, _ = fmt.Fprintf(w, "I'm running %s of a container.\n", inContainer)
}

func main() {
    http.HandleFunc("/", homeHandler)

    err := http.ListenAndServe(":38000", nil)
    if err != nil {
        log.Fatalln(err)
    }
}
```

## REFERENCE

- [How to use Docker to compile and run Go code from GoLand](https://blog.jetbrains.com/go/2021/04/30/how-to-use-docker-to-compile-go-from-goland/)