@description('Location for all resources.')
param location string
@description('Base name that will appear for all resources.')
param baseName string = 'storageaccount1jwf'
@description('Three letter environment abreviation to denote environment that will appear in all resource names') 
param environmentName string = 'dev'
@description('Key Value Pair for tags.')
param tags object = {}
targetScope = 'subscription'

var regionReference = {
  centralus: 'cus'
  eastus: 'eus'
  westus: 'wus'
  westus2: 'wus2'
}
var nameSuffix = toLower('${baseName}-${environmentName}-${regionReference[location]}')
var shortsuffix = replace(nameSuffix, '-','')
resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' ={
  name: toLower('rg-${nameSuffix}')
  location: location
  tags: tags
}

module storageAccount 'br:acrbicepregistrydeveus.azurecr.io/bicep/modules/storageaccount:v1' = {
  name: 'storageAccount1Module'
  scope: resourceGroup
  params: {
    location: location
    storageAccountName: shortsuffix
  }

}

