using '../main.bicep'
param location = 'eastus'
param environmentName = 'dev'
param diagnosticSettings = [
  {
    name: 'diagnosticSettings'
    metricCategories: [
      {
        category: 'Transaction'
        enabled: true
      } 
    ]
    workspaceResourceId:'/subscriptions/35ce8cef-94f9-4dba-9c61-a09396fec7cf/resourceGroups/rg-logging-dev-eus/providers/Microsoft.OperationalInsights/workspaces/la-logging-dev-eus'
  }
]
