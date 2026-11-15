-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameIcon
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v5 = v2.t
local v6 = script.Parent.Parent
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_8 = v4.App.ImageSet.Images
local v_u_9 = require(v6.Components.AssetImage)
local v_u_10 = v4.Core.ImageSet.ImageSetLabel
local v_u_11 = require(v1.Packages.Foundation).Image
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_13 = require(v6.Components.getGameIconRequestSize)
local v14 = v_u_3.PureComponent:extend("GameIcon")
v14.validateProps = v5.strictInterface({
	["gameId"] = v5.number,
	["iconSize"] = v5.numberMin(0),
	["layoutOrder"] = v5.optional(v5.number),
	["cornerRadius"] = v5.optional(v5.UDim),
	["Position"] = v5.optional(v5.UDim2),
	["AnchorPoint"] = v5.optional(v5.Vector2)
})
function v14.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8
	local v_u_16 = p_u_15.props.iconSize
	local v17 = v_u_13(v_u_16)
	local v18 = p_u_15.props.gameId
	local v_u_19 = p_u_15.props.cornerRadius
	local v20 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(v18, v17, v17)
	if v18 == 0 then
		local v_u_21 = v_u_16 > 44 and 44 or v_u_16
		return v_u_7(function(p22)
			local v23 = {}
			local v24 = {
				["PlaceHolder"] = {
					["Color"] = p22.Color.Common.Shimmer.Color3,
					["Transparency"] = p22.Color.Common.Shimmer.Transparency
				},
				["UIDefault"] = {
					["Color"] = p22.Color.Shift.Shift_200.Color3,
					["Transparency"] = p22.Color.Shift.Shift_200.Transparency
				}
			}
			v23.Theme = v24
			return v23
		end, function(p25)
			-- upvalues: (ref) v_u_3, (ref) v_u_9, (copy) v_u_16, (copy) p_u_15, (ref) v_u_12, (ref) v_u_11, (ref) v_u_21, (copy) v_u_19, (ref) v_u_10, (ref) v_u_8
			local v26 = v_u_3.createElement
			local v27 = v_u_9.Label
			local v28 = {
				["imageKey"] = "RoundedRect",
				["Size"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["LayoutOrder"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = UDim2.fromOffset(v_u_16, v_u_16),
				["ImageColor3"] = p25.Theme.PlaceHolder.Color,
				["ImageTransparency"] = p25.Theme.PlaceHolder.Transparency,
				["LayoutOrder"] = p_u_15.props.layoutOrder,
				["Position"] = p_u_15.props.Position,
				["AnchorPoint"] = p_u_15.props.AnchorPoint
			}
			local v29 = {}
			local v30
			if v_u_12 then
				v30 = v_u_3.createElement(v_u_11, {
					["Size"] = nil,
					["Position"] = nil,
					["Image"] = "icons/imageUnavailable",
					["imageStyle"] = nil,
					["AnchorPoint"] = nil,
					["cornerRadius"] = nil,
					["Size"] = UDim2.fromOffset(v_u_21, v_u_21),
					["Position"] = UDim2.fromScale(0.5, 0.5),
					["imageStyle"] = {
						["Color3"] = p25.Theme.UIDefault.Color,
						["Transparency"] = p25.Theme.UIDefault.Transparency
					},
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["cornerRadius"] = v_u_19
				})
			else
				local v31 = v_u_3.createElement
				local v32 = v_u_10
				local v33 = {
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Position"] = nil,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["AnchorPoint"] = nil,
					["Size"] = UDim2.fromOffset(v_u_21, v_u_21),
					["Position"] = UDim2.fromScale(0.5, 0.5),
					["Image"] = v_u_8["icons/imageUnavailable"],
					["ImageColor3"] = p25.Theme.UIDefault.Color,
					["ImageTransparency"] = p25.Theme.UIDefault.Transparency,
					["AnchorPoint"] = Vector2.new(0.5, 0.5)
				}
				local v34 = {}
				local v35
				if v_u_19 and v_u_19 ~= UDim.new(0, 0) then
					local v36 = {
						["CornerRadius"] = v_u_19
					}
					v35 = v_u_3.createElement("UICorner", v36) or nil
				else
					v35 = nil
				end
				v34.UICorner = v35
				v30 = v31(v32, v33, v34)
			end
			v29.PlaceholderIcon = v30
			return v26(v27, v28, v29)
		end)
	end
	local v37 = v_u_3.createElement
	local v38 = "ImageLabel"
	local v39 = {
		["Image"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Image"] = v20,
		["Size"] = UDim2.fromOffset(v_u_16, v_u_16),
		["LayoutOrder"] = p_u_15.props.layoutOrder,
		["Position"] = p_u_15.props.Position,
		["AnchorPoint"] = p_u_15.props.AnchorPoint
	}
	local v40 = {}
	local v41
	if v_u_19 and v_u_19 ~= UDim.new(0, 0) then
		v41 = v_u_3.createElement("UICorner", {
			["CornerRadius"] = v_u_19
		}) or nil
	else
		v41 = nil
	end
	v40.UICorner = v41
	return v37(v38, v39, v40)
end
return v14