# Unified Application Retriever

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

## Sample Usage

```ansible

```

## Supported Providers

Legend:
- ✖️  = Cannot be implemented
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


