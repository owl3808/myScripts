install:
	mkdir -p ~/bin
	find -maxdepth 1 -type f -executable | xargs -I {} ln -sf $(PWD)/{} ~/bin/
uninstall:
	find -maxdepth 1 -type f -executable | xargs -I {} rm ~/bin/{}
