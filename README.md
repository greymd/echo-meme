# echo-meme

Print your message as a part of various Japanese internet memes.

メッセージを様々な流行りのフレーズ、インターネットミームの一部に組み込んで出力するコマンドです。

```
$ echo-meme 山田
むしゃむしゃしていた。山田なら何でもよかった。

$ echo-meme 山田
見ろ！人が山田のようだ！
```

Tell us about your favorite memes ! ([Send request](https://github.com/greymd/echo-meme/issues/new?body=%74%65%6D%70%6C%61%74%65%3A%5B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E6%96%87%E7%AB%A0%7B%7D%E3%80%82%7B%7D%E3%81%A8%E3%81%84%E3%81%86%E5%80%8B%E6%89%80%E3%81%8C%E5%BC%95%E6%95%B0%E3%81%AB%E3%81%AA%E3%82%8A%E3%81%BE%E3%81%99%E3%80%82%E3%80%80%5D&title=%6E%65%77%5F%6D%65%6D%65%5F%72%65%71%75%65%73%74%3A%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E6%96%87%E7%AB%A0%7B%7D%E3%80%82%7B%2E%2E%2E))

あなたのお気に入りのミームを教えて下さい ! ([Send request](https://github.com/greymd/echo-meme/issues/new?body=%74%65%6D%70%6C%61%74%65%3A%5B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E6%96%87%E7%AB%A0%7B%7D%E3%80%82%7B%7D%E3%81%A8%E3%81%84%E3%81%86%E5%80%8B%E6%89%80%E3%81%8C%E5%BC%95%E6%95%B0%E3%81%AB%E3%81%AA%E3%82%8A%E3%81%BE%E3%81%99%E3%80%82%E3%80%80%5D&title=%6E%65%77%5F%6D%65%6D%65%5F%72%65%71%75%65%73%74%3A%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E6%96%87%E7%AB%A0%7B%7D%E3%80%82%7B%2E%2E%2E)).

## Installation

<!--
### Linux

#### RHEL compatible distros

#### Debian base distros
-->

### macOS

```
$ brew tap greymd/tools
$ brew install echo-meme
```

### Manual installation

```
$ wget https://git.io/echo-meme
(or $ curl -OL https://git.io/echo-meme )
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
    $ echo-meme -r 'こんにちは{}、ありがとう{}'
  It displays the URL to send the pull-request to the echo-meme repository.
    https://github.com/greymd/echo-meme/issues/new...
```
