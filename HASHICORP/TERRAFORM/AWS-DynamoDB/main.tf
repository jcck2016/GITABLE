resource "aws_dynamodb_table" "cars" {
  name         = "cars"
  hash_key     = "VIN"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "VIN"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "car-data" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key

  item = <<EOF
{
  "Make": {"S": "Toyota"},
  "Model": {"S": "Camry"},
  "Year": {"N": "2020"},
  "VIN": {"S": "4YHRUOIY4G4678H564"}
}



EOF
}

resource "aws_dynamodb_table_item" "tesla-car" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key

  item = <<EOF
{
  "Make": {"S": "Tesla"},
  "Model": {"S": "Model S"},
  "Year": {"N": "2022"},
  "VIN": {"S": "5YJSA1E26MF123456"}
}
EOF
}

resource "aws_dynamodb_table_item" "jaguar-car" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key

  item = <<EOF
{
  "Make": {"S": "Jaguar"},
  "Model": {"S": "XF"},
  "Year": {"N": "2023"},
  "VIN": {"S": "SAJWA0ES8F1234567"}
}
EOF
}