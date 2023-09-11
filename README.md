# Dependencies

- [asdf](https://github.com/asdf-vm/asdf)
- [fzf](https://github.com/junegunn/fzf)
- [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher)
- [bat](https://github.com/sharkdp/bat)
- [exa](https://github.com/ogham/exa)

## Install the vim-plug plugin 

```shell
curl -fsLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install dependencies

```shell
brew install fzf asdf the_silver_searcher exa bat
```

## Post install

```shell
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
```
