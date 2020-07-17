# To Do's

- vscode setup
- collect manual setup tasks for things that shouldnt be automated (logging in to things, setting up ssh keys, etc)
- 3D printing tools - cura
- golang dev tooling
- node/js dev tooling
- file sync service
- set up on some form of CI
- venv explosions on cd and env-cd
- training wheels on dotfiles

## vim python environment

unsure how vim constructs its python environment.

terminal - things work fine. the interpreter is right. .venv sitepackages are in sys.path

```
> python -c "import sys; print(sys.executable); print(sys.path);"
/home/kent/code/plantmlbeta/.venv/bin/python
['', '/home/kent/code/plantmlbeta', '/home/kent/.pyenv/versions/3.7.5/lib/python37.zip', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/lib-dynload', '/home/kent/code/plantmlbeta/.venv/lib/python3.7/site-packages']
```

in vim - interpreter is still correct. but sys.path are WACKY

```
:pythonx import sys; print(sys.executable); print(sys.path)
/home/kent/code/plantmlbeta/.venv/bin/python3
['/home/kent/code/plantmlbeta', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '_vim_path_']
```

outside venv:
terminal:
```
/home/kent/.pyenv/versions/3.7.5/bin/python
['', '/home/kent/code/plantmlbeta', '/home/kent/.pyenv/versions/3.7.5/lib/python37.zip', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/lib-dynload', '/home/kent/.local/lib/python3.7/site-packages', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/site-packages']
```

vim:
```
/home/kent/.pyenv/shims/python3
['/home/kent/code/plantmlbeta', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/home/kent/.local/lib/python3.8/site-packages', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '_vim_path_']
```

vim is linked to python directly. `ldd $(which vim | grep python`
I don't see a "clear" way to override this, but it appears....we may be able to do so through plugin configuration instead (i.e. this isn't something we deal with in vim, it is something we deal with in a vim-python plugin)

### What to do next

- Read `:help python` . It is possible that what I'm trying to configure here is wrong. I want autocomplete to come from venv/pyenv, but I dont need the plugin to use venv/pyenv to execute the plugin...This leads to the next step.
- deoplete specifically is complaining. Can I configure its behaviour? It appears to use the linked python version...https://github.com/deoplete-plugins/deoplete-jedi - can I set up a specific environment for deoplete? That would be nice for not having to reinstall dev specific tooling in every venv...

This might be a vim-python plugin issue. I've got a few plugins that interact with python so i'll add those to the list of things to explore to see if there are any answers
Some additional context on plugins I'm using

- vim-python/python-syntax via vim-polyglot
- deoplete
- deoplete-jedi plugin (also nvim-yarp/roxma/vim-hug-neovim-rpc but that might be cruft from me sucking at vim config :/)
- ALE (unlikely? but worth seeing how they do it...)
- vim-lsp

This might shed some light:
"/usr/share/vim/vim81/doc/if_pyth.txt"

This looks like what I'm trying to do also: https://github.com/python-mode/python-mode
Frankly I like keeping things a bit more self managed than offloading to "black boxes" (I know it is FOSS, but its more free beer not free speech)
I see this being a good reference for "what plugins a bunch of other smart python and vim people recommend?"

Someone else struggling with this

## Multi Machine Usages

### Use Cases

- As a user managing multiple machines, I want to share the same root config while also having a clear pattern to manage the tiny differences between my machines so I can keep everything the same except for those little things that cant or I dont want to be the same

#### Out of scope

Would like to address these eventually:

- As an open source community member, I want to be able to share cool changes I've made on my fork to upstream without pushing up any personal config

### Proposed Approach

- fork repo for your own configs.
- copy `config.example.yml` to `config.yml` and check in
  - TLY: pull upstream changes to `config.example.yml` and diff with `config.yml` to see new upstream stuff, gives you a chance to review to see what you want to pull over
- make changes to `config.yml` for your machine

Alternative:

- Can we define a new config in layers? That way you dont have to keep switching branches and rebasing anytime you want to create a new config
  - e.g.
    ```
    var:
        - myconfig.yml  <-- my machine specific config (hostname, specific packages you like)
        - config.yml    <-- my "root" config
    ```
    merge lists and dicts, overwrite dict keys in `config.yml` with `myconfig.yml`

#### To manage multiple machines

- make new branch for each machine; recommend `git checkout -b $HOST`
- make changes to `config.yml` for your machine
  - TLY: rebase your machine-specific customizations branch onto `origin/master`
  - TLY: interact with `upstream/master` to pull/submit changes
