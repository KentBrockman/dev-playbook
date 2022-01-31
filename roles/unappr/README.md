Role Name
=========

Called `unappr` for short is the **Un**ified **App**lication **R**etriever.
`unappr`'s goal is to provide you a single interface for installing the applications you use from the variety of providers you get them from.
This means you spend less time fiddling with various providers can have one clean, obvious way to install software.

Simply supply:
- the name of your application
- the provider

Optionally provide:
- version

And `unappr` will install the application at the specied version from the specified provider, ensuring the application is uninstalled from all other providers
TODO: what if you want multiple versions installed from multiple providers?


## Supported Providers

Legend:
- 🛑  = Cannot be implemented
- ❌ = Not implemented
- ✅ = Implemented

| Provider | Support Installs | Support Versioning |
| -- | -- | -- |
| `apt` | ❌ | ❌ |
| `flatpak` | ❌ | ❌ |
| `github_AppImage` | ❌ | ❌ |
| `url_deb` | ❌ | ❌ |
| `url_bin` | ❌ | ❌ |

## Supported Applications



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
         - { role: kentbrockman.upappr, x: 42 }

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
