resource "aws_s3_bucket" "chat_bot_app_bucket" {
    bucket = "ts-chat-bot"
    acl = "private"
    versioning {
        enabled = true
    }
}
