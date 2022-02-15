header {
  image = "https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg"
  url   = "https://mineiros.io/?ref=terraform-kubernetes-namespace"

  badge "build" {
    image = "https://github.com/mineiros-io/terraform-kubernetes-namespace/workflows/Tests/badge.svg"
    url   = "https://github.com/mineiros-io/terraform-kubernetes-namespace/actions"
    text  = "Build Status"
  }

  badge "semver" {
    image = "https://img.shields.io/github/v/tag/mineiros-io/terraform-kubernetes-namespace.svg?label=latest&sort=semver"
    url   = "https://github.com/mineiros-io/terraform-kubernetes-namespace/releases"
    text  = "GitHub tag (latest SemVer)"
  }

  badge "terraform" {
    image = "https://img.shields.io/badge/terraform-0.14.7+%20|%202-623CE4.svg?logo=terraform"
    url   = "https://github.com/hashicorp/terraform/releases"
    text  = "Terraform Version"
  }

  badge "slack" {
    image = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
    url   = "https://mineiros.io/slack"
    text  = "Join Slack"
  }
}

section {
  title   = "terraform-kubernetes-namespace"
  toc     = true
  content = <<-END
    A [Terraform] module for creating and managing multiple virtual
    [Kubernetes](https://kubernetes.io/) clusters called [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/).

    **_This module supports Terraform version 0.14.7 up to (not including) version 2.0
    and is compatible with the Terraform Kubernetes Provider version 2.7**

    This module is part of our Infrastructure as Code (IaC) framework
    that enables our users and customers to easily deploy and manage reusable,
    secure, and production-grade cloud infrastructure.
  END

  section {
    title   = "Module Features"
    content = <<-END
      This module implements the following Terraform resources

      - `kubernetes_namespace`
    END
  }

  section {
    title   = "Getting Started"
    content = <<-END
      Most common usage of the module:

      ```hcl
      module "terraform-kubernetes-namespace" {
        source = "git@github.com:mineiros-io/terraform-kubernetes-namespace.git?ref=v0.0.1"

        name = "name-of-namespace"
      }
      ```
    END
  }

  section {
    title   = "Module Argument Reference"
    content = <<-END
      See [variables.tf] and [examples/] for details and use-cases.
    END

    section {
      title = "Main Resource Configuration"

      variable "name" {
        required    = true
        type        = string
        description = <<-END
          Name of the namespace, must be unique. Cannot be updated. For details
          please see [here](https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names).
        END
      }

      variable "labels" {
        type        = map(string)
        default     = {}
        description = <<-END
          Map of string keys and values that can be used to organize and
          categorize (scope and select) namespaces. May match selectors of
          replication controllers and services.
        END
      }

      variable "annotations" {
        type        = map(string)
        default     = {}
        description = <<-END
          An unstructured key value map stored with the namespace that may be
          used to store arbitrary metadata.
        END
      }
    }

    section {
      title = "Module Configuration"

      variable "module_enabled" {
        type        = bool
        default     = true
        description = <<-END
          Specifies whether resources in the module will be created.
        END
      }

      variable "module_depends_on" {
        type           = list(dependency)
        description    = <<-END
          A list of dependencies.
          Any object can be _assigned_ to this list to define a hidden external dependency.
        END
        default        = []
        readme_example = <<-END
          module_depends_on = [
            null_resource.name
          ]
        END
      }
    }
  }

  section {
    title   = "Module Outputs"
    content = <<-END
      The following attributes are exported in the outputs of the module:
    END

    output "namespace" {
      type        = object(namespace)
      description = <<-END
        All `kubernetes_namespace` resource attributes.
      END
    }

    output "module_enabled" {
      type        = bool
      description = <<-END
        Whether this module is enabled.
      END
    }
  }

  section {
    title = "External Documentation"

    section {
      title   = "Kubernetes Documentation"
      content = <<-END
        - https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
      END
    }

    section {
      title   = "Terraform Kubernetes Provider Documentation"
      content = <<-END
        - https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace
      END
    }
  }

  section {
    title   = "Module Versioning"
    content = <<-END
      This Module follows the principles of [Semantic Versioning (SemVer)].

      Given a version number `MAJOR.MINOR.PATCH`, we increment the:

      1. `MAJOR` version when we make incompatible changes,
      2. `MINOR` version when we add functionality in a backwards compatible manner, and
      3. `PATCH` version when we make backwards compatible bug fixes.
    END

    section {
      title   = "Backwards compatibility in `0.0.z` and `0.y.z` version"
      content = <<-END
        - Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
        - Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)
      END
    }
  }

  section {
    title   = "About Mineiros"
    content = <<-END
      [Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
      that solves development, automation and security challenges in cloud infrastructure.

      Our vision is to massively reduce time and overhead for teams to manage and
      deploy production-grade and secure cloud infrastructure.

      We offer commercial support for all of our modules and encourage you to reach out
      if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
      [Community Slack channel][slack].
    END
  }

  section {
    title   = "Reporting Issues"
    content = <<-END
      We use GitHub [Issues] to track community reported issues and missing features.
    END
  }

  section {
    title   = "Contributing"
    content = <<-END
      Contributions are always encouraged and welcome! For the process of accepting changes, we use
      [Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].
    END
  }

  section {
    title   = "Makefile Targets"
    content = <<-END
      This repository comes with a handy [Makefile].
      Run `make help` to see details on each available target.
    END
  }

  section {
    title   = "License"
    content = <<-END
      [![license][badge-license]][apache20]

      This module is licensed under the Apache License Version 2.0, January 2004.
      Please see [LICENSE] for full details.

      Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]
    END
  }
}

references {
  ref "homepage" {
    value = "https://mineiros.io/?ref=terraform-kubernetes-namespace"
  }
  ref "hello@mineiros.io" {
    value = " mailto:hello@mineiros.io"
  }
  ref "badge-license" {
    value = "https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg"
  }
  ref "releases-terraform" {
    value = "https://github.com/hashicorp/terraform/releases"
  }
  ref "releases-aws-provider" {
    value = "https://github.com/terraform-providers/terraform-provider-aws/releases"
  }
  ref "apache20" {
    value = "https://opensource.org/licenses/Apache-2.0"
  }
  ref "slack" {
    value = "https://mineiros.io/slack"
  }
  ref "terraform" {
    value = "https://www.terraform.io"
  }
  ref "aws" {
    value = "https://aws.amazon.com/"
  }
  ref "semantic versioning (semver)" {
    value = "https://semver.org/"
  }
  ref "variables.tf" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/variables.tf"
  }
  ref "examples/" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/examples"
  }
  ref "issues" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/issues"
  }
  ref "license" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/LICENSE"
  }
  ref "makefile" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/Makefile"
  }
  ref "pull requests" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/pulls"
  }
  ref "contribution guidelines" {
    value = "https://github.com/mineiros-io/terraform-kubernetes-namespace/blob/main/CONTRIBUTING.md"
  }
}
