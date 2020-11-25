# Configure the Vultr Provider
# https://my.vultr.com/settings/#settingsapi
provider "vultr" {
  api_key     = "VRXPGUPM2QUE2VW5HLALP4GDDID6V3J5VOZQ"
  rate_limit  = 700
  retry_limit = 3
}