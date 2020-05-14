# To Do's

- vscode setup
- firefox - search engines, enable plugins
- collect manual setup tasks for things that shouldnt be automated (logging in to things, setting up ssh keys, etc)
- vim plugins - some require external dependencies. install dependencies for those plugins when they are installed (e.g. fzf, rg, deoplete)
- 3D printing tools - cura
- golang dev tooling
- node/js dev tooling
- file sync service
- handful of other nice tools (rerun, bat, fzf, rg, )

## Multi Machine Usages

### Use Cases

- As a user managing multiple machines, I want to share the same root config while also having a clear pattern to manage the tiny differences between my machines so I can keep everything the same except for those little things that cant or I dont want to be the same
- As an open source community member, I want to be able to share cool changes I've made on my fork to upstream without pushing up any personal config

### Proposed Designs
- fork repo for your own configs
- keep all differences in local config 
    - have `config.example.yml`, copy it to `config.yml` and make changes. Check it into source control on a different branch. this branch is for your customizations. you can rebase your customizations branch onto master - master is how you can pull/submit changes upstream
    - make new branch on your fork with `$HOME` for each machine. copy config and put custom configs there
