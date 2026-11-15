-- Path: CoreGui.RobloxGui.Modules.VR.VRBottomBar.VRBarSeparator
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v5 = v2.UIBlox
local v_u_6 = v2.Cryo
local v_u_7 = v5.App.SelectionImage.withSelectionCursorProvider
local v_u_8 = v5.App.SelectionImage.CursorKind
local v_u_9 = v5.Core.ImageSet.ImageSetButton
game:GetService("StarterGui")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
game:GetService("StarterPlayer")
v3.strictInterface({
	["AnchorPoint"] = v3.optional(v3.Vector2),
	["Position"] = v3.optional(v3.UDim2),
	["layoutOrder"] = v3.optional(v3.integer),
	["onActivated"] = v3.callback,
	["onSelectionGained"] = v3.optional(v3.callback),
	["onSelectionLost"] = v3.optional(v3.callback),
	["forwardRef"] = v3.optional(v3.table)
})
local function v_u_12(p10, p11) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_8
	return v_u_4.createElement(v_u_9, {
		["Visible"] = true,
		["AnchorPoint"] = p10.AnchorPoint,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/MenuBar/divider.png",
		["Position"] = UDim2.new(0, 1, 0, 1),
		["Size"] = UDim2.new(0, 28, 0, 36),
		["LayoutOrder"] = p10.layoutOrder,
		["SelectionImageObject"] = p11(v_u_8.RoundedRect),
		[v_u_4.Event.Activated] = function() end,
		[v_u_4.Event.SelectionGained] = p10.onSelectionGained,
		[v_u_4.Event.SelectionLost] = p10.onSelectionLost,
		[v_u_4.Ref] = p10.forwardRef
	})
end
local function v_u_15(p_u_13) -- name: VRBarSeparator
	-- upvalues: (copy) v_u_7, (copy) v_u_12
	return v_u_7(function(p14)
		-- upvalues: (ref) v_u_12, (copy) p_u_13
		return v_u_12(p_u_13, p14)
	end)
end
return v_u_4.forwardRef(function(p16, p17)
	-- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_6
	return v_u_4.createElement(v_u_15, v_u_6.Dictionary.join(p16, {
		["forwardRef"] = p17
	}))
end)