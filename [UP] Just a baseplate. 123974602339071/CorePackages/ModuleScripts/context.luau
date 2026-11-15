-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism.context
local v1 = script.Parent.Parent
local v2 = {}
require(script.Parent.anyEntryTypes)
v2.parentEntrySlot = require(v1.wry.context).Slot.new()
local v3 = require(v1.wry.context)
v2.bindContext = v3.bind
v2.noContext = v3.noContext
v2.setTimeout = v3.setTimeout
return v2