param location string = resourceGroup().location
param staticAppName string
param sku string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticAppName
  location: location
  sku: {
    name: sku
  }
  properties: {
    repositoryUrl: 'https://github.com/<kulkarnisreenidhi>/<azure-static-site-demo>'
    branch: 'main'
    buildProperties: {
      appLocation: "/"         // root folder
      apiLocation: ""          // no backend API
      outputLocation: "/"      // output folder
    }
  }
}

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: '${staticAppName}-logs'
  location: location
  sku: {
    name: 'PerGB2018'
  }
  properties: {
    retentionInDays: 30
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${staticAppName}-ai'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

output staticSiteUrl string = staticWebApp.properties.defaultHostname
