# yewdux
WASM with yew using yewdux for state management

# What is Yew?

- [Yew.rs frameowrk](https://yew.rs/)
- Yew is a modern Rust framework for creating multi-threaded front-end web apps using WebAssembly and SPAs.
- Today already is possible creates Server Side Rendering web apps.

- It component-based.
- It achieves great performance.
- It supports JavaScript interoperability, allowing developers leverage NPM packages and integrate with existing JavaScript applications.

## Main dependences

- Trunk [Crates trunk](https://crates.io/crates/trunk)
- wasm-bindgen-cli [Crates wasm-bindgen-cli](https://crates.io/crates/wasm-bindgen-cli)

## Running

```shell
$ trunks serve
output: http://127.0.0.1:8080/
```

## Extensions
- use: CTRL + SHIFT + P 'default extensions' to install persistent extensions
- Rust extension pack (Swellaby)
- Thunder Client
- Auto Rename Tag
- Trunk Check

## Trunk check

- trunk actions disable trunk-upgrade-available
- trunk check # runs the universal linter on all applicable files
- trunk fmt # runs all the enabled formatters and auto-applies changes

## Using docker

```shell
docker compose up -d
output: /
```

## Using dev container the first time

- Add Cargo.toml

```shell
$ cargo init
output: /
```

- Add yew dependence on Cargo.toml

```shell
$ cargo add yew
output: /
```

- Sometimes old files of the build can throw issues. Try clean the cache and the files of the build.

```shell
$ cargo clean
output: /
```

## Guide to deploy

```shell
$ trunks build --release
output: success
```

```shell
$ tar -cvf ./deploy.tar --exclude='*.map' ./captain-definition ./dist/*
output: ./deploy.tar
```

```shell
$ caprover deploy -t ./deploy.tar
output: success
```

- [Generate locally bundles](https://yew.rs/docs/more/deployment)
- [Captain Definition File Deploy](https://caprover.com/docs/captain-definition-file.html#:~:text=One%20of%20the%20key%20components,node%2F8.7.0%22%20%7D)
- [Caprover best practice](https://caprover.com/docs/best-practices.html)
- [Best practice manually deploy](https://caprover.com/docs/recipe-deploy-create-react-app.html)
