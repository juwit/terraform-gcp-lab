# project creation

This module creates a project.

## variables

project_name    = "challenge-lab-gcp-terraform"
org_id          = "XXX"
billing_account = "XXX-XXX-XXX"

## outputs

service_account_key

To extract the service account key for another usage, run

```
terraform output -raw service_account_key | base64 -d > service_account.json
```