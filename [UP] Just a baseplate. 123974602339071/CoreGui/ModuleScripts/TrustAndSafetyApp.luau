-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.TrustAndSafetyApp
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v2.Modules.Common.renderWithCoreScriptsStyleProvider)
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Actions.SetScreenSize)
local v_u_9 = require(v7.Components.ReportMenu)
local v_u_10 = require(v7.Components.ReportDialog)
local v_u_11 = require(v7.Components.ReportCategoryDialog)
local v_u_12 = require(v7.Components.ReportSentDialog)
local v_u_13 = require(v7.Components.Toast)
local v_u_14 = require(v2.Modules.VoiceChat.VoiceStateContext)
local v15 = v_u_3.PureComponent:extend("TrustAndSafetyApp")
v15.validateProps = v5.strictInterface({
	["setScreenSize"] = v5.callback
})
function v15.init(_) -- name: init end
function v15.render(p16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13, (copy) v_u_6
	local v17 = v_u_3.createElement
	local v18 = v_u_14.Provider
	local v19 = {}
	local v20 = v_u_3.createElement
	local v21 = {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 8,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		[v_u_3.Change.AbsoluteSize] = p16.props.setScreenSize
	}
	local v22 = {
		["Content"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["ReportCategoryDialog"] = v_u_3.createElement(v_u_11),
			["ReportMenu"] = v_u_3.createElement(v_u_9),
			["ReportDialog"] = v_u_3.createElement(v_u_10),
			["ReportSentDialog"] = v_u_3.createElement(v_u_12),
			["Toast"] = v_u_3.createElement(v_u_13)
		})
	}
	v19.Gui = v20("ScreenGui", v21, v22)
	return v_u_6({
		["VoiceStateContextProvider"] = v17(v18, {}, v19)
	})
end
return v4.UNSTABLE_connect2(nil, function(p_u_23)
	-- upvalues: (copy) v_u_8
	return {
		["setScreenSize"] = function(p24) -- name: setScreenSize
			-- upvalues: (copy) p_u_23, (ref) v_u_8
			p_u_23(v_u_8(p24.AbsoluteSize))
		end
	}
end)(v15)