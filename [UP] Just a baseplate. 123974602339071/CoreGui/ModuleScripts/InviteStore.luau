-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.InviteStore
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = game:GetService("CoreGui").RobloxGui.Modules
local v4 = require(v3.Settings.Pages.ShareGame.AppReducer)
return v2.Store.new(v4, nil, { v2.thunkMiddleware })