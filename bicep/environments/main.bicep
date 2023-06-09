targetScope = 'subscription'
param location string = 'australiaeast'

module resourceGroups './modules/resource-groups/main.bicep' = {
  name: 'resourceGroups'
  scope: subscription('SubscriptionID')
  params: {
    location: location
  }
}

module developmentEnv './modules/development/main.bicep' = {
  name: 'developmentEnvironment'
  scope: resourceGroup('development-rg')
  params: {
    location: location
  }
  dependsOn: [
    resourceGroups
  ]
}

module stagingEnv './modules/staging/main.bicep' = {
  name: 'stagingEnvironment'
  scope: resourceGroup('staging-rg')
  params: {
    location: location
  }
  dependsOn: [
    resourceGroups
  ]
}

module productionEnv './modules/production/main.bicep' = {
  name: 'productionEnvironment'
  scope: resourceGroup('production-rg')
  params: {
    location: location
  }
  dependsOn: [
    resourceGroups
  ]
}
