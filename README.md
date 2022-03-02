[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>](https://mineiros.io/?ref=terraform-kubernetes-namespace)

[![Build Status](https://github.com/mineiros-io/terraform-kubernetes-namespace/workflows/Tests/badge.svg)](https://github.com/mineiros-io/terraform-kubernetes-namespace/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/mineiros-io/terraform-kubernetes-namespace.svg?label=latest&sort=semver)](https://github.com/mineiros-io/terraform-kubernetes-namespace/releases)
[![Terraform Version](https://img.shields.io/badge/terraform-0.14.7+%20|%202-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)
[![Join Slack](https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack)](https://mineiros.io/slack)

# terraform-kubernetes-namespace

A [Terraform] module for creating and managing multiple virtual
[Kubernetes](https://kubernetes.io/) clusters called [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/).

**_This module supports Terraform version 0.14.7 up to (not including) version 2.0
and is compatible with the Terraform Kubernetes Provider version 2.7**

This module is part of our Infrastructure as Code (IaC) framework
that enables our users and customers to easily deploy and manage reusable,
secure, and production-grade cloud infrastructure.


- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Main Resource Configuration](#main-resource-configuration)
  - [Module Configuration](#module-configuration)
- [Module Outputs](#module-outputs)
- [External Documentation](#external-documentation)
  - [Kubernetes Documentation](#kubernetes-documentation)
  - [Terraform Kubernetes Provider Documentation](#terraform-kubernetes-provider-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Module Features

This module implements the following Terraform resources

- `kubernetes_namespace`

## Getting Started

Most common usage of the module:

```hcl
module "terraform-kubernetes-namespace" {
  source = "git@github.com:mineiros-io/terraform-kubernetes-namespace.git?ref=v0.0.2"

  name = "name-of-namespace"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Main Resource Configuration

- [**`name`**](#var-name): *(**Required** `string`)*<a name="var-name"></a>

  Name of the namespace, must be unique. Cannot be updated. For details
  please see [here](https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names).

- [**`labels`**](#var-labels): *(Optional `map(string)`)*<a name="var-labels"></a>

  Map of string keys and values that can be used to organize and
  categorize (scope and select) namespaces. May match selectors of
  replication controllers and services.

  Default is `{}`.

- [**`annotations`**](#var-annotations): *(Optional `map(string)`)*<a name="var-annotations"></a>

  An unstructured key value map stored with the namespace that may be
  used to store arbitrary metadata.

  Default is `{}`.

### Module Configuration

- [**`module_enabled`**](#var-module_enabled): *(Optional `bool`)*<a name="var-module_enabled"></a>

  Specifies whether resources in the module will be created.

  Default is `true`.

- [**`module_depends_on`**](#var-module_depends_on): *(Optional `list(dependency)`)*<a name="var-module_depends_on"></a>

  A list of dependencies.
  Any object can be _assigned_ to this list to define a hidden external dependency.

  Default is `[]`.

  Example:

  ```hcl
  module_depends_on = [
    null_resource.name
  ]
  ```

## Module Outputs

The following attributes are exported in the outputs of the module:

- [**`namespace`**](#output-namespace): *(`object(namespace)`)*<a name="output-namespace"></a>

  All `kubernetes_namespace` resource attributes.

- [**`module_enabled`**](#output-module_enabled): *(`bool`)*<a name="output-module_enabled"></a>

  Whether this module is enabled.

## External Documentation

### Kubernetes Documentation

- https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/

### Terraform Kubernetes Provider Documentation

- https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## About Mineiros

[Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
that solves development, automation and security challenges in cloud infrastructure.

Our vision is to massively reduce time and overhead for teams to manage and
deploy production-grade and secure cloud infrastructure.

We offer commercial support for all of our modules and encourage you to reach out
if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
[Community Slack channel][slack].

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]


<!-- References -->

[homepage]: https://mineiros.io/?ref=terraform-kubernetes-namespace
[hello@mineiros.io]: mailto:hello@mineiros.io
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[releases-terraform]: https://github.com/hashicorp/terraform/releases
[releases-aws-provider]: https://github.com/terraform-providers/terraform-provider-aws/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://mineiros.io/slack
[terraform]: https://www.terraform.io
[aws]: https://aws.amazon.com/
[semantic versioning (semver)]: https://semver.org/
[variables.tf]: https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/examples
[issues]: https://github.com/mineiros-io/terraform-kubernetes-namespace/issues
[license]: https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-kubernetes-namespace/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/CONTRIBUTING.md
