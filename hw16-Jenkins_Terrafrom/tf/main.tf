terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  token     = ""
  cloud_id  = ""
  folder_id = "b"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "default" {
  name        = "test2"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"
  hostname = "build"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81d2d9ifd50gmvc03g"
      type = "network-hdd"
      size = "10"
    }
  }

  network_interface {
    nat = true
    subnet_id = "${yandex_vpc_subnet.foo.id}"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone       = "ru-central1-a"
  network_id = "${yandex_vpc_network.foo.id}"
  v4_cidr_blocks = ["10.128.0.0/24"]
}
output "external_ip" {
  value = "${yandex_compute_instance.default.network_interface.0.nat_ip_address}"
}
resource "local_file" "external_ip" {
    content  = "${yandex_compute_instance.default.network_interface.0.nat_ip_address}"
    filename = "dev.inv"
}