# terraform gcp lab

This repository holds various terraform modules I use to play with GCP.

The goal of this lab is to :

* create a new GCP project
* associate it to a billing account
* create a new bucket in this project
* create a new VM in this project, and configure it to write a file in the bucket
* create a new VM template and an auto-scaling instance group using the template

## pre-requisites : setting up a service account

see https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform

The service account should be created in an "Admin" project, but must be granted organization-wide rights.

The "Admin" project should also have activated the Resource Manager API, and the Billing API:

```
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
```

### creation

Terraform will need a service account for this to work.

In an "Admin Project", go to IAM > Service Accounts

Create a "terraform" service account.

Create a key for this service account, and save it as a JSON file.

Create a env var pointing to this key :

```
export GOOGLE_CREDENTIALS=terraform-admin-project-sa.json
```

### add roles

In the IAM & Admin > IAM, for the Organization

Select "Add" and add the service account as a member, with the project creator role (roles/resourcemanager.projectCreator), and the billing role (roles/billing.user)