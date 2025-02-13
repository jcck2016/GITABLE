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

// get keys from the AWS console on the ACG sandbox sessoins per ps session needed to setup....
// $Env:AWS_ACCESS_KEY_ID="example"
// $Env:AWS_SECRET_ACCESS_KEY="example"
// $Env:AWS_DEFAULT_REGION="us-east-1"

