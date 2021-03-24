# Terraform Elastic Cloud Demo

Basic demo to spin up a cluster on Elastic Cloud using Terraform

## Steps

- Clone repo as shown below

```bash
$ git clone https://github.com/papicella/terraform-ess.git
```

- Add ENV variable for your API key 

_Note: Replace "YOU_API_KEY_FROM_ELASTIC_CLOUD" with your API key for Elastic Cloud_

```bash
$ export EC_API_KEY=YOU_API_KEY_FROM_ELASTIC_CLOUD
```

- OPTIONALLY edit main.tf to set you desired config parameters such as REGION, CONFIG etc

```yaml
resource "ec_deployment" "test-tf-deployment" {
 name        = "test-tf-deployment"
 region         = "gcp-australia-southeast1"
 version        = "7.11.1"
 deployment_template_id = "gcp-io-optimized"
 elasticsearch {
  topology {
   instance_configuration_id = "gcp.data.highio.1"
  }
 }
 kibana {
  topology {
   instance_configuration_id = "gcp.kibana.1"
  }
 }
}

output "elasticsearch_https_endpoint" {
 value = ec_deployment.test-tf-deployment.elasticsearch[0].https_endpoint
}

output "elasticsearch_password" {
 value = ec_deployment.test-tf-deployment.elasticsearch_password
}
```
- Run the following commands 

```bash
$ terraform init
$ terraform apply -auto-approve
```

### Output

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of elastic/ec from the dependency lock file
- Using previously-installed elastic/ec v0.1.0-beta

Terraform has been successfully initialized!

$ terraform apply -auto-approve
ec_deployment.test-tf-deployment: Creating...
ec_deployment.test-tf-deployment: Still creating... [10s elapsed]
ec_deployment.test-tf-deployment: Still creating... [20s elapsed]
ec_deployment.test-tf-deployment: Still creating... [30s elapsed]
ec_deployment.test-tf-deployment: Still creating... [40s elapsed]
ec_deployment.test-tf-deployment: Still creating... [50s elapsed]
ec_deployment.test-tf-deployment: Still creating... [1m0s elapsed]
ec_deployment.test-tf-deployment: Still creating... [1m10s elapsed]
ec_deployment.test-tf-deployment: Still creating... [1m20s elapsed]
ec_deployment.test-tf-deployment: Still creating... [1m30s elapsed]
ec_deployment.test-tf-deployment: Creation complete after 1m38s [id=b334234ccde9edb02e7ca5eb3493bb59]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

elasticsearch_https_endpoint = "https://...."
elasticsearch_password = "....."

```

<hr />
Pas Apicella [pas.apicella at elastic.co] is an Solution Architect at Elastic APJ  


