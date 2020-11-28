# To Do's

- vscode setup
    - see https://gist.github.com/deepu105/4599d3b381218b9d1a63119fbf9ca537 for alternate approach..
    - see your own gists https://gist.github.com/KentBrockman/f5b65a7d81e236973d21493b0be0ba54
- collect manual setup tasks for things that shouldnt be automated (logging in to things, setting up ssh keys, etc)
- golang dev tooling
- node/js dev tooling
- set up on some form of CI
- modify hosts to deploy playbook changes to all machines simultaneously
- nuke ~/.vim

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
