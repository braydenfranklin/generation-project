param location string = 'australiaeast'

resource stagingNSG 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'staging-nsg'
  location: location
  tags: {
    environment: 'Staging'
  }
}

resource stagingNSR1 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowSSH'
  parent: stagingNSG
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

resource stagingNSR2 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTP'
  parent: stagingNSG
  properties: {
    access: 'Allow'
    description: 'Allow HTTP'
    destinationAddressPrefix: '*'
    destinationPortRange: '80'
    direction: 'Inbound'
    priority: 101
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}

resource stagingNSR3 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTPS'
  parent: stagingNSG
  properties: {
    access: 'Allow'
    description: 'Allow HTTPS'
    destinationAddressPrefix: '*'
    destinationPortRange: '443'
    direction: 'Inbound'
    priority: 102
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}

resource stagingNSR4 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowCNTNRS'
  parent: stagingNSG
  properties: {
    access: 'Allow'
    description: 'Allow Docker Containers'
    destinationAddressPrefix: '*'
    destinationPortRanges: [
      '81'
      '82'
      '83'
      '84'
      '85'
      '86'
      '87'
      '88'
      '89'
      '90'
    ]
    direction: 'Inbound'
    priority: 103
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}
