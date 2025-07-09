# config
my configs

- [Install](#install)

## Install

### on Mac

```sh
make mac
```

## dpp commands
- update plugins on dpp: `call dpp#async_ext_action('installer', 'update')`
- install plugins on dpp: `call dpp#async_ext_action('installer', 'install')`
- remake dpp state: `call dpp#make_state('~/local/config/.cache/dpp/', '~/local/config/vim/configs/dpp.ts')`
