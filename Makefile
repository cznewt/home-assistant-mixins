
init:
	jb install

format:
	./scripts/format_mixins.sh

update:
	./scripts/test_mixins.sh update

test:
	./scripts/test_mixins.sh

config:
	mkdir -p config_out
	jsonnet -S -J vendor -J mixins -m config_out config.jsonnet
	./scripts/remove_quotes.py config_out/*.yaml

clean:
	rm -rf build config_out vendor
