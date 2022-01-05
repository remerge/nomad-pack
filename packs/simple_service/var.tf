
environment="dev"
resources={
    cpu = 256
    memory = 256
}
job_name="test-job-name"
cluster="dev-cluster"
datacenter="dw1"
http_port=8080
debug_port=8081
vault_policies=["app"]
task_image="mnomitch/hello_world_server"
consul_data=<<EOH
      APP_environment  = {{  env "ENVIRONMENT" }}
      APP_hdfs_namenode_address="{{printf "trigger/%s/%s/hdfs_namenode_address" (env "ENVIRONMENT") (env "CLUSTER") | key }}"
      APP_server_connection_timeout="{{printf "trigger/%s/%s/server_connection_timeout" (env "ENVIRONMENT") (env "CLUSTER") | key }}"
EOH
vault_data=<<EOH
      APP_rollbar_token="{{with secret "kv/rollbar"}}{{.Data.data.token}}{{end}}"
EOH
