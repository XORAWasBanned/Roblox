-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PointerLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v2.UIBlox
local v6 = script.Parent.Parent
local v7 = require(v6.Resources.Assets)
local v_u_8 = require(v6.GlobalConfig)
local v_u_9 = v5.Core.ImageSet.ImageSetLabel
local v_u_10 = require(v1.Packages.Foundation).Image
local v_u_11 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_12 = {
	[Enum.UserInputType.MouseButton1] = v7.Images.Mouse1Press,
	[Enum.UserInputType.MouseButton2] = v7.Images.Mouse2Press,
	[Enum.UserInputType.MouseWheel] = v7.Images.MouseWheelScroll
}
local v_u_13 = v4.strictInterface({
	["input"] = v4.enum(Enum.UserInputType),
	["AnchorPoint"] = v4.optional(v4.Vector2),
	["Position"] = v4.optional(v4.UDim2),
	["LayoutOrder"] = v4.optional(v4.integer)
})
return function(p14) -- name: PointerLabel
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_3, (copy) v_u_10, (copy) v_u_9
	if v_u_8.propValidation then
		local v15 = v_u_13
		assert(v15(p14))
	end
	local v16 = v_u_12[p14.input]
	if not v_u_11 then
		return v_u_3.createElement(v_u_9, {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = nil,
			["Image"] = v16,
			["Size"] = UDim2.new(0, 36, 0, 36),
			["Position"] = p14.Position,
			["AnchorPoint"] = p14.AnchorPoint,
			["LayoutOrder"] = p14.LayoutOrder
		})
	end
	local v17 = v_u_3.createElement
	local v18 = v_u_10
	local v19 = {
		["Image"] = v16.Image,
		["imageRect"] = {
			["offset"] = v16.ImageRectOffset,
			["size"] = v16.ImageRectSize
		},
		["Size"] = UDim2.new(0, 36, 0, 36),
		["Position"] = p14.Position,
		["AnchorPoint"] = p14.AnchorPoint,
		["LayoutOrder"] = p14.LayoutOrder
	}
	return v17(v18, v19)
end