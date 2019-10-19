ifneq ($(PREFIX),)
DUNE_PREFIX=--prefix=$(PREFIX)
endif

all:
	dune build @install

install: all
	dune install $(DUNE_PREFIX)

clean:
	rm -rf _build

mrproper: clean
	rm -f unicode.install unicode.opam

.PHONY: all install clean mrproper
