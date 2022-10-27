# yaneuraou-suisho-petite

yaneuraou-suisho-petite は、[やねうら王 + SuishoPetite の WebAssembly 版](https://github.com/mizar/YaneuraOu)を、ブラウザ上で動作するように調整したものです。

dist/sse42 は、WebAssembly SIMD に対応しているブラウザ用です。

dist/nosimd は、WebAssembly SIMD に対応していないブラウザ用です。

## 使い方

クロスオリジン分離になるように、Web サーバを設定しておいてください。

```
<script src="./sse42/yaneuraou.js" defer></script>
<script>
  window.onload = async () => {
    const instance = await YaneuraOu_sse42();
    instance.addMessageListener((line) => {
      console.log(line);
    });
    instance.postMessage('usi');
  };
</script>
```

## ビルド

Docker イメージのビルド

```
docker build -t yaneuraou/wasm --no-cache=true .
```

Docker コンテナの確認

```
docker run -it --rm yaneuraou/wasm em++ --version
```

WebAssembly のビルド

```
docker run -it --rm -v ${PWD}:/workspace yaneuraou/wasm bash /workspace/script/build.sh
```
