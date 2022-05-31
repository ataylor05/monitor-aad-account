module "log_anlytics_workspace" {
    source                  = "./modules/log-analytics-workspace"
    workspace_name          = "UserSigninData"
    resource_group_name     = "UserSigninData-RG"
    region                  = "eastus2"
    workspace_log_retention = 30
}

module "aad_diag_settings" {
    source                               = "./modules/aad-diag-settings"
    log_analytics_workspace_id           = module.log_anlytics_workspace.log_analytics_workspace_id
    enable_signin_logs                   = true
    enable_audit_logs                    = true
    enable_non_interactive_signin_logs   = true
    enable_service_principal_signin_logs = true
    enable_managed_identity_signin_logs  = true
    enable_provisioning_logs             = true
    enable_adfs_signin_logs              = true
    log_retention                        = 30
}

module "monitor_alerts" {
    source                     = "./modules/monitor-alert"
    log_analytics_workspace_id = module.log_anlytics_workspace.log_analytics_workspace_id
}