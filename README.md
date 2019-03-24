# echo-meme

Print your message as a part of various Japanese internet memes.
メッセージを様々な日本のインターネットミームの一部に組み込んで出力するコマンドです。

```
$ echo-meme 山田
むしゃむしゃしていた。山田なら何でもよかった。

$ echo-meme 山田
見ろ！人が山田のようだ！
```

Tell us about your favorite memes ! ([see Usage](#usage))
あなたのお気に入りのミームを教えて下さい ! ([see Usage](#usage)).

## Installation

#### Linux

#### macOS

```
$ brew tap greymd/tools
$ brew install echo-meme
```

#### Manual installation

```
$ curl -OL https://git.io/echo-meme
$ sudo install -m 755 /usr/bin/echo-meme
```

## Usage

```
$ echo-meme --help
Usage:
  echo-meme [OPTIONS] MESSAGE

OPTIONS:
  --help       Display this help and exit
  --version    Output version information and exit
  -s           Read message from stdin
  -r           Send request to register new meme (see REGISTER MEME)

REGISTER MEME:
  '{}' is the placeholder of the message.
  For example,
    $ sudo echo-meme -r 'こんにちは{}、ありがとう{}'
  It displays the URL to send the pull-request to the echo-meme repository.
    https://github.com/greymd/echo-meme/issues/new...
```
