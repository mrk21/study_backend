MAKEFILE := $(word $(words $(MAKEFILE_LIST)), $(MAKEFILE_LIST))
ROOT := $(shell cd $(dir $(MAKEFILE)); pwd)
TMP_DIR := $(ROOT)/tmp
OPENRESTY_DIR := $(ROOT)/vendor/openresty
LUAROCKS := $(OPENRESTY_DIR)/luajit/bin/luarocks
OPENRESTY_VERSION := 1.7.10.1
LUAROCKS_VERSION := 2.0.12


.PHONY: all
all: openresty luarocks luamod carton

.PHONY: clean
clean:
	$(RM) -r $(TMP_DIR)/
	$(RM) -r $(ROOT)/t/srvroot

.PHONY: distclean
distclean: clean
	$(RM) -r $(OPENRESTY_DIR)/
	$(RM) -r $(ROOT)/local

.PHONY: openresty
openresty: $(TMP_DIR) $(OPENRESTY_DIR)

.PHONY: luarocks
luarocks: openresty $(LUAROCKS)

.PHONY: luamod
luamod: luarocks
	$(LUAROCKS) install lua-resty-template

.PHONY: carton
carton:
	carton install

.PHONY: test
test:
	carton exec prove

.PHONY: run
run: openresty $(TMP_DIR)/logs $(TMP_DIR)/upload $(TMP_DIR)/root $(TMP_DIR)/nginx.user.conf
	sudo $(OPENRESTY_DIR)/nginx/sbin/nginx -p $(TMP_DIR) -c root/nginx.conf


$(TMP_DIR):
	mkdir -p $@

$(TMP_DIR)/logs:
	mkdir -p $@

$(TMP_DIR)/upload:
	mkdir -p $@

$(TMP_DIR)/root:
	ln -sf $(ROOT) $@

$(TMP_DIR)/nginx.user.conf:
	echo "user $(shell id -un) $(shell id -gn);" > $(TMP_DIR)/nginx.user.conf

$(OPENRESTY_DIR):
	cd $(TMP_DIR); \
	wget http://openresty.org/download/ngx_openresty-${OPENRESTY_VERSION}.tar.gz; \
	tar xvf ngx_openresty-${OPENRESTY_VERSION}.tar.gz; \
	cd ngx_openresty-${OPENRESTY_VERSION}/; \
	./configure \
		--prefix=${OPENRESTY_DIR} \
		--with-luajit \
		--with-ld-opt='-L /usr/local/lib'; \
	$(MAKE); \
	$(MAKE) install

$(LUAROCKS):
	cd $(TMP_DIR); \
	wget http://keplerproject.github.io/luarocks/releases/luarocks-$(LUAROCKS_VERSION).tar.gz; \
	tar xvf luarocks-$(LUAROCKS_VERSION).tar.gz; \
	cd luarocks-$(LUAROCKS_VERSION)/; \
	./configure \
		--prefix=$(OPENRESTY_DIR)/luajit \
		--with-lua=$(OPENRESTY_DIR)/luajit/ \
		--lua-suffix=jit-2.1.0-alpha \
		--with-lua-include=$(OPENRESTY_DIR)/luajit/include/luajit-2.1; \
	$(MAKE); \
	$(MAKE) install
