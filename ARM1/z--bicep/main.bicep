resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'name'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource Identifier 'Provider/ParentType/ChildType@Version' = {
  name: 
  properties: {
    
  }
}

param N12 string

@description('')
@batchSize()
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: N12
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

"[bicep]": {
"editor.defaultFormatter": "ms-azuretools.vscode-bicep"
}

// https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI
//https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/file
