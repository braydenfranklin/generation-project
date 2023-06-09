param location string = 'australiaeast'

resource developmentVNet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: 'development-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
  tags: {
    environment: 'Development'
  }
}

module developmentNSG 'network-security-group.bicep' = {
  name: 'developmentNSG'
  scope: resourceGroup('development-rg')
  params: {
    location: location
  }
}

resource developmentSSH 'Microsoft.Compute/sshPublicKeys@2019-12-01' = {
  name: 'development-ssh'
  location: location
  properties: {
    publicKey: '<PublicKey>'
  }
  tags: {
    environment: 'Development'
  }
}
