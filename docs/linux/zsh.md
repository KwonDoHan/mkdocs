# Ubuntu에 zsh(oh-my-zsh) 설치

## 현재 쉘^Shell^ 확인 및 zsh 설치

```{.sh .no-copy}
$ echo $SHELL
/bin/bash
```

기본 Ubuntu에서 변경한 것이 없다면 결과는 `/bin/bash`로 나올 것이다.

### zsh 설치

설치에 필요한 `wget`, `curl`, `git`을 먼저 설치한다.

```sh
sudo apt install wget cur git
```

다음으로 `zsh`을 설치한다.

```sh
sudo apt install zsh
```

### 기본 쉘^Shell^ 변경

현재 사용자의 기본 쉘을 변경하기 위해서 아래 명령어를 입력한다.
변경하기 전에 사용자 확인을 위해 비밀번호를 한 번 물어본다.

```sh
chsh -s $(which zsh)
```

정상적으로 명령어와 비밀번호를 입력하고 나면 다음 로그인에서 아래와 같은 메시지를 확인할 수 있다.

```{.sh .no-copy}
This is the Z Shell configuration function for new users,
zsh-newuser-install.
You are seeing this message because you have no zsh startup files
(the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
~).  This function can help you with a few settings that should
make your use of the shell easier.

You can:

(q)  Quit and do nothing.  The function will be run again next time.

(0)  Exit, creating the file ~/.zshrc containing just a comment.
     That will prevent this function being run again.

(1)  Continue to the main menu.

(2)  Populate your ~/.zshrc with the configuration recommended
     by the system administrator and exit (you will need to edit
     the file by hand, if so desired).

--- Type one of the keys in parentheses ---
```

여기에서 2번을 선택하고, 현재 쉘을 확인해 보면 `zsh`로 변경된 것을 알 수 있다.

```{.sh .no-copy}
$ echo $SHELL
/usr/bin/zsh
```

## Oh My Zsh 설치

앞서 먼저 설치한 프로그램으로 `wget`과 `curl`이 있으므로 아래 두 명령어 중에 하나만 실행해서 Oh My Zsh을 설치한다.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

```sh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

설치가 완료되면 아래와 같은 화면을 볼 수 있다.

```{.sh .no-copy}
Looking for an existing zsh config...
Found /home/dohan/.zshrc. Backing up to /home/dohan/.zshrc.pre-oh-my-zsh
Using the Oh My Zsh template file and adding it to /home/dohan/.zshrc.

         __                                     __
  ____  / /_     ____ ___  __  __   ____  _____/ /_
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                        /____/                       ....is now installed!


Before you scream Oh My Zsh! look over the `.zshrc` file to select plugins, themes, and options.

• Follow us on Twitter: https://twitter.com/ohmyzsh
• Join our Discord community: https://discord.gg/ohmyzsh
• Get stickers, t-shirts, coffee mugs and more: https://shop.planetargon.com/collections/oh-my-zsh

➜  ~
```

## Oh My Zsh 설정

Zsh 설정파일은 `$HOME/.zshrc` 파일이고, On-My-Zsh 설정 파일은 `$HOME/.oh-my-zsh/` 디렉토리에 있다.

### `ZSH_THEME` 설정

테마 설정을 바꾸기 위해서 `$HOME/.zshrc` 파일을 열고, `ZSH_THEME` 값을 변경한다.
많이 사용하는 테마인 `agnoster`로 변경한 후 파일을 저장한다.

### 플러그인 설정

많이 사용하는 플러그인은 zsh-syntax-highlighting, zsh-autosuggestions, fzf 등이 있다.

다시 `$HOME/.zshrc` 파일을 열고, `plugins` 설정을 찾아서 아래와 같이 변경한 후 저장한다.

```zsh
plugins=(git sudo colored-man-pages zsh-syntax-highlighting zsh-autosuggestions fzf)
```

사용자 로그인을 다시 하거나, 현재 설정된 쉘 환경변수를 다시 설정하면 아래와 같은 오류 메시지를 확인할 수 있다.

```{.sh .no-copy}
$ source ~/.zshrc
[oh-my-zsh] plugin 'zsh-syntax-highlighting' not found
[oh-my-zsh] plugin 'zsh-autosuggestions' not found
[oh-my-zsh] fzf plugin: Cannot find fzf installation directory.
Please add `export FZF_BASE=/path/to/fzf/install/dir` to your .zshrc
```

플러그인이 설치되어 있지 않기 때문에 당연히 나오는 오류이다.
해당 플러그인을 추가로 설치한다.

- zsh-syntax-highlighting
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- zsh-autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- fzf (Fuzzy Finder )
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
```{.sh .no-copy}
$ ~/.fzf/install
Downloading bin/fzf ...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 1515k  100 1515k    0     0  1019k      0  0:00:01  0:00:01 --:--:-- 1619k
  - Checking fzf executable ... 0.53.0
Do you want to enable fuzzy auto-completion? ([y]/n)
Do you want to enable key bindings? ([y]/n)

Generate /home/dohan/.fzf.bash ... OK
Generate /home/dohan/.fzf.zsh ... OK

Do you want to update your shell configuration files? ([y]/n)

Update /home/dohan/.bashrc:
  - [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    + Added

Update /home/dohan/.zshrc:
  - [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    + Added

Finished. Restart your shell or reload config file.
   source ~/.bashrc  # bash
   source ~/.zshrc   # zsh

Use uninstall script to remove fzf.

For more information, see: https://github.com/junegunn/fzf
$
```

위와 같이 플러그인을 설치했으면 다시 사용자 로그인을 하거나 적용을 위해 위와 동일한 명령어를 다시 실행한다.

```{.sh .no-copy}
$ source ~/.zshrc
```

이번에는 별다른 오류 메시지 없이 설치된 플러그인이 제대로 동작하는 것을 알 수 있다.

## REFERENCE

- [Ubuntu에 Oh My Zsh 설치](https://log4cat.tistory.com/7)
