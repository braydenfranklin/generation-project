param location string = 'australiaeast'
param networkId string
param privateIp string = '10.0.3.100'
param publicIpId string
param nsgId string

resource productionNIC 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: 'production-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: reference(networkId,'2022-11-01').subnets[0].id
          }
          privateIPAllocationMethod: 'Static'
          privateIPAddress: privateIp
          publicIPAddress: {
            id: publicIpId
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgId
    }
  }
}

output networkInterfaceId string = productionNIC.id
