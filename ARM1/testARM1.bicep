resource myNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: 'myNetworkSecurityGroup'
  location: resourceGroup().location
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

resource myVnet 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: 'myVnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'mySubnet'
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: myNetworkSecurityGroup.id
          }
        }
      }
    ]
  }
}

resource myPublicIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: 'myPublicIP'
  location: resourceGroup().location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource myNic 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: 'myNic'
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'myVnet', 'mySubnet')
          }
          publicIPAddress: {
            id: myPublicIP.id
          }
        }
      }
    ]
  }
  dependsOn: [
    myVnet
  ]
}

resource myVM 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'myVM'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: 'myVM'
      adminUsername: 'azureuser'
      adminPassword: 'Password123!'
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
          id: myNic.id
        }
      ]
    }
  }
}


