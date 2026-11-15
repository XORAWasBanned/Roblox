-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("LocalizationService")
local v4 = v_u_2:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_6 = require(v1.Packages.Roact)
local v_u_7 = require(v1.Packages.Rodux)
local v_u_8 = require(v1.Packages.RoactRodux)
local v_u_9 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_10 = require(v1.Workspace.Packages.Localization).LocalizationProvider
local v_u_11 = require(v1.Packages.Foundation)
local v_u_12 = require(script.Components.AvatarEditorPromptsApp)
local v_u_13 = require(script.Reducer)
local v_u_14 = require(script.Thunks.GetGameName)
local v_u_15 = require(script.AvatarEditorPromptsPolicy)
local v_u_16 = require(script.RoactGlobalConfig)
local v_u_17 = require(script.ConnectAvatarEditorServiceEvents)
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18, (copy) v_u_16, (copy) v_u_6, (copy) v_u_7, (copy) v_u_13, (copy) v_u_14, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_11, (copy) v_u_15, (copy) v_u_5, (copy) v_u_12, (copy) v_u_2, (copy) v_u_17
	local v19 = v_u_18
	local v20 = setmetatable({}, v19)
	if v_u_16.propValidation then
		v_u_6.setGlobalConfig({
			["propValidation"] = true
		})
	end
	if v_u_16.elementTracing then
		v_u_6.setGlobalConfig({
			["elementTracing"] = true
		})
	end
	v20.store = v_u_7.Store.new(v_u_13, nil, { v_u_7.thunkMiddleware })
	v20.store:dispatch(v_u_14)
	local v21 = v_u_6.createElement
	local v22 = v_u_8.StoreProvider
	local v23 = {
		["store"] = v20.store
	}
	local v24 = {}
	local v25 = v_u_6.createElement
	local v26 = v_u_10
	local v27 = {
		["localization"] = v_u_9.new(v_u_3.RobloxLocaleId)
	}
	local v28 = {}
	local v29 = v_u_6.createElement
	local v30 = v_u_11.FoundationProvider
	local v31 = {
		["colorMode"] = v_u_11.Enums.ColorMode.Dark
	}
	local v32 = {}
	local v33 = v_u_6.createElement
	local v34 = v_u_15.Provider
	local v35 = {
		["policy"] = { v_u_15.Mapper }
	}
	local v36 = {
		["ThemeProvider"] = v_u_5({
			["AvatarEditorPromptsApp"] = v_u_6.createElement(v_u_12)
		})
	}
	v32.PolicyProvider = v33(v34, v35, v36)
	v28.FoundationProvider = v29(v30, v31, v32)
	v24.LocalizationProvider = v25(v26, v27, v28)
	local v37 = v21(v22, v23, v24)
	v20.root = v_u_6.createElement("Folder", {
		["Name"] = "AvatarEditorPromptsApp"
	}, v37)
	v20.element = v_u_6.mount(v20.root, v_u_2, "AvatarEditorPrompts")
	v20.serviceConnections = v_u_17(v20.store)
	return v20
end
return v_u_18.new()