-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.TitleBarContainer
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_6 = v5.Hooks.useLeaderboardStore
local v_u_7 = require(v2.Components.PresentationCommon.TitleBarView)
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
return v_u_3.memo(function(p9) -- name: TitleBarContainer
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7
	local v10 = v_u_6().getGameStatsList()
	local v11
	if v_u_8 then
		v11 = nil
	else
		v11 = v_u_4.useSignalState(v10.getCount)
	end
	local v12 = v_u_3.createElement
	local v13 = v_u_7
	local v14 = {
		["gameStats"] = v10
	}
	if v_u_8 then
		v11 = nil
	end
	v14.gameStatsCount = v11
	v14.size = p9.size
	v14.entrySizeX = p9.entrySizeX
	v14.layoutOrder = p9.layoutOrder
	v14.contentsVisible = p9.contentsVisible
	v14.isSmallTouchDevice = p9.isSmallTouchDevice
	v14.showDivider = p9.showDivider
	v14.showBackground = p9.showBackground
	v14.backgroundTransparency = p9.backgroundTransparency
	v14.useCustomTextColor = p9.useCustomTextColor
	v14.customTextColor = p9.customTextColor
	v14.headerPaddingLeft = p9.headerPaddingLeft
	return v12(v13, v14)
end)