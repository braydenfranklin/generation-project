param location string = 'australiaeast'
param vmName string = 'production-vm'
param privateIp string = '10.0.3.100'
param adminUsername string = 'prod-admin'

module productionNIC './network-interface.bicep' = {
  name: 'productionNIC'
  scope: resourceGroup('production-rg')
  params: {
    location: location
    networkId: '/subscriptions/<SubscriptionID>/resourceGroups/production-rg/providers/Microsoft.Network/virtualNetworks/production-vnet'
    publicIpId: '/subscriptions/<SubscriptionID>/resourceGroups/cloudby.click/providers/Microsoft.Network/publicIpAddresses/production-public-ip'
    nsgId: '/subscriptions/<SubscriptionID>/resourceGroups/production-rg/providers/Microsoft.Network/networkSecurityGroups/production-nsg'
    privateIp: privateIp
  }
}

module productionuctionVM './virtual-machine.bicep' = {
  name: 'productionVM'
  scope: resourceGroup('production-rg')
  dependsOn: [
    productionNIC
  ]
  params: {
    location: location
    networkInterfaceId: productionNIC.outputs.networkInterfaceId
    vmName: vmName
    adminUsername: adminUsername
  }
}
