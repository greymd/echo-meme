ECHO-MEME 1 "MAR 2019" "User Commands" ""
=======================================
<!-- md2man-roff man.md > echo-meme.1 -->

NAME
----

echo-meme - Print your message as a part of various Japanese internet memes.

SYNOPSIS
--------

echo-meme [`OPTIONS`] *MESSAGE* ...

OPTIONS
-------

`--help`
  Display this help and exit

`--version`
  Output version information and exit

`-s`
  Read message from stdin

`-r`
  Send request to register new meme (see REGISTER MEME)

REGISTER MEME
------

`{}` is the placeholder of the message.

For example,
  $ `echo-meme` -r 'all your {} are belong to us'

It displays the URL to send a new issue to the echo-meme repository.

BUGS
------

Report bug from https://github.com/greymd/echo-meme/issues/new .

AUTHOR AND COPYRIGHT
------

Copyright (c) 2019 Yamada, Yasuhiro <greengregson@gmail.com> Released under the MIT License.
https://github.com/greymd/echo-meme
