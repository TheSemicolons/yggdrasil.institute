#
# Copyright (c) 2024 James Anderson <thesemicolons@protonmail.com>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

.POSIX:
.SUFFIXES:

VERSION   = 0.1

all: install

install: build
	openrsync -av --delete --exclude traffic_graphs/*.png --exclude traffic_graphs/*.png.gz public/ web0.mimas.dev:/home/www/htdocs/yggdrasil.institute

build:
	find public -type f -exec gzip -fk {} \;

clean:
	find public -type f -name "*.gz" -exec rm {} \;
