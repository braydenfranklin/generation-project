param location string = 'australiaeast'

resource productionNSG 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'production-nsg'
  location: location
  tags: {
    environment: 'Production'
  }
}

resource productionNSR1 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowSSH'
  parent: productionNSG
  properties: {
    access: 'Allow'
    description: 'Allow SSH'
    destinationAddressPrefix: '*'
    destinationPortRange: '22'
    direction: 'Inbound'
    priority: 100
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}

resource productionNSR2 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTPS'
  parent: productionNSG
  properties: {
    access: 'Allow'
    description: 'Allow HTTPS'
    destinationAddressPrefix: '*'
    destinationPortRange: '443'
    direction: 'Inbound'
    priority: 101
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  } 
}

resource productionNSR3 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTP'
  parent: productionNSG
  properties: {
    access: 'Allow'
    description: 'Allow HTTP'
    destinationAddressPrefix: '*'
    destinationPortRange: '80'
    direction: 'Inbound'
    priority: 102
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}
