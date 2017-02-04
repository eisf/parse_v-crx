
MXMLC=./tmp/apache-flex-sdk/bin/mxmlc

SRC=src
DIST=dist


target: $(DIST) cmd5 ckey54
.PHONY: target

$(DIST):
	mkdir -p $(DIST)

# cmd5
cmd5: $(DIST)/test_cmd5.html
	$(MXMLC) $(SRC)/cmd5_main.as -output $(DIST)/cmd5_main.swf
.PHONY: cmd5

$(DIST)/test_cmd5.html: $(SRC)/test/cmd5.html
	cp $(SRC)/test/cmd5.html $(DIST)/test_cmd5.html

# ckey54
ckey54: $(DIST) $(DIST)/test_ckey54.html
	$(MXMLC) $(SRC)/ckey54_main.as -output $(DIST)/ckey54_main.swf
.PHONY: ckey54

$(DIST)/test_ckey54.html: $(SRC)/test/ckey54.html
	cp $(SRC)/test/ckey54.html $(DIST)/test_ckey54.html


# end makefile
