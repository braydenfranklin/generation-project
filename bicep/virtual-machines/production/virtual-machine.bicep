param location string = 'australiaeast'
param networkInterfaceId string
param vmName string = 'production-vm'
param adminUsername string = 'prod-admin'
param datadiskId string = '/subscriptions/<SubscriptionID>/resourceGroups/cloudby.click/providers/Microsoft.Compute/disks/production-datadisk'

resource productionVM 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vmName
  location: location
  plan: {
    name: 'rockylinux-9'
    publisher: 'erockyenterprisesoftwarefoundationinc1653071250513'
    product: 'rockylinux-9'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2ms'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: '<PublicKey>'
            }
          ]
        }
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'erockyenterprisesoftwarefoundationinc1653071250513'
        offer: 'rockylinux-9'
        sku: 'rockylinux-9'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          lun: 0 
          createOption: 'Attach' 
          managedDisk: {
            id: datadiskId
          }
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaceId
        }
      ]
    }
  }
}
