-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.BlockPlayerItem
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = require(v1.Packages.Foundation).Checkbox
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent
local v7 = require(v6.Dependencies)
local v_u_8 = require(v7.Divider)
local v_u_9 = require(v7.ThemedTextLabel)
local v_u_10 = v3.Style.withStyle
local v_u_11 = v3.Core.ImageSet.ImageSetLabel
local v12 = v_u_2.PureComponent:extend("BlockPlayerItem")
v12.validateProps = v5.strictInterface({
	["layoutOrder"] = v5.optional(v5.number),
	["size"] = v5.UDim2,
	["text"] = v5.string,
	["description"] = v5.string,
	["icon"] = v5.union(v5.string, v5.table),
	["iconSize"] = v5.UDim2,
	["isDisabled"] = v5.optional(v5.boolean),
	["isCheckBoxSelected"] = v5.boolean,
	["onCheckBoxActivated"] = v5.callback
})
v12.defaultProps = {
	["isDisabled"] = false,
	["isCheckBoxSelected"] = false
}
function v12.init(p_u_13) -- name: init
	function p_u_13.onClicked()
		-- upvalues: (copy) p_u_13
		if p_u_13.props.onCheckBoxActivated and not p_u_13.props.isDisabled then
			p_u_13.props.onCheckBoxActivated(not p_u_13.props.isCheckBoxSelected)
		end
	end
end
function v12.render(p_u_14) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8
	local v_u_15 = p_u_14.props
	return v_u_10(function(p16)
		-- upvalues: (ref) v_u_2, (copy) v_u_15, (copy) p_u_14, (ref) v_u_11, (ref) v_u_4, (ref) v_u_9, (ref) v_u_8
		local _ = p16.Theme
		local v17 = v_u_2.createElement
		local v18 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = v_u_15.layoutOrder,
			["Size"] = v_u_15.size,
			["AutoButtonColor"] = false,
			["BorderSizePixel"] = 0,
			["Text"] = "",
			[v_u_2.Event.Activated] = p_u_14.onClicked
		}
		local v19 = {
			["BlockIcon"] = v_u_2.createElement(v_u_11, {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageTransparency"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Image"] = v_u_15.icon,
				["ImageTransparency"] = v_u_15.isDisabled and 0.5 or nil,
				["Position"] = UDim2.new(0, 16, 0.5, 0),
				["Size"] = v_u_15.iconSize
			}),
			["CheckBoxFrame"] = v_u_2.createElement("Frame", {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(1, 0.5),
				["Position"] = UDim2.new(1, -20, 0.5, 0),
				["Size"] = UDim2.fromOffset(24, 24)
			}, {
				["CheckBox"] = v_u_2.createElement(v_u_4, {
					["label"] = "",
					["isDisabled"] = nil,
					["onActivated"] = nil,
					["isChecked"] = nil,
					["isDisabled"] = v_u_15.isDisabled,
					["onActivated"] = v_u_15.onCheckBoxActivated,
					["isChecked"] = v_u_15.isCheckBoxSelected
				})
			})
		}
		local v20 = v_u_2.createElement
		local v21 = {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 60, 0.5, 0),
			["Size"] = UDim2.new(1, -124, 1, 0)
		}
		local v22 = {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 4)
			}),
			["Text"] = v_u_2.createElement(v_u_9, {
				["LayoutOrder"] = 1,
				["TextTransparency"] = nil,
				["AutomaticSize"] = nil,
				["fontKey"] = "SubHeader1",
				["themeKey"] = "TextEmphasis",
				["Text"] = nil,
				["TextTruncate"] = nil,
				["TextXAlignment"] = nil,
				["TextTransparency"] = v_u_15.isDisabled and 0.5 or nil,
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["Text"] = v_u_15.text,
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			}),
			["Description"] = v_u_2.createElement(v_u_9, {
				["LayoutOrder"] = 2,
				["TextTransparency"] = nil,
				["AutomaticSize"] = nil,
				["fontKey"] = "Footer",
				["TextWrapped"] = true,
				["themeKey"] = "TextDefault",
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["LineHeight"] = 1.25,
				["TextTransparency"] = v_u_15.isDisabled and 0.5 or nil,
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["Text"] = v_u_15.description,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		}
		v19.TextFrame = v20("Frame", v21, v22)
		v19.Divider = v_u_2.createElement(v_u_8, {
			["Position"] = UDim2.new(0, 0, 1, 0)
		})
		return v17("TextButton", v18, v19)
	end)
end
return v12