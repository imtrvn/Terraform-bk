# Create a web server
# Resources https://www.vultr.com/api/
resource "vultr_server" "this_server" {
  plan_id     = "203"
  region_id   = "25"
  os_id       = "240"
  label       = "this_server_label"
  tag         = "this_server_tag"
  hostname    = "this_server_hostname"
  user_data   = "{'foo': true}"
  enable_ipv6 = true
  auto_backup = true
  # ddos_protection = true
  notify_activate = false
}

# Output
output "this_public_ip" {
  value = vultr_server.this_server.main_ip
}

output "user_name" {
  value = "Administrator"
}

output "this_password" {
  value = vultr_server.this_server.default_password
}