
MXMLC=./tmp/apache-flex-sdk/bin/mxmlc

SRC=src
DIST=dist


target: cmd5
.PHONY: target

cmd5: $(DIST) $(DIST)/test_cmd5.html
	$(MXMLC) $(SRC)/cmd5_main.as -output $(DIST)/cmd5_main.swf
.PHONY: cmd5

$(DIST)/test_cmd5.html: $(SRC)/test/cmd5.html
	cp $(SRC)/test/cmd5.html $(DIST)/test_cmd5.html

$(DIST):
	mkdir -p $(DIST)


# end makefile
