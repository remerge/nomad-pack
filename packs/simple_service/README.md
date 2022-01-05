# Simple Service

This pack is a simple Nomad job that runs as a service and can be accessed via HTTP. 
Note:
- There is also a port exposed for debug metrics(inline with the remerge development convention).
- It uses docker host network type


## Variables

- "task_image" (string) - Docker image for job task
- "http_port" (number) - Port for accessing application
- "count" (number) - The number of app instances to deploy
- "vault_data" (string) - consul-template to retrieve secrets from vault
- "consul_data" (string) - consul-template to retrieve application configuration from consul
- "resources" (object) - The resource to assign to the application.
- "job_name" (string) - Application name
- "cluster" (string) - Cluster name
- "environment" (string) - Application environment
- "datacenter" (string) - Datacenter in the region which is eligible for task placement.
- "debug_port" (number) - Port for debugging application
- "vault_policies" (list of string) - List of vault policies to use in the application
