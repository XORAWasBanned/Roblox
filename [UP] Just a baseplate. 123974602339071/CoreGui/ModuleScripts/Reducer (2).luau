-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(v1.Workspace.Packages.CrossExperienceVoice)
local v4 = require(v1.Workspace.Packages.CrossExperience)
local v5 = v4.Middlewares.createPersistenceMiddleware
local v6 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local v7 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local v8 = script.Parent
local v9 = require(v8.Flags.FFlagTopBarDeprecateCoreGuiRodux)
local v10 = require(v8.Flags.FFlagTopBarDeprecateChatRodux)
local v11 = require(script.DisplayOptions)
local v12 = require(script.CoreGuiEnabled)
local v13 = require(script.Health)
local v14 = require(script.MoreMenu)
local v15 = require(script.Chat)
local v16 = require(script.Respawn)
local v17 = require(script.GameInfo)
local v18 = {
	["displayOptions"] = v11
}
if v9 then
	v12 = nil
end
v18.coreGuiEnabled = v12
if v6 then
	v13 = nil
end
v18.health = v13
v18.moreMenu = v14
if v10 then
	v15 = nil
end
v18.chat = v15
v18.respawn = v16
v18.gameInfo = v17
if v7() then
	local v19 = v5({
		["storeKey"] = v4.Constants.STORAGE_CEV_STORE_KEY
	}).restore()
	local v20
	if v19 and (v19.Squad and v19.Squad.CrossExperienceVoice) then
		v20 = v19.Squad.CrossExperienceVoice
	else
		v20 = nil
	end
	v18.Squad = v2.combineReducers({
		["CrossExperienceVoice"] = v3.installReducer(v20)
	})
end
return v2.combineReducers(v18)