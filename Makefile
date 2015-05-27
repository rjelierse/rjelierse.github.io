# Compile less
LESS_BIN=./node_modules/.bin/lessc
LESS_PATH=node_modules/bootstrap/less
LESS_SRC=less/core.less
LESS_DEST=release/styles/style.css
LESS_DEPS=${LESS_SRC} less/bootstrap-lite.less less/grid-lite.less less/layout.less less/icomoon.less

style: ${LESS_DEPS}
	${LESS_BIN} --include-path=${LESS_PATH} ${LESS_SRC} ${LESS_DEST}
