# Infrashift Secure DevContainer Features

<!-- 
<table style="width: 100%; border-style: none;"><tr>
<td style="width: 140px; text-align: center;"><a href="https://github.com/devcontainers"><img width="128px" src="https://raw.githubusercontent.com/microsoft/fluentui-system-icons/78c9587b995299d5bfc007a0077773556ecb0994/assets/Cube/SVG/ic_fluent_cube_32_filled.svg" alt="devcontainers organization logo"/></a></td>
<td>
<strong>Development Container 'Features'</strong><br />
<i>A set of simple and reusable Features. Quickly add a language/tool/CLI to a development container.
</td>
</tr></table>
-->

Development container “Features” are self-contained, distributions of installation code and development container configuration. This project is the source for the Infrashift Secure DevContainer Features; a vetted collection of features that have been carefully curated and shipped through a secure software supply chain. 

## Usage

To reference a Feature from this repository, add the desired Features to a `devcontainer.json`. Each Feature has a `README.md` that shows how to reference the Feature and which options are available for that Feature.

The example below installs the `git` and `git-lfs` declared in the [`./src`](./src) directory of this
repository.

See the relevant Feature's README for supported options.

...TODO...
<!--
```jsonc
"name": "my-project-devcontainer",
"image": "mcr.microsoft.com/devcontainers/base:ubuntu",  // Any generic, debian-based image.
"features": {
    "ghcr.io/devcontainers/features/go:1": {
        "version": "1.18"
    },
    "ghcr.io/devcontainers/features/docker-in-docker:1": {
        "version": "latest",
        "moby": true
    }
}
```

The `:latest` version annotation is added implicitly if omitted. To pin to a specific package version
([example](https://github.com/devcontainers/features/pkgs/container/features/go/versions)), append it to the end of the
Feature. Features follow semantic versioning conventions, so you can pin to a major version `:1`, minor version `:1.0`, or patch version `:1.0.0` by specifying the appropriate label.

```jsonc
"features": {
    "ghcr.io/devcontainers/features/go:1.0.0": {
        "version": "1.18"
    }
}
```
-->

## Repo Structure

```
.
├── README.md
├── src
│   ├── dotnet
│   │   ├── ansible-role-feature/
│   │   ├── activate-feature.yml
│   │   ├── devcontainer-feature.json
│   │   ├── install.sh
│   │   ├── README.md
│   │   └── NOTES.md
│   ├── go
│   │   ├── ansible-role-feature/
│   │   ├── activate-feature.yml
│   │   ├── devcontainer-feature.json
│   │   ├── install.sh
│   │   ├── README.md
│   │   └── NOTES.md
|   └── ...
│       ├── ansible-role-feature/
│       ├── activate-feature.yml
│       ├── devcontainer-feature.json
│       ├── install.sh
│       ├── README.md
│       └── NOTES.md
├── writeme
│   ├── feature-README.template
│   ├── writeme.go
...
```

-   [`src`](src) - A collection of subfolders, each declaring a Feature. Each subfolder contains at least a
    `devcontainer-feature.json` and an `install.sh` script.

<!--
## Contributions

### Creating your own collection of Features

The [Feature distribution specification](https://containers.dev/implementors/features-distribution/) outlines a pattern for community members and organizations to self-author Features in repositories they control.


A template repo [`securedevcontainers/feature-template`](https://github.com/infrashift/feature-template) and [GitHub Action](https://github.com/infrashift/feature-action) are available to help bootstrap self-authored Features.

We are eager to hear your feedback on self-authoring!  Please provide comments and feedback on [spec issue #70](https://github.com/devcontainers/spec/issues/70).

### Contributing to this repository

This repository will accept improvement and bug fix contributions related to the
[current set of maintained Features](./src).
-->

## External References

* https://containers.dev/implementors/features/
* https://containers.dev/implementors/json_schema/
* https://containers.dev/implementors/features-distribution/
