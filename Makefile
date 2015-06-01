BUILD_PATH=release
NPM_PATH=node_modules/.bin

BROWSER_SYNC_BIN=${NPM_PATH}/browser-sync
LESS_BIN=${NPM_PATH}/lessc
CSSMIN_BIN=${NPM_PATH}/cleancss
HTMLMIN_BIN=${NPM_PATH}/html-minifier
IMAGEMIN_BIN=${NPM_PATH}/imagemin

LESS_PATH=node_modules/bootstrap/less
LESS_SRC=src/less/core.less
LESS_DEPS=${LESS_SRC} src/less/bootstrap-lite.less src/less/bootstrap-override.less src/less/layout.less src/less/icomoon.less

CSS_PATH=${BUILD_PATH}/styles
CSS_DEST=${CSS_PATH}/style.css
CSS_MIN_DEST=${CSS_PATH}/style.min.css

IMAGE_PATH=src/images
FONT_PATH=src/fonts

release: release/index.html release/fonts release/images release/styles

release/styles: ${CSS_MIN_DEST}

${CSS_MIN_DEST}: ${CSS_DEST}
	${CSSMIN_BIN} --output ${CSS_MIN_DEST} ${CSS_DEST}

${CSS_DEST}: ${LESS_DEPS}
	${LESS_BIN} --include-path=${LESS_PATH} ${LESS_SRC} ${CSS_DEST}

release/images: src/images/photo.jpg
	${IMAGEMIN_BIN} ${IMAGE_PATH}/photo.jpg ${BUILD_PATH}/images

release/fonts: src/fonts/icomoon.eot
	cp -r ${FONT_PATH} ${BUILD_PATH}

release/index.html: src/index.html
	${HTMLMIN_BIN} -o ${BUILD_PATH}/index.html -c htmlmin.json src/index.html

server:
	${BROWSER_SYNC_BIN} start --files="release/**" --server release
