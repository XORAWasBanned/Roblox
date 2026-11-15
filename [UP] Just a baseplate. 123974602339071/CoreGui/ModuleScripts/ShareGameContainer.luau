-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareGameContainer
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("HttpRbxApiService")
local v_u_4 = game:GetService("Players")
local v5 = v1.RobloxGui.Modules
local v6 = v5.Settings.Pages.ShareGame
local v_u_7 = require(v2.Packages.Roact)
local v8 = require(v2.Packages.RoactRodux)
local v_u_9 = require(v5.Common.httpRequest)
local v10 = require(v6.Components.ShareGamePageFrame)
local v_u_11 = require(v6.Constants)
local v_u_12 = require(v6.Thunks.FetchUserFriends)
local v_u_13 = require(v6.Actions.ClosePage)
local v14 = v_u_7.PureComponent:extend("ShareGameContainer")
v14.defaultProps = {
	["skeletonComponent"] = v10
}
function v14.init(p15) -- name: init
	p15.props.reFetch(p15.props.requestImpl)
end
function v14.render(p16) -- name: render
	-- upvalues: (copy) v_u_7
	return v_u_7.createElement(p16.props.skeletonComponent, p16.props)
end
return v8.UNSTABLE_connect2(function(p17, _)
	return {
		["deviceLayout"] = p17.DeviceInfo.DeviceLayout,
		["searchAreaActive"] = p17.ConversationsSearch.SearchAreaActive,
		["searchText"] = p17.ConversationsSearch.SearchText
	}
end, function(p_u_18)
	-- upvalues: (copy) v_u_13, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_3, (copy) v_u_12
	return {
		["closePage"] = function() -- name: closePage
			-- upvalues: (copy) p_u_18, (ref) v_u_13, (ref) v_u_11
			p_u_18(v_u_13(v_u_11.PageRoute.SHARE_GAME))
		end,
		["reFetch"] = function(p19) -- name: reFetch
			-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_3, (copy) p_u_18, (ref) v_u_12
			local v20 = v_u_4.LocalPlayer.UserId
			local v21 = tostring(v20)
			p_u_18(v_u_12(p19 or v_u_9(v_u_3), v21))
		end
	}
end)(v14)