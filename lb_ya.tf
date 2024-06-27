resource "yandex_lb_network_load_balancer" "foo" {
  name = "balance"

  listener {
    name = "listner"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "group-of-tests"

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/ping"
      }
    }
  }
}
