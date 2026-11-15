-- Path: CorePackages.Packages._Index.Graphing.Graphing.CanvasContext
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v3 = require(v2.React)
local v4 = require(v1.Util.CanvasUtil)
return v3.createContext(v4.createDefaultFunctions())