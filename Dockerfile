FROM emscripten/emsdk:3.1.24
RUN curl -L -O https://github.com/mizar/YaneuraOu/releases/download/v7.6.3/SuishoPetite-YaneuraOu-v7.6.3-wasm.zip && \
    unzip -d . -UU SuishoPetite-YaneuraOu-v7.6.3-wasm.zip && \
    tar xvf wasm/source.tar.xz
