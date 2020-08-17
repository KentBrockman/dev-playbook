# To Do's

- vscode setup
- collect manual setup tasks for things that shouldnt be automated (logging in to things, setting up ssh keys, etc)
- 3D printing tools - cura
- golang dev tooling
- node/js dev tooling
- file sync service
- set up on some form of CI
- venv explosions on cd and env-cd
- set up nvim
- setup script to run playbook

## vim python environment

I'm having some issues with vim, python, pyenv and deoplete all working together.
It is very very very likely this is a problem with machine set up at large.
If you have any questions or thoughts, please share them. I don't expect you to fix my machine.
I'm happy to dig, experiment and research I'm just a bit lost and could use the eyes of someone experienced in these programs and their interaction to make sense of whats going on here

For context, I'm using `vim8`, `pyenv`, and `deoplete`. I'm running Pop!_OS 20.04 which is based off of Ubuntu

`vim` version:

```
> vim --version
VIM - Vi IMproved 8.1 (2018 May 18, compiled Apr 15 2020 06:40:31)
Included patches: 1-2269
Modified by team+vim@tracker.debian.org
Compiled by team+vim@tracker.debian.org
Huge version with GTK3 GUI.  Features included (+) or not (-):
+acl               -farsi             -mouse_sysmouse    -tag_any_white
+arabic            +file_in_path      +mouse_urxvt       +tcl
+autocmd           +find_in_path      +mouse_xterm       +termguicolors
+autochdir         +float             +multi_byte        +terminal
-autoservername    +folding           +multi_lang        +terminfo
+balloon_eval      -footer            -mzscheme          +termresponse
+balloon_eval_term +fork()            +netbeans_intg     +textobjects
+browse            +gettext           +num64             +textprop
++builtin_terms    -hangul_input      +packages          +timers
+byte_offset       +iconv             +path_extra        +title
+channel           +insert_expand     +perl              +toolbar
+cindent           +job               +persistent_undo   +user_commands
+clientserver      +jumplist          +postscript        +vartabs
+clipboard         +keymap            +printer           +vertsplit
+cmdline_compl     +lambda            +profile           +virtualedit
+cmdline_hist      +langmap           -python            +visual
+cmdline_info      +libcall           +python3           +visualextra
+comments          +linebreak         +quickfix          +viminfo
+conceal           +lispindent        +reltime           +vreplace
+cryptv            +listcmds          +rightleft         +wildignore
+cscope            +localmap          -ruby              +wildmenu
+cursorbind        +lua               +scrollbind        +windows
+cursorshape       +menu              +signs             +writebackup
+dialog_con_gui    +mksession         +smartindent       +X11
+diff              +modify_fname      +sound             -xfontset
+digraphs          +mouse             +spell             +xim
+dnd               +mouseshape        +startuptime       +xpm
-ebcdic            +mouse_dec         +statusline        +xsmp_interact
+emacs_tags        +mouse_gpm         -sun_workshop      +xterm_clipboard
+eval              -mouse_jsbterm     +syntax            -xterm_save
+ex_extra          +mouse_netterm     +tag_binary
+extra_search      +mouse_sgr         -tag_old_static
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
  system gvimrc file: "$VIM/gvimrc"
    user gvimrc file: "$HOME/.gvimrc"
2nd user gvimrc file: "~/.vim/gvimrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
    system menu file: "$VIMRUNTIME/menu.vim"
  fall-back for $VIM: "/usr/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -Wdate-time  -g -O2 -fdebug-prefix-map=/build/vim-iU6mZD/vim-8.1.2269=. -fstack-protector-strong -Wformat -Werror=format-security -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc   -Wl,-E  -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -o vim   -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lSM -lICE -lXpm -lXt -lX11 -lXdmcp -lSM -lICE  -lm -ltinfo -lnsl  -lselinux  -lcanberra -lacl -lattr -lgpm -ldl  -L/usr/lib -llua5.2 -Wl,-E  -fstack-protector-strong -L/usr/local/lib  -L/usr/lib/x86_64-linux-gnu/perl/5.30/CORE -lperl -ldl -lm -lpthread -lcrypt  -L/usr/lib/python3.8/config-3.8-x86_64-linux-gnu -lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm -L/usr/lib/x86_64-linux-gnu -ltcl8.6 -ldl -lz -lpthread -lm
```

`.vimrc` sections for `deoplete`:

```
" deoplete for autocompletion
" needs: pip3 install --user pynvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'deoplete-plugins/deoplete-jedi'
endif
let g:deoplete#enable_at_startup = 1
" TAB autocompletion https://github.com/Shougo/deoplete.nvim/issues/816
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" show docstring in preview window
let g:deoplete#sources#jedi#show_docstring = 1
" close the preview window after autocomplete is finished
autocmd CompleteDone * pclose!
```

Some more details on dev setup - each of my projects has a `venv` and usually has a `.python-version` to let `pyenv` switch the interpreter.
Some projects I also set `PYTHONPATH` to the current working directory to make some local modules accessible to python scripts I run.

Immediately, the problem that I've been having is `:pythonx import [pynvim|neovim]` fails.
These dependences are installed in the project-specific `venv`, so I've done some more digging as this error can mean a bunch of different things.
The problem appears to be `sys.path` does not reference `site-packages` for `.venv` which is where `pynvim` is installed.

This leads to the bigger question - how the heck does `sys.path` get set? I can't seem to figure out the underyling logic on this.

Some cases:

Terminal w/ venv activated - things work fine. the interpreter is right. .venv sitepackages are in sys.path

```
> python -c "import sys; print(sys.executable); print(sys.path);"
/home/kent/code/plantmlbeta/.venv/bin/python
['', '/home/kent/code/plantmlbeta', '/home/kent/.pyenv/versions/3.7.5/lib/python37.zip', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/lib-dynload', '/home/kent/code/plantmlbeta/.venv/lib/python3.7/site-packages']
```

Vim spawned from shell w/ venv activated - interpreter is still correct. but sys.path is wacky. It is linked to system python install:

```
:pythonx import sys; print(sys.executable); print(sys.path)
/home/kent/code/plantmlbeta/.venv/bin/python3
['/home/kent/code/plantmlbeta', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '_vim_path_']
```

Terminal w/o venv. Nothing super surprising here I don't think:
```
/home/kent/.pyenv/versions/3.7.5/bin/python
['', '/home/kent/code/plantmlbeta', '/home/kent/.pyenv/versions/3.7.5/lib/python37.zip', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/lib-dynload', '/home/kent/.local/lib/python3.7/site-packages', '/home/kent/.pyenv/versions/3.7.5/lib/python3.7/site-packages']
```

Vim spawned from shell w/o venv. More sensible than vim w/ venv above but `sys.path` uses a mix of system python and local python:
```
/home/kent/.pyenv/shims/python3
['/home/kent/code/plantmlbeta', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/home/kent/.local/lib/python3.8/site-packages', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '_vim_path_']
```

vim is linked to python directly:
```
> ldd $(which vim) | grep python
libpython3.8.so.1.0 => /lib/x86_64-linux-gnu/libpython3.8.so.1.0 (0x00007f6e8c187000)
```

I'm not sure what the "right" way to do this is. 
It is nice to use venv/pyenv to get project-level isolation for all deps and interpreter version.
It is a bit annoying to have to install pynvim to every project venv, but hey, I can deal with that. I'm open to a suggestion on how to make this better/suck less
Should I, or can I, have a specific venv for deoplete and vim? 
Does deoplete HAVE to use system python in this context? If so, how does this mesh with LSP-based tools? Some LSP tools should run in the venv (:LspDefinition for example)
I believe python development, of a certain maturity, eventually uses pyenv or a similar type of approach (specifically - environment and interpreter isolation) 
Does deoplete support this? I'm assuming it does and I've so far been unsuccessful in discovering the guide.

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
