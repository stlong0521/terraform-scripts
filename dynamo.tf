resource "aws_dynamodb_table" "brain_version" {
    name = "brain-version"
    read_capacity = 4
    write_capacity = 4
    hash_key = "Tag"
    attribute {
        name = "Tag"
        type = "S"
    }
}
