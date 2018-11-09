# Configure the Microsoft Azure Provider
provider "azurerm" { }

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "example-${var.INSTANCE}-${var.ENVIRONMENT}"
  location = "${var.REGION}"

  tags {
    project = "example"
    instance = "${var.INSTANCE}"
    environment = "${var.ENVIRONMENT}"
  }
}

# container registry
resource "azurerm_container_registry" "main" {
  name                = "example${var.INSTANCE}${var.ENVIRONMENT}cr"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location            = "${azurerm_resource_group.main.location}"

  admin_enabled = true
  sku = "Basic"

  tags {
    project = "example"
    instance = "${var.INSTANCE}"
    environment = "${var.ENVIRONMENT}"
  }

  # perform docker login
  provisioner "local-exec" {
    command = "sleep 5 && echo '${azurerm_container_registry.main.admin_password}' | docker login '${azurerm_container_registry.main.login_server}' --username '${azurerm_container_registry.main.admin_username}' --password-stdin"
    interpreter = [ "bash", "-c" ]
  }
}
