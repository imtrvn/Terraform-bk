# Create an SSH key
resource "vultr_ssh_key" "this_ssh_key" {
  name    = "this_ssh_key"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAt7yCAm3KKziwZvvEvOYkbPaZpHcLODwrE2ap+Lvft+GO/vottKGjVvoHOXF5/18v5C2h0iiTyo8dG6NGedVKC1I70aVB1nrH/7C3nCmabunwdSltahKllUay8batefSVUsXxuVf2+skt70Qeo75qYsAJ21pYb4RB/1G/fBXKAIOISH5SBAiegSGZCA15Dh9i0Kz0mwj+fxk6sJDi/JxydmGwsejXvQpMROv9j2R/O1w7OGP+HQ9T7IEPMf9AjJ3LxpVcySZMuIyv6NjkFNs58gsK5owYDyRs3gW8QvjUYhGGfy7bB1pqOm3hk3FuCpGQrBtVMnTE41kaTDNhL+327Q== imtr"
}

# Create a web server
# Resources https://www.vultr.com/api/
resource "vultr_server" "this_server" {
  count       = 3
  plan_id     = "201"
  region_id   = "40"
  os_id       = "387"
  label       = "this_server_labe_${count.index + 1}"
  tag         = "this_server_tag_${count.index + 1}"
  hostname    = "this_server_hostname_${count.index + 1}"
  user_data   = "{'foo': true}"
  enable_ipv6 = true
  auto_backup = true
  # ddos_protection = true
  notify_activate = false

  // Add an SSH key to server
  # ssh_key_ids = [vultr_ssh_key.this_ssh_key.id]
}

# Output
output "this_public_ip" {
  value = vultr_server.this_server.*.main_ip
}

output "user_name" {
  value = "root"
}

output "this_password" {
  value = vultr_server.this_server.*.default_password
}