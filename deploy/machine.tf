resource "fly_app" "app" {
  name = "experiment-tf-fly"
  org = "personal"
}

resource "fly_machine" "app" {
  app    = fly_app.app.id
  region = "ewr"
  name   = "experiment-tf-fly-app"
  image  = "nginx"
  env = {
    key = "value"
  }
  services = [
    {
      ports = [
        {
          port     = 443
          handlers = ["tls", "http"]
        },
        {
          port     = 80
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : 80
    },
    {
      ports = [
        {
          port     = 8080
          handlers = ["tls", "http"]
        },
        {
          port     = 8081
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : 8089
    }
  ]
}
