param location string = 'australiaeast'

resource stagingVNet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: 'staging-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
  tags: {
    environment: 'Staging'
  }
}

module stagingNSG 'network-security-group.bicep' = {
  name: 'stagingNSG'
  scope: resourceGroup('staging-rg')
  params: {
    location: location
  }
}

resource stagingSSH 'Microsoft.Compute/sshPublicKeys@2019-12-01' = {
  name: 'staging-ssh'
  location: location
  properties: {
    publicKey: '<PublicKey>'
  }
  tags: {
    environment: 'Staging'
  }
}

