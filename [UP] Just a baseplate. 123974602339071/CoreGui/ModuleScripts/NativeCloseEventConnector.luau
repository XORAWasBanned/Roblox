-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.NativeCloseEventConnector
local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Thunks.OpenEducationalPopup)
local v_u_10 = require(v8.Utility.ExternalEventConnection)
local v11 = require(v8.InGameMenuPolicy)
local v_u_12 = require(v8.Utility.UserLocalStore)
local v_u_13 = require(v8.Utility.SendAnalytics)
local v_u_14 = require(v8.Resources.Constants)
local v15 = v_u_5.PureComponent:extend("NativeCloseEventConnector")
v15.validateProps = v7.strictInterface({
	["isEducationalPopupEnabled"] = v7.boolean,
	["maxDisplayCount"] = v7.integer,
	["openEducationalPopup"] = v7.optional(v7.callback)
})
function v15.init(p_u_16) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_1, (copy) v_u_13, (copy) v_u_14
	function p_u_16.onNativeCloseConnect()
		-- upvalues: (copy) p_u_16, (ref) v_u_2, (ref) v_u_12, (ref) v_u_1, (ref) v_u_13, (ref) v_u_14
		if p_u_16.props.isEducationalPopupEnabled then
			v_u_2:ReportCounter("LeaveGame_NativeClose", 1)
			local v17 = v_u_12.new()
			p_u_16.props.openEducationalPopup(v_u_1, v17, p_u_16.props.maxDisplayCount)
		end
		v_u_13(v_u_14.AnalyticsInGameMenuName, "LeaveGame_NativeClose", {})
	end
end
function v15.render(p18) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_1
	return v_u_5.createElement(v_u_10, {
		["event"] = v_u_1.NativeClose,
		["callback"] = p18.onNativeCloseConnect
	})
end
local v20 = v11.connect(function(p19, _)
	return {
		["isEducationalPopupEnabled"] = p19.enableEducationalPopup(),
		["maxDisplayCount"] = p19.educationalPopupMaxDisplayCount()
	}
end)(v15)
return v6.UNSTABLE_connect2(nil, function(p_u_21)
	-- upvalues: (copy) v_u_9
	return {
		["openEducationalPopup"] = function(p22, p23, p24) -- name: openEducationalPopup
			-- upvalues: (copy) p_u_21, (ref) v_u_9
			return p_u_21(v_u_9(p22, p23, p24))
		end
	}
end)(v20)