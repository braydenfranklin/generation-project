targetScope = 'subscription'
param location string = 'australiaeast'

resource developmentRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'development-rg'
  location: location
  tags: {
    environment: 'Development'
  }
}

resource stagingRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'staging-rg'
  location: location
  tags: {
    environment: 'Staging'
  }
}

resource productionRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'production-rg'
  location: location
  tags: {
    environment: 'Production'
  }
}
