-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.DeveloperLockLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.GlobalConfig)
local v_u_7 = require(v5.Localization.withLocalization)
local v_u_8 = require(v5.Components.ThemedTextLabel)
local v_u_9 = v4.strictInterface({
	["Position"] = v4.UDim2,
	["Size"] = v4.UDim2,
	["AnchorPoint"] = v4.Vector2
})
return function(p10)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_8
	if v_u_6.propValidation then
		local v11 = v_u_9
		assert(v11(p10))
	end
	return v_u_7({
		["lockedText"] = "CoreScripts.InGameMenu.GameSettings.LockedByDeveloper"
	})(function(p12)
		-- upvalues: (ref) v_u_3, (ref) v_u_8
		return v_u_3.createElement(v_u_8, {
			["themeKey"] = "TextDefault",
			["fontKey"] = "CaptionBody",
			["TextTransparency"] = 0.5,
			["Text"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Text"] = p12.lockedText,
			["Size"] = UDim2.new(1, -72, 0.25, 0),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(0, 1),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Bottom
		})
	end)
end