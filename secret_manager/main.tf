# locals {
#   user = jsondecode(data.aws_secretsmanager_secret_version.user.secret_string)
# }

locals {
  user = jsondecode(data.aws_secretsmanager_secret_version.user.secret_string)
  alertmanager_extra_vars = merge(
    {
      alert = jsondecode(data.aws_secretsmanager_secret_version.alert.secret_string)
    },
    {
      for name, key in local.user : upper(name) => key
    }
    # {
    #   DEV = user.secret1
    # }
    # {
    #   SRE = local.alertmanager_extra_vars.user.sercet2
    # }
  )
}

output "user" {
  value = (local.alertmanager_extra_vars)
  sensitive = true
}

resource "null_resource" "user" {
  provisioner "local-exec" {
    # when    = create
    command = "echo ${local.user.secret1} >> user-secret2.txt"
  }
}