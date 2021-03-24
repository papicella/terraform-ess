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
