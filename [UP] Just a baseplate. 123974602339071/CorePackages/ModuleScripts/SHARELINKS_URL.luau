-- Path: CorePackages.Packages._Index.NetworkingShareLinks.NetworkingShareLinks.SHARELINKS_URL
local v1 = require(script.Parent.buildApiSiteUrl)
return string.format("%s%s", v1("apis"), "sharelinks")