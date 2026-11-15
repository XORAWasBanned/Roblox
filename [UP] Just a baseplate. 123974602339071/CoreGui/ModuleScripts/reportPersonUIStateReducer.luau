-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Reducers.reportPersonUIStateReducer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = require(v1.Components.Constants)
require(v1.Components.Types)
local v_u_3 = v_u_2.PlayerMenuActions
return function(p4, p5) -- name: reportPersonUIStateReducer
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = table.clone(p4)
	local v7 = p5.type
	if v7 == v_u_3.UpdateAbuseReason then
		v6.abuseReason = p5.abuseReason
		return v6
	end
	if v7 == v_u_3.UpdateComment then
		v6.comment = p5.comment
		return v6
	end
	if v7 == v_u_3.UpdateMethodOfAbuse then
		v6.playerObjects = {}
		v6.abuseReason = nil
		v6.methodOfAbuse = p5.methodOfAbuse
		return v6
	end
	if v7 == v_u_3.UpdateAbuser then
		v6.allegedAbuserId = p5.abuseId
		v6.allegedAbuser = p5.abuser
		return v6
	end
	if v7 == v_u_3.UpdatePlayerNameMap then
		v6.playerObjects = p5.playerObjects
		return v6
	end
	if v7 == v_u_3.SetVoiceEnabled then
		v6.isVoiceEnabled = p5.enabled
		return v6
	end
	if v7 == v_u_3.SetMenuOpenTimestamp then
		v6.menuOpenedUnixTimestampMilliseconds = p5.timestamp
		return v6
	end
	if v7 == v_u_3.ClearState then
		return table.clone(v_u_2.InitPersonUIState)
	end
	if v7 ~= v_u_3.SetShowModalSelector then
		if v7 == v_u_3.SetPreselectedPlayer then
			v6.preselectedPlayer = p5.player
		end
		return v6
	end
	v6.isModalSelectorShown = p5.isShown
	v6.modalSelectorCellData = p5.cellData
	return v6
end