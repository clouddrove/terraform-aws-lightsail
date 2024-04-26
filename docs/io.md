## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| availability\_zone | The Availability Zone in which to create your instance | `string` | `"us-east-1a"` | no |
| blueprint\_id | The ID for a virtual private server image | `string` | `"ubuntu_20_04"` | no |
| bundle\_id | The bundle of specification information | `string` | `"nano_2_0"` | no |
| create\_static\_ip | Create and attach a statis IP to the instance | `bool` | `false` | no |
| delimiter | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| domain\_name | This is the name of the resource. | `string` | `"clouddrove.ca"` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | n/a | yes |
| instance\_count | Number of instances to launch. | `number` | `1` | no |
| instance\_enabled | Flag to control the instance creation. | `bool` | `true` | no |
| key\_pair\_name | The key name to use for the instance. | `string` | `""` | no |
| key\_path | Public key path  (e.g. `~/.ssh/id_rsa.pub`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| pgp\_key | Flag to control the instance creation. | `string` | `""` | no |
| port\_info | n/a | <pre>list(object({<br>    protocol = string<br>    port     = number<br>    cidrs    = list(string)<br>  }))</pre> | `null` | no |
| public\_key | The public key material. This public key will be imported into Lightsail. | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-lightsail"` | no |
| use\_default\_key\_pair | Default key pair name will be used, you must keep 'key\_pair\_name' empty | `bool` | `true` | no |
| user\_data | Single lined launch script as a string to configure server with additional user data. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Lightsail instance. |
| created\_at | The timestamp when the instance was created. |
| instance\_ip | The Public IP Address name of the Lightsail instance. |
| instance\_name | The name of the Lightsail instance. |
| ssh\_host\_public\_key | n/a |
| tags | A mapping of tags to assign to the resource. |

