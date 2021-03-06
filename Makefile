COB_SOURCES=$(shell find src -type f -name '*.cob')
CBL_SOURCES=$(shell find src -type f -name '*.cbl')
CPY_SOURCES=$(shell find src -type f -name '*.cpy')

TARGETS=$(patsubst src/%.cob,build/%.out,${COB_SOURCES})

all: ${TARGETS}

.PHONY: clean
clean:
	rm -rf build

.PHONY: install
install: ${TARGETS}
	cp $^ ${out}

build/%.out: src/%.cob ${CBL_SOURCES} | ${CPY_SOURCES}
	mkdir -p $(dir $@)
	cobc -x -o $@ $^
