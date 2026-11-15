-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider)
local v_u_5 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_6 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_7 = require(v1.Packages.Roact)
local v_u_8 = require(v1.Packages.Rodux)
local v_u_9 = require(v1.Packages.RoactRodux)
local v_u_10 = require(script.Components.PublishAssetPromptApp)
local v_u_11 = require(script.Reducer)
local v_u_12 = require(script.ConnectAssetServiceEvents)
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_13.new() -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_10, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_12
	local v14 = v_u_13
	local v15 = setmetatable({}, v14)
	local v16 = v_u_7.createElement(v_u_10)
	v15.store = v_u_8.Store.new(v_u_11, nil, { v_u_8.thunkMiddleware })
	local v17 = v_u_7.createElement
	local v18 = v_u_9.StoreProvider
	local v19 = {
		["store"] = v15.store
	}
	local v20 = {}
	local v21 = v_u_4
	local v22 = {
		["LocalizationProvider"] = v_u_7.createElement(v_u_6, {
			["localization"] = v_u_5.new(v_u_3.RobloxLocaleId)
		}, {
			["PublishAssetPromptApp"] = v16
		})
	}
	v20.ThemeProvider = v21(v22)
	local v23 = v17(v18, v19, v20)
	v15.root = v_u_7.createElement("Folder", {
		["Name"] = "PublishAssetPrompt"
	}, v23)
	v15.element = v_u_7.mount(v15.root, v_u_2, "PublishAssetPrompt")
	v15.serviceConnections = v_u_12(v15.store)
	return v15
end
return v_u_13.new()