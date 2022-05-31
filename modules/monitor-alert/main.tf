resource "azurerm_monitor_action_group" "break_glass__used_action_group" {
  name                = "BreakGlassAccountUsed"
  resource_group_name = "UserSigninData-RG"
  short_name          = "bgused"

  email_receiver {
    name          = "send-to-doc"
    email_address = "admin@contoso.com"
  }

  email_receiver {
    name          = "send-to-csirt"
    email_address = "admin2@contoso.com"
  }

  email_receiver {
    name          = "send-to-cloudops"
    email_address = "admin3@contoso.com"
  }

}

resource "azurerm_monitor_scheduled_query_rules_alert" "example" {
  name                = "break-glass-login"
  location            = "eastus2"
  resource_group_name = "UserSigninData-RG"

  action {
    action_group           = [azurerm_monitor_action_group.break_glass__used_action_group.id]
    email_subject          = "Email Header"
  }
  data_source_id = var.log_analytics_workspace_id
  description    = "Alert when break glass user has signed in."
  enabled        = true
  query       = <<-QUERY
  SigninLogs
    | where UserPrincipalName has "allan@startmail.com"
  QUERY
  severity    = 0
  frequency   = 5
  time_window = 30
  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
}

