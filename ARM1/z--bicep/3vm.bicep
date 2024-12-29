@description('Admin username for the virtual machines.')
param adminUsername string = 'azureuser'

@description('Admin password for the virtual machines.')
@secure()
param adminPassword string = 'Password123!@#'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The name of the Network Security Group')
param nsgName string = 'myNetworkSecurityGroup'

@description('The name of the Virtual Network')
param vnetName string = 'myVnet'

@description('The name of the Subnet')
param subnetName string = 'mySubnet'

@description('The address prefix for the Virtual Network')
param addressPrefix string = '10.0.0.0/16'

@description('The address prefix for the Subnet')
param subnetPrefix string = '10.0.0.0/24'

resource nsg 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'RDP'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '3389'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

resource publicIp1 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'myPublicIP1'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource publicIp2 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'myPublicIP2'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource publicIp3 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'myPublicIP3'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource nic1 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'myNic1'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          publicIPAddress: {
            id: publicIp1.id
          }
        }
      }
    ]
  }
}

resource nic2 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'myNic2'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          publicIPAddress: {
            id: publicIp2.id
          }
        }
      }
    ]
  }
}

resource nic3 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'myNic3'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          publicIPAddress: {
            id: publicIp3.id
          }
        }
      }
    ]
  }
}

resource vm1 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'VM111'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: 'VM111'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition-hotpatch'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic1.id
        }
      ]
    }
  }
}

resource vm2 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'VM222'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: 'VM222'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition-hotpatch'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic2.id
        }
      ]
    }
  }
}

resource vm3 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'VM333'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: 'VM333'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition-hotpatch'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic3.id
        }
      ]
    }
  }
}
