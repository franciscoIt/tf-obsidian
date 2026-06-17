# Reserved Variables

## Terraform Native (`TF_*`)

| Variable                      | Description                                                      |
| ----------------------------- | ---------------------------------------------------------------- |
| `TF_LOG`                      | Log level: `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`      |
| `TF_LOG_PATH`                 | File path where logs are written (requires `TF_LOG` to be set)   |
| `TF_INPUT`                    | Set to `0` or `false` to disable interactive prompts             |
| `TF_VAR_<name>`               | Pass any input variable — e.g. `TF_VAR_region=us-east-1`         |
| `TF_CLI_ARGS`                 | Append flags to all subcommands                                  |
| `TF_CLI_ARGS_<cmd>`           | Append flags to a specific subcommand — e.g. `TF_CLI_ARGS_plan`  |
| `TF_DATA_DIR`                 | Override the default `.terraform/` directory location            |
| `TF_WORKSPACE`                | Select a workspace non-interactively                             |
| `TF_IN_AUTOMATION`            | Suppresses "next steps" hints in CI output (any non-empty value) |
| `TF_REGISTRY_DISCOVERY_RETRY` | Max retries for registry connection errors                       |
| `TF_REGISTRY_CLIENT_TIMEOUT`  | Registry request timeout in seconds (default: 10)                |
| `TF_STATE_PERSIST_INTERVAL`   | Seconds between remote state saves during apply (default: 20)    |
| `TF_CLI_CONFIG_FILE`          | Path to a custom `.terraformrc` config file                      |
| `TF_PLUGIN_CACHE_DIR`         | Directory for caching provider plugins                           |

## AWS
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`
- `AWS_DEFAULT_REGION`
- `AWS_PROFILE`

## Azure
- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`
- `ARM_USE_MSI`

## GCP
- `GOOGLE_CREDENTIALS`
- `GOOGLE_APPLICATION_CREDENTIALS`
- `GOOGLE_PROJECT`
- `GOOGLE_REGION`
- `GOOGLE_ZONE`

## HCP
- `TFE_TOKEN`
- `TFC_TOKEN`
- `TFE_PARALLELISM`




