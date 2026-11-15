-- Path: CoreGui.RobloxGui.Modules.SelfView.SelfViewTooltipFTUX
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("CoreGui")
v_u_3:WaitForChild("RobloxGui")
local v_u_4 = require(v1.Packages.React)
local v5 = require(v1.Packages.UIBlox)
local v_u_6 = v5.App.Dialog.TooltipV2.withTooltip
local v_u_7 = v5.App.Dialog.Enum.TooltipOrientation
local v_u_8 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_9 = require(v1.Packages.Promise)
return function(p_u_10)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_2, (copy) v_u_9, (copy) v_u_6
	local v11, v_u_12 = v_u_4.useState(true)
	local v_u_13 = p_u_10.fallbackText
	local function v14()
		-- upvalues: (ref) v_u_13, (ref) v_u_8, (copy) p_u_10
		v_u_13 = v_u_8:FormatByKey(p_u_10.translationKey)
	end
	pcall(v14)
	local v15 = {
		["textAlignment"] = Enum.TextXAlignment.Left,
		["bodyText"] = v_u_13
	}
	local v16 = {
		["active"] = nil,
		["guiTarget"] = nil,
		["DisplayOrder"] = 10,
		["preferredOrientation"] = nil,
		["active"] = v11,
		["guiTarget"] = v_u_3,
		["preferredOrientation"] = v_u_7.Left
	}
	local v_u_17 = nil
	v_u_17 = v_u_2.InputBegan:Connect(function(p18)
		-- upvalues: (copy) v_u_12, (ref) v_u_17
		local v19 = p18.UserInputType
		if v19 == Enum.UserInputType.MouseButton1 or v19 == Enum.UserInputType.Touch then
			v_u_12(false)
			if v_u_17 then
				v_u_17:Disconnect()
				v_u_17 = nil
			end
		end
	end)
	v_u_9.delay(p_u_10.tooltipLifetime):andThen(function()
		-- upvalues: (copy) v_u_12, (ref) v_u_17
		v_u_12(false)
		if v_u_17 then
			v_u_17:Disconnect()
			v_u_17 = nil
		end
	end)
	return v_u_6(v15, v16, function(p_u_20)
		-- upvalues: (ref) v_u_4
		local function v22(p21)
			-- upvalues: (copy) p_u_20
			p_u_20(p21)
		end
		return v_u_4.createElement("Frame", {
			["Visible"] = false,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0),
			[v_u_4.Change.AbsoluteSize] = v22,
			[v_u_4.Change.AbsolutePosition] = v22
		})
	end)
end