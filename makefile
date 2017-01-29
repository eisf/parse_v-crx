
DIST=dist
SRC=src

NPM_BIN=./node_modules/.bin

COFFEE=$(NPM_BIN)/coffee
LESSC=$(NPM_BIN)/lessc


target: dist
.PHONY: target

dist: license readme dist_lib dist_cp dist_coffee dist_less
.PHONY: dist


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

# TODO bundle with browserify


dist_less:
	# TODO dist_less
.PHONY: dist_less


