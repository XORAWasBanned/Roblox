-- Path: CorePackages.Packages._Index.Merge.Merge
local v1 = script.Parent
local v2 = require(v1.LuauPolyfill).Object
local v3 = {}
local v4 = require(script["merge-resolvers"])
v2.assign(v3, v4)
local v5 = require(script["typedefs-mergers"])
v2.assign(v3, v5)
local v6 = require(script.extensions)
v2.assign(v3, v6)
return v3