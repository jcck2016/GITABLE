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