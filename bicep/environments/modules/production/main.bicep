param location string = 'australiaeast'

resource productionVNet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: 'production-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.0.3.0/24'
        }
      }
    ]
  }
  tags: {
    environment: 'Production'
  }
}

module productionNSG 'network-security-group.bicep' = {
  name: 'productionNSG'
  scope: resourceGroup('production-rg')
  params: {
    location: location
  }
}

resource productionSSH 'Microsoft.Compute/sshPublicKeys@2019-12-01' = {
  name: 'production-ssh'
  location: location
  properties: {
    publicKey: '<PublicKey>'
  }
  tags: {
    environment: 'Production'
  }
}
