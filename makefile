
DIST=dist
SRC=src

NPM_BIN=./node_modules/.bin

COFFEE=$(NPM_BIN)/coffee
LESSC=$(NPM_BIN)/lessc
BROWSERIFY=$(NPM_BIN)/browserify


target: dist_file
.PHONY: target

dist_file: $(DIST) license readme dist_lib dist_cp dist_coffee dist_less dist_browserify
.PHONY: dist_file

$(DIST):
	mkdir -p $(DIST)



license: $(DIST)/LICENSE
readme: $(DIST)/README.md
.PHONY: license readme

$(DIST)/LICENSE: ./LICENSE
	cp ./LICENSE $(DIST)
$(DIST)/README.md: ./README.md
	cp ./README.md $(DIST)


dist_lib:
	cp -ruL $(SRC)/lib $(DIST)
.PHONY: dist_lib

dist_cp: dist_manifest
	cp -ru $(SRC)/img $(DIST)
	cp -ru $(SRC)/page $(DIST)
	cp -ru $(SRC)/async_lib $(DIST)
.PHONY: dist_cp


dist_manifest: $(DIST)/manifest.json
.PHONY: dist_manifest

$(DIST)/manifest.json: $(SRC)/manifest.json
	cp $(SRC)/manifest.json $(DIST)


dist_coffee:
	$(COFFEE) -c -m --output $(DIST)/s $(SRC)/s
.PHONY: dist_coffee


dist_less:
	# TODO dist_less
.PHONY: dist_less


dist_browserify: dist_coffee
	mkdir -p $(DIST)/js
	
	$(BROWSERIFY) -o $(DIST)/js/background.js -d -s pv_background $(DIST)/s/background.js
	$(BROWSERIFY) -o $(DIST)/js/content.js -d -s pv_content $(DIST)/s/content.js
	$(BROWSERIFY) -o $(DIST)/js/dl.js -d -s pv_dl $(DIST)/s/dl.js
	$(BROWSERIFY) -o $(DIST)/js/popup.js -d -s pv_popup $(DIST)/s/popup.js
	$(BROWSERIFY) -o $(DIST)/js/option.js -d -s pv_option $(DIST)/s/option.js
.PHONY: dist_browserify


