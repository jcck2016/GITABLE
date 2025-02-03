resource "local_file" "pet" {
    filename = "C:\\Users\\HJCWKZ23\\GITABLE\\HASHICORP\\TERRAFORM\\DataSource\\pet.txt"
    // content = "we LOVE pets!"
    content = data.local_file.dog.content
  
}


data "local_file" "dog" {
    filename = "C:\\Users\\HJCWKZ23\\GITABLE\\HASHICORP\\TERRAFORM\\DataSource\\dog.txt"
  
}