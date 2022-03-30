**Un**ified **App**lication **R**etriever
=========

Called `unappr` for short 
The **Un**ified **App**lication **R**etriever provides a single interface for installing applications you use from the variety of providers you get them from.
This means you spend less time fiddling with various providers can have one clean, obvious way to install software.

Simply supply:
- the name of your application
- the provider

Optionally provide:
- version, for the providers that support it

And `unappr` will install the application at the specied version from the specified provider, ensuring the application is uninstalled from all other providers
TODO: what if you want multiple versions installed from multiple providers?

## Supported Providers

Legend:
- 🛑  = Cannot be implemented
- ❌ = Not implemented
- ✅ = Implemented

| Provider | Support Installs | Support Versioning |
| -- | -- | -- |
| `apt` | ✅ | ✅ |
| `flatpak` | ✅ | 🛑 |
| `executable` | ✅ | 🛑 |
<!-- | `github_AppImage` | ❌ | ❌ | -->
<!-- | `url_deb` | ❌ | ❌ | -->
<!-- | `repo_deb` | ❌ | ❌ | -->

## Supported Applications

## Supported Distributions

Requirements
------------

> Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.
`flatpak`
`apt`
`deb`
`unzip`

Role Variables
--------------

> A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.
See [`./defaults/main.yml`](./defaults/main.yml)

Dependencies
------------

> A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.
None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: kentbrockman.unappr, x: 42 }

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

## Development

Use `molecule` with the scenarios provided in [the directory](./molecule)

If using docker:

1. Create docker image to test against
   Using Ubuntu 20.04 for now, as that is closest to my OS

   `docker build -t test-image -f test-image.Dockerfile .`

   Would love to expand this later

2. Create an instance of the this docker container to test against
  `molecule create -s <scenario name>`

3. Run the role
  `molecule converge -s <scenario name>`

4. Clean up when you're done
  `molecule destroy -s <scenario name>`

If using localhost (which is what I am set up for):
Pretty much same procedure as above

Molecule has been finnicky for me, but I'm running old software.
In a pinch, you can always run the playbook manually:

`ansible-playbook --inventory ~/.cache/molecule/unappr/flatpak_apt/inventory --skip-tags molecule-notest,notest -K ~/code/dev-playbook/roles/unappr/molecule/flatpak_apt/converge.yml`

Had to do this cause I couldn't find a way to pass -K flag via `molecule converge`
Doublecheck molecule created inventory (I had to tweak ansible_interpreter_path)

### Automated Testing

Automated testing has proven challenging here.
Starts with selecting driver:
- `docker` - ideal. but get `bubblewrap` errors when preinstalling `flatpak` app for testing
  - why preinstall a `flatpak` app? because they are huge. installing them in the context of a test takes forever
    - is there a smaller application? [maybe - hopefully there is an answer](https://discourse.flathub.org/t/small-application-for-ci-testing/2384)
      - worst case scenario we could submit [our own](https://github.com/flathub/flathub/wiki/App-Submission#how-to-submit-an-app)
    - why not install a smaller runtime instead of an app?
      - tried this. it doesn't uninstall properly with the `flatpak` module. it also gets uninstalled as an unused dependency
- so go with `delegated` instead - which runs on localhost. i dont like messing with my host system for testing. doing this for now...
  - can we delegate to a VM?
    - maybe. probably. havent looked into it a ton. it'll probably be slower :/
  - it is more representative of the environment we will run against
  - TODO: can we provide a driver to KVM?
