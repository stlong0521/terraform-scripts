resource "aws_iam_user" "chat_bot_app_user" {
    name = "chat-bot-app-user"
}

resource "aws_iam_user_policy" "chat_bot_app_policy" {
    name = "chat-bot-app-policy"
    user = "${aws_iam_user.chat_bot_app_user.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3:List*",
        "s3:Put*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::ts-chat-bot",
        "arn:aws:s3:::ts-chat-bot/*"
      ]
    },
    {
      "Action": [
        "dynamodb:Get*",
        "dynamodb:List*",
        "dynamodb:Put*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_dynamodb_table.brain_version.arn}"
    }
  ]
}
EOF
}
