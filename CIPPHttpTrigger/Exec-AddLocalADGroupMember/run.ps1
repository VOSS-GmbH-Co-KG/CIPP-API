param($Request, $TriggerMetadata)

# Parameter aus Request
$user = $Request.Query.UserSam
$group = $Request.Query.GroupSam

# Automation Runbook starten
Start-AzAutomationRunbook `
  -AutomationAccountName "CIPP-Automation" `
  -ResourceGroupName "CIPP-RG" `
  -Name "AD-AddToGroup" `
  -Parameters @{ UserSam = $user; GroupSam = $group }

# Rückgabe an CIPP
Push-OutputBinding -Name Response -Value (@{
    status  = "ok"
    message = "Job gestartet"
} | ConvertTo-Json)
