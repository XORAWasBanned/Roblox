-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Reducer.GameName
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = require(v1.Packages.Rodux)
v2:WaitForChild("RobloxGui")
local v4 = require(v1.Workspace.Packages.RobloxTranslator)
local v5 = script.Parent.Parent.Actions
local v6 = require(v5.GameNameFetched)
local v7 = v4:FormatByKey("CoreScripts.AvatarEditorPrompts.GameNamePlaceHolder")
return v3.createReducer(v7, {
	[v6.name] = function(_, p8)
		return p8.gameName
	end
})