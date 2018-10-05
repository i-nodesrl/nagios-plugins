plugins = $(wildcard check_*)

.PHONY: install
install: $(plugins)
	@ln -sf $$(pwd)/$(plugins) /usr/lib64/nagios/plugins/

.PHONY: uninstall
uninstall: $(plugins)
	@rm -f /usr/lib64/nagios/plugins/$(plugins)

.PHONY: update
update:
	@git pull
