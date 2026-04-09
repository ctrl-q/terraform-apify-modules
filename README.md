# terraform-apify-modules

Terraform modules for managing [Apify](https://apify.com/) resources via the Apify REST API. Uses the [Mastercard/restapi](https://registry.terraform.io/providers/Mastercard/restapi/latest) provider.

## Modules

| Module | Description |
|---|---|
| `actor` | Manage an Apify Actor (source code, versions, settings) |
| `build` | Trigger and manage Actor builds |
| `key-value-store` | Manage Apify Key-Value Stores |
| `schedule` | Manage Apify Schedules |
| `task` | Manage Apify Tasks |
| `webhook` | Manage Apify Webhooks |

## Usage

```hcl
module "my_actor" {
  source = "github.com/ctrl-q/terraform-apify-modules//actor"

  name  = "my-actor"
  title = "My Actor"
}
```

## Requirements

- Terraform >= 1.0
- Apify API token configured for the `restapi` provider
