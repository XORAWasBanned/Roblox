-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ViewportOverlay
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.t
local v_u_6 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Resources.Constants)
local v_u_9 = require(v7.GlobalConfig)
local v_u_10 = require(v7.Thunks.CloseMenu)
local v_u_11 = Vector2.new(0, 0)
local v_u_12 = v5.strictInterface({
	["currentPage"] = v5.string,
	["open"] = v5.boolean,
	["onActivated"] = v5.callback,
	["occupiedWidth"] = v5.number,
	["screenSize"] = v5.Vector2
})
return v4.UNSTABLE_connect2(function(p13, _)
	return {
		["currentPage"] = nil,
		["open"] = nil,
		["occupiedWidth"] = 464,
		["screenSize"] = nil,
		["currentPage"] = p13.menuPage,
		["open"] = p13.isMenuOpen,
		["screenSize"] = p13.screenSize
	}
end, function(p_u_14)
	-- upvalues: (copy) v_u_10
	return {
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_14, (ref) v_u_10
			p_u_14(v_u_10)
		end
	}
end)(function(p_u_15) -- name: ViewportOverlay
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3
	if v_u_9.propValidation then
		local v16 = v_u_12
		assert(v16(p_u_15))
	end
	if p_u_15.screenSize == v_u_11 then
		return nil
	end
	local v_u_17 = p_u_15.currentPage == v_u_8.InitalPageKey
	return v_u_6(function(p18)
		local v19 = {}
		local v20 = {
			["Overlay"] = {
				["Color"] = p18.Color.Common.Scrim.Color3,
				["Transparency"] = p18.Color.Common.Scrim.Transparency
			}
		}
		v19.Theme = v20
		return v19
	end, function(p21)
		-- upvalues: (ref) v_u_3, (copy) v_u_17, (copy) p_u_15
		local v22 = v_u_3.createElement
		local v23 = "Frame"
		local v24 = {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Visible"] = nil,
			["ZIndex"] = 0,
			["BackgroundColor3"] = p21.Theme.Overlay.Color,
			["BackgroundTransparency"] = p21.Theme.Overlay.Transparency,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v25 = not v_u_17
		if v25 then
			v25 = p_u_15.open
		end
		v24.Visible = v25
		local v26 = {
			["InputCapturer"] = v_u_3.createElement("TextButton", {
				["AnchorPoint"] = Vector2.new(1, 0),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(1, 0, 0, 0),
				["Size"] = UDim2.new(1, -p_u_15.occupiedWidth, 1, 0),
				["Text"] = "",
				[v_u_3.Event.Activated] = p_u_15.onActivated
			})
		}
		return v22(v23, v24, v26)
	end)
end)