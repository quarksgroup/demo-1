# andasy.hcl app configuration file generated for demo-1 on Wednesday, 06-Aug-25 14:49:41 CAT
#
# See https://github.com/quarksgroup/andasy-cli for information about how to use this file.

app_name = "demo-1"

app {

  env = {
    HOST = "::"
  }

  port = 3000

  compute {
    cpu      = 1
    memory   = 256
    cpu_kind = "shared"
  }

  process {
    name = "demo-1"
  }

}
