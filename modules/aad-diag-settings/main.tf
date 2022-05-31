resource "azurerm_monitor_aad_diagnostic_setting" "export_user_signins" {
  name                       = "Export to Log Analytics Workspace"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  log {
    category = "SignInLogs"
    enabled  = var.enable_signin_logs
    retention_policy {
      enabled = var.enable_signin_logs
      days    = var.log_retention
    }
  }
  log {
    category = "AuditLogs"
    enabled  = var.enable_audit_logs
    retention_policy {
      enabled = var.enable_audit_logs
      days    = var.log_retention
    }
  }
  log {
    category = "NonInteractiveUserSignInLogs"
    enabled  = var.enable_non_interactive_signin_logs
    retention_policy {
      enabled = var.enable_non_interactive_signin_logs
      days    = var.log_retention
    }
  }
  log {
    category = "ServicePrincipalSignInLogs"
    enabled  = var.enable_service_principal_signin_logs
    retention_policy {
      enabled = var.enable_service_principal_signin_logs
      days    = var.log_retention
    }
  }
  log {
    category = "ManagedIdentitySignInLogs"
    enabled  = var.enable_managed_identity_signin_logs
    retention_policy {
      enabled = var.enable_managed_identity_signin_logs
      days    = var.log_retention
    }
  }
  log {
    category = "ProvisioningLogs"
    enabled  = var.enable_provisioning_logs
    retention_policy {
      enabled = var.enable_provisioning_logs
      days    = var.log_retention
    }
  }
  log {
    category = "ADFSSignInLogs"
    enabled  = var.enable_adfs_signin_logs
    retention_policy {
      enabled = var.enable_adfs_signin_logs
      days    = var.log_retention
    }
  }
}