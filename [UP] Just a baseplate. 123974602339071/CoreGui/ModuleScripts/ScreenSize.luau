-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Reducer.ScreenSize
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.ScreenSizeUpdated)
return v2.createReducer(Vector2.new(0, 0), {
	[v4.name] = function(_, p5)
		return p5.screenSize
	end
})