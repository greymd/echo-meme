all: packages

echo-meme.tar.gz: .tar2package.yml
	tar zcvf echo-meme.tar.gz bin man .tar2package.yml

packages: echo-meme.tar.gz
	cat echo-meme.tar.gz | docker run -i greymd/tar2rpm > ./pkg/echo-meme.rpm
	cat echo-meme.tar.gz | docker run -i greymd/tar2deb > ./pkg/echo-meme.deb

clean:
	rm -f echo-meme.tar.gz

.PHONY: clean all echo-meme.tar.gz packages
