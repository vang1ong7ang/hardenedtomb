# hardenedtomb

use block device as tomb for your secrets

## install

place the file [`ht`](ht) under your path

## qemu

use hardenedtomb inside a qemu virtualized environment to enhance the security

```sh
qemu-system-aarch64 -nographic -M virt -cpu cortex-a53 -m 1G -kernel vmlinux -initrd initramfs secrets.img
```

see <https://vang1ong7ang.github.io/hardenedtomb/> to download a working kernel and initrd

## environment

- `HT_IMG`: the block device for hardened tomb to be used
- `HT_MAP`: the device mapper name
- `HT_DIR`: the working directory to mount
- `HT_KEY`: the gpg key id
- `HT_FMT`: the input and output format

## usage

- `ht disk`: format block device
- `ht init`: init hardened tomb on formatted device
- `ht open`: open hardened tomb
- `ht lock`: lock hardened tomb
- `ht addk KEYPATH`: insert key (use `HT_FMT` to control the input format)
- `ht getk KEYPATH`: show key (use `HT_FMT` to control the output format)
- `ht lstk [KEYPATH]`: list key entries

