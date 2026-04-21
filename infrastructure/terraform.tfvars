# General configuration

# project_id = "project-2c7de5d4-3a78-4c31-b62"
project_id = "quadsci-cloud-tha-alfonso"
region     = "us-central1"

# Networking configuration

vpc_name = "quadsci-vpc"

subnetworks = {
  "development-subnetwork" = {
    "name"          = "development-subnetwork",
    "ip_cidr_range" = "192.168.1.0/24",
  },

  "webapp-subnetwork" = {
    "name"          = "webapp-subnetwork",
    "ip_cidr_range" = "192.168.2.0/24",
  }
}

firewall_rules = {
  "allow-egress" = {
    name      = "quadsci-allow-egress"
    direction = "EGRESS"
    allow_rules = [{
      protocol = "tcp"
      ports    = [80, 8080]
    }]

    deny_rules         = []
    source_ranges      = ["192.168.2.0/24"]
    source_tags        = null
    destination_ranges = ["0.0.0.0/0"]
    target_tags        = null
    priority           = 3
  },

  "deny-ingress" = {
    name        = "quadsci-deny-ingress"
    direction   = "INGRESS"
    allow_rules = []
    deny_rules = [{
      protocol = "all"
    }]
    source_ranges      = ["0.0.0.0/0"]
    destination_ranges = []
    target_tags        = ["webapp", "dev"]
    priority           = 1000
  },

  "allow-icmp" = {
    name      = "quadsci-allow-icmp"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "icmp"
    }]

    deny_rules         = []
    source_ranges      = []
    source_tags        = ["webapp", "dev"]
    destination_ranges = []
    target_tags        = ["dev", "webapp"]
    priority           = 100
  },

  "allow-private-http" = {
    name      = "quadsci-allow-private-http"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "tcp",
      ports    = [8080]
    }]

    deny_rules         = []
    source_ranges      = null
    source_tags        = ["dev"]
    destination_ranges = null
    target_tags        = ["webapp"]
    priority           = 2
  },

  "allow-private-ssh" = {
    name      = "quadsci-allow-private-ssh"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "tcp",
      ports    = [22]
    }]

    deny_rules         = []
    # Identity Aware Proxy Tunnel
    source_ranges      = ["35.235.240.0/20"]
    destination_ranges = []
    target_tags        = ["dev"]
    priority           = 1
  }
}

# Compute instances configuration
instance_configuration = {
  "development-instance" = {
    name           = "development-instance"
    image          = "debian-cloud/debian-12"
    enable_oslogin = "TRUE"
    subnetwork     = "development-subnetwork"
    tags           = ["dev"]
  },
  "webapp-instance" = {
    name                    = "webapp-instance"
    image                   = "projects/cos-cloud/global/images/family/cos-113-lts"
    enable_oslogin          = "FALSE"
    subnetwork              = "webapp-subnetwork"
    metadata_startup_script = "docker run -d -p 8080:8080 gcr.io/google-samples/hello-app:1.0"
    tags                    = ["webapp"]
  }
}