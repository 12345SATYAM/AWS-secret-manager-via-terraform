data "aws_secretsmanager_secret" "user" {
  name = "server/dev/user"
}

data "aws_secretsmanager_secret_version" "user" {
  secret_id = data.aws_secretsmanager_secret.user.id
}

data "aws_secretsmanager_secret" "alert" {
  name = "server/dev/alert"
}

data "aws_secretsmanager_secret_version" "alert" {
  secret_id = data.aws_secretsmanager_secret.alert.id
}