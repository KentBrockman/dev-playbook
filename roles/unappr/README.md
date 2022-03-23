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
| `executable` | ✅ | ❌ |
| `github_AppImage` | ❌ | ❌ |
| `url_deb` | ❌ | ❌ |
| `repo_deb` | ❌ | ❌ |

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

1. Create docker image to test against
   Using Ubuntu 20.04 for now, as that is closest to my OS

   `docker build -t test-image -f test-image.Dockerfile .`

   Would love to expand this later

2. Create an instance of the this docker container to test against
  `molecule create`

3. Run the role
  `molecule converge`

4. Clean up when you're done
  `molecule destroy`
