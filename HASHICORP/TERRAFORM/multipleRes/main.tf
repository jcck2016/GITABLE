resource "local_file" "pets" {
    filename =each.value
for_each = var.filename
    content_base64 = base64encode("we LOVE pets!\nMore text to append")
}

output "pets" {
  value = local_file.pets
  sensitive = true
  
}

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.0"
    }
  }
}

terraform {
  required_providers {
    k8s = {
      source  = "hashicorp/kubernetes"
      version = "> 1.12.0, != 1.13.1, < 1.13.3 "
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.2.0"
    }
  }
}