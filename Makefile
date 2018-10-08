PLUGINS	= $(wildcard check_*) $(wildcard notify_*)
CWD		= $(shell pwd)
NAGIOS	= "/usr/lib64/nagios/plugins/"

.PHONY: install
install: $(PLUGINS)
	@( \
		for plugin in $(PLUGINS); do \
			ln -sf "$(CWD)/$$plugin" "$(NAGIOS)"; \
		done; \
	);

.PHONY: uninstall
uninstall: $(PLUGINS)
	@( \
		for plugin in $(PLUGINS); do \
			rm -f "$(NAGIOS)/$$plugin"; \
		done; \
	);

.PHONY: update
update:
	@git pull
