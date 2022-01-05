job [[ .simple_service.job_name | quote ]] {
  datacenters = [ [[ .simple_service.datacenter | quote]] ]
  type = "service"

  group "app" {
    count = [[ .simple_service.count ]]

    network {
      port "http" {
        to = [[ .simple_service.http_port ]]
      }
      
      port "debug" {
        to = [[ .simple_service.debug_port ]]
      }
    }

    task "server" {
      vault {
        policies = [[ .simple_service.vault_policies  | toJson ]]
      }

      service {
        name = [[ .simple_service.job_name | quote]]
        port = "http"
        tags = [ [[ .simple_service.job_name | quote]] ]
      }

      service {
        name = [[ .simple_service.job_name | quote]]
        port = "debug"
        tags = ["debug","metrics"]
      }

      resources {
        cpu    = [[ .simple_service.resources.cpu ]]
        memory = [[ .simple_service.resources.memory ]]
      }

      driver = "docker"

      env {
        CLUSTER      = [[ .simple_service.datacenter | quote ]]
        ENVIRONMENT  = [[ .simple_service.environment | quote ]]
        MESSAGE  = [[ .simple_service.environment | quote ]]
      }
      

      template {
          data = <<EOH
[[ .simple_service.consul_data ]]
EOH
          destination = "secrets/consul.env"
          env         = true
      }

      template {
        data = <<EOH
[[ .simple_service.vault_data ]]
EOH
        destination = "secrets/vault.env"
        env         = true
    }

      config {
        image = [[ .simple_service.task_image | quote ]]
        ports = ["http"]
        network_mode = "host"
      }
    }
  }
}
