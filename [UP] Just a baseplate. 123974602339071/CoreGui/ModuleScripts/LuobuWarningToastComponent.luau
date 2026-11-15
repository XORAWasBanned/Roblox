-- Path: CoreGui.RobloxGui.Modules.LuobuWarningToast.LuobuWarningToastComponent
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = v4.App.ImageSet.Images
local v_u_6 = v4.App.Dialog.Toast
local v7 = v2:WaitForChild("RobloxGui")
local v8 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_9 = game:GetService("ContentProvider")
local v_u_10 = require(v7.Modules.Common.renderWithCoreScriptsStyleProvider)
local v11 = v_u_3.PureComponent:extend("LuobuWarningToastComponent")
local v_u_12 = v8:FormatByKey("InGame.CommonUI.Message.LuobuGameJoinWarning")
function v11.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_12
	p_u_13.state = {
		["isLoaded"] = false
	}
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_9, (copy) p_u_13
		local v_u_14 = v_u_5["icons/status/alert"].Image
		local function v15()
			-- upvalues: (ref) v_u_9, (copy) v_u_14
			v_u_9:PreloadAsync({ v_u_14 })
		end
		pcall(v15)
		p_u_13:setState({
			["isLoaded"] = true
		})
	end)
	function p_u_13.getToastContent()
		-- upvalues: (ref) v_u_5, (ref) v_u_12
		local v16 = {
			["iconImage"] = v_u_5["icons/status/alert"],
			["iconColorStyle"] = {
				["Color"] = nil,
				["Transparency"] = 0,
				["Color"] = Color3.new(1, 1, 1)
			},
			["toastTitle"] = v_u_12
		}
		return v16
	end
end
function v11.render(p17) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_10
	if not p17.state.isLoaded then
		return nil
	end
	local v18 = v_u_3.createElement
	local v19 = {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 9,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v20 = {}
	local v21 = v_u_3.createElement
	local v22 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v23 = {
		["WarningToast"] = v_u_3.createElement(v_u_6, {
			["duration"] = 5,
			["show"] = true,
			["toastContent"] = nil,
			["toastContent"] = p17.getToastContent()
		})
	}
	v20.Content = v21("Frame", v22, v23)
	return v_u_10({
		["RobloxCaptureNotificationGui"] = v18("ScreenGui", v19, v20)
	})
end
return v11