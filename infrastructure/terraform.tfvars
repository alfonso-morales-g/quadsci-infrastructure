project_id = "project-2c7de5d4-3a78-4c31-b62"
region     = "us-central1"

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
    name      = "allow-egress-1"
    direction = "EGRESS"
    allow_rules = [{
      protocol = "tcp"
      ports    = [80, 8080]
    }]

    deny_rules         = []
    source_ranges      = null
    destination_ranges = ["0.0.0.0/0"]
    priority           = 3
    target_tags        = ["webproject"]
  },

  "deny-ingress" = {
    name        = "deny-ingress-1"
    direction   = "INGRESS"
    allow_rules = []
    deny_rules = [{
      protocol = "all"
    }]
    source_ranges      = ["0.0.0.0/0"]
    destination_ranges = []
    priority           = 1000
    target_tags        = ["webproject"]
  },

  "allow-icmp" = {
    name      = "allow-icmp-1"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "icmp"
    }]

    deny_rules         = []
    source_ranges      = ["192.168.1.0/24", "192.168.2.0/24"]
    destination_ranges = []
    priority           = 100
    target_tags        = ["webproject"]
  },

  "allow-private-http" = {
    name      = "allow-private-http-1"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "tcp",
      ports    = [8080]
    }]

    deny_rules         = []
    priority           = 2
    destination_ranges = null
    source_ranges      = null
    source_tags        = ["dev"]
    target_tags        = ["webproject"]
  },

  "allow-private-ssh" = {
    name      = "allow-private-ssh-1"
    direction = "INGRESS"
    allow_rules = [{
      protocol = "tcp",
      ports    = [22]
    }]

    deny_rules         = []
    source_ranges      = ["35.235.240.0/20"]
    destination_ranges = []
    priority           = 1
    target_tags        = ["dev"]
  }
}

instance_configuration = {
  "development-instance" = {
    name = "development-instance"
    image = "debian-cloud/debian-12"
    enable_oslogin = "TRUE"
    subnetwork = "development-subnetwork"
    tags = ["webproject","dev"]
  },  
  "webapp-instance" = {
    name = "webapp-instance"
    image = "projects/cos-cloud/global/images/family/cos-113-lts"
    enable_oslogin = "FALSE"
    subnetwork = "webapp-subnetwork"
    metadata_startup_script = "docker run -d -p 8080:8080 gcr.io/google-samples/hello-app:1.0"
    tags = ["webproject"]
  }
}


bucket_name = "terraform-state-bucket-alfonsomorales"