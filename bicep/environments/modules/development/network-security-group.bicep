param location string = 'australiaeast'

resource developmentNSG 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'development-nsg'
  location: location
  tags: {
    environment: 'Development'
  }
}

resource developmentNSR1 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowSSH'
  parent: developmentNSG
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
resource developmentNSR2 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowRDP'
  parent: developmentNSG
  properties: {
    access: 'Allow'
    description: 'Allow RDP'
    destinationAddressPrefix: '*'
    destinationPortRange: '3389'
    direction: 'Inbound'
    priority: 101
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}

resource developmentNSR3 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTP'
  parent: developmentNSG
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

resource developmentNSR4 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowHTTPS'
  parent: developmentNSG
  properties: {
    access: 'Allow'
    description: 'Allow HTTPS'
    destinationAddressPrefix: '*'
    destinationPortRange: '443'
    direction: 'Inbound'
    priority: 103
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}

resource developmentNSR5 'Microsoft.Network/networkSecurityGroups/securityRules@2022-07-01' = {
  name: 'allowCNTNRS'
  parent: developmentNSG
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
    priority: 104
    protocol: 'TCP'
    sourceAddressPrefix: 'Internet'
    sourcePortRange: '*'
  }
}
