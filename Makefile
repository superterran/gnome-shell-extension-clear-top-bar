.PHONY: help

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: $(wildcard src/*) ## creates a release suitable for extensions.gnome.org
	mkdir -p build/
	cd src/ && zip -r ../build/clear-top-bar@superterran.net.zip .
clean: ## wipes build directory
	rm -rf build/
install: ## symlinks extension in place, login with xorg and use ALT+F2 then `r` to dev
	gnome-extensions uninstall clear-top-bar@superterran.net || true
	rm -r ~/.local/share/gnome-shell/extensions/clear-top-bar@superterran.net
	ln -s $(pwd)src ~/.local/share/gnome-shell/extensions/clear-top-bar@superterran.net
enable:	## convenience to enable extension, probably will need to once installed and re-logged in
	gnome-extensions enable clear-top-bar@superterran.net 
disable: ## disable extension
	gnome-extensions disable clear-top-bar@superterran.net 
