# GCP VM

This GCP VM will write some file to a GCS bucket

## Usage

create a variables file holding the project ID :

```
project_id = "XXX"
```

setup the `GOOGLE_CREDENTIALS` env var to the path of a service account JSON file

```
export GOOGLE_CREDENTIALS=service_account.json
```

Run `terraform apply`