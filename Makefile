.PHONY: catalog check serve build
catalog:   ## validate + regenerate dashboard, graphs, catalog-info.yaml
	python3 scripts/build_catalog.py
check:     ## CI: validate + fail if generated files are stale
	python3 scripts/build_catalog.py --check
serve: catalog
	mkdocs serve
build: catalog
	mkdocs build --strict
