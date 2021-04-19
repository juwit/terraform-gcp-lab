# project creation

This module creates a GCP project in the root of an org, or in a folder.

## variables

| variable        | type   | description                                                                                               | default |
|-----------------|--------|-----------------------------------------------------------------------------------------------------------|---------|
| project_name    | string | the name of the project to create                                                                         |         |
| org_id          | string | the id of the organisation to create the project in. One of `org_id` or `folder_id` **MUST** be provided. | ""      |
| folder_id       | string | the id of the folder to create the project in. One of `org_id` or `folder_id` **MUST** be provided.       | ""      |
| billing_account | string | the billing account id to link with the project                                                           |         |

## outputs

| output              | description                                            | sensitive |
|---------------------|--------------------------------------------------------|-----------|
| service_account_key | the key of the created service account for the project | true      |

To extract the service account key for another usage, run

```
terraform output -raw service_account_key | base64 -d > service_account.json
```