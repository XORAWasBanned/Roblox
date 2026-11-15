-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlEntryHeader
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.GlobalConfig)
local v_u_7 = require(v5.Components.ThemedTextLabel)
local v_u_8 = require(v5.Localization.withLocalization)
local v_u_9 = v4.strictInterface({
	["title"] = v4.string,
	["LayoutOrder"] = v4.integer
})
return function(p_u_10) -- name: ControlEntry
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7
	if v_u_6.propValidation then
		local v11 = v_u_9
		assert(v11(p_u_10))
	end
	return v_u_8({
		["title"] = p_u_10.title
	})(function(p12)
		-- upvalues: (ref) v_u_3, (copy) p_u_10, (ref) v_u_7
		local v13 = v_u_3.createElement
		local v14 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 45),
			["LayoutOrder"] = p_u_10.LayoutOrder
		}
		local v15 = {
			["HeaderText"] = v_u_3.createElement(v_u_7, {
				["fontKey"] = "CaptionHeader",
				["themeKey"] = "TextMuted",
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = p12.title,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Position"] = UDim2.new(0, 0, 0, 20),
				["Size"] = UDim2.new(1, 0, 0, 17)
			})
		}
		return v13("Frame", v14, v15)
	end)
end