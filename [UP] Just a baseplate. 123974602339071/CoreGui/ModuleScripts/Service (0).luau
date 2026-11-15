-- Path: CoreGui.RobloxGui.Modules.Chrome.Service
local v1 = game:GetService("CorePackages")
local v2 = script:FindFirstAncestor("Chrome")
local v3 = require(v1.Workspace.Packages.Chrome).Enabled()
assert(v3, "Chrome.Service should not be initialized when Chrome is not enabled")
return require(v2.ChromeShared.Service)