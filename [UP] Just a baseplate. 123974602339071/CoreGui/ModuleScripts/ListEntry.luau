-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.ItemsList.ListEntry
local v1 = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.t)
local v5 = require(v1.Packages.UIBlox)
local v6 = require(v1.Packages.Foundation)
local v_u_7 = require(v1.Workspace.Packages.Style).GetTextSize
local v_u_8 = v6.Utility.normalizeFontFace
local v_u_9 = v6.Utility.Flags.FoundationFontFaceMigration
local v_u_10 = require(v1.Workspace.Packages.SharedFlags).FFlagFontFaceAX and v_u_9
local v11 = require(v1.Packages.AvatarExperienceDeps)
local v_u_12 = require(v1.Workspace.Packages.AppCommonLib).Text
local v_u_13 = v11.RoactFitComponents
local v_u_14 = v_u_13.FitTextLabel
local v_u_15 = v5.Style.withStyle
local v_u_16 = v_u_3.PureComponent:extend("ListEntry")
v_u_16.validateProps = v4.strictInterface({
	["text"] = v4.string,
	["hasBullet"] = v4.boolean,
	["layoutOrder"] = v4.integer,
	["positionChangedCallback"] = v4.optional(v4.callback),
	["NextSelectionLeft"] = v4.optional(v4.table),
	["NextSelectionRight"] = v4.optional(v4.table),
	["NextSelectionUp"] = v4.optional(v4.table),
	["NextSelectionDown"] = v4.optional(v4.table),
	["forwardRef"] = v4.optional(v4.table)
})
function v_u_16.render(p_u_17) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12, (copy) v_u_3, (copy) v_u_13, (copy) v_u_8, (copy) v_u_14, (copy) v_u_10
	return v_u_15(function(p18)
		-- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) v_u_12, (copy) p_u_17, (ref) v_u_3, (ref) v_u_13, (ref) v_u_8, (ref) v_u_14, (ref) v_u_10
		local v19 = p18.Font
		local v20 = p18.Theme
		local v21 = v19.CaptionBody.Font
		local v22 = v19.BaseSize * v19.CaptionBody.RelativeSize
		local v23
		if v_u_9 then
			v23 = v_u_7("\226\128\162 ", v22, p18.Tokens.Typography.BodySmall.Font, Vector2.new(10000, 10000)).X
		else
			v23 = v_u_12.GetTextWidth("\226\128\162 ", v21, v22)
		end
		local v24 = p_u_17.props.forwardRef
		local v25 = v_u_3.createElement
		local v26 = v_u_13.FitFrameVertical
		local v27 = {
			["width"] = UDim.new(1, 0),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = p_u_17.props.layoutOrder,
			[v_u_3.Change.AbsolutePosition] = p_u_17.props.positionChangedCallback,
			["NextSelectionLeft"] = p_u_17.props.NextSelectionLeft,
			["NextSelectionRight"] = p_u_17.props.NextSelectionRight,
			["NextSelectionUp"] = p_u_17.props.NextSelectionUp,
			["NextSelectionDown"] = p_u_17.props.NextSelectionDown,
			[v_u_3.Ref] = v24
		}
		local v28 = {}
		local v29 = p_u_17.props.hasBullet
		if v29 then
			local v30 = v_u_3.createElement
			local v31 = "TextLabel"
			local v32 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Text"] = "\226\128\162 ",
				["Font"] = nil,
				["FontFace"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextXAlignment"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.fromOffset(v23, v22)
			}
			local v33
			if v_u_9 then
				v33 = nil
			else
				v33 = v21
			end
			v32.Font = v33
			local v34
			if v_u_9 then
				v34 = v_u_8(p18.Tokens.Typography.BodySmall.Font)
			else
				v34 = nil
			end
			v32.FontFace = v34
			v32.TextSize = v22
			v32.TextColor3 = v20.TextDefault.Color
			v32.TextTransparency = v20.TextDefault.Transparency
			v32.TextXAlignment = Enum.TextXAlignment.Left
			v29 = v30(v31, v32)
		end
		v28.Bullet = v29
		local v35 = v_u_3.createElement
		local v36 = v_u_14
		local v37 = {
			["width"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = 2,
			["width"] = UDim.new(1, p_u_17.props.hasBullet and -v23 or 0),
			["Text"] = p_u_17.props.text
		}
		if v_u_10 then
			v21 = v_u_8(p18.Tokens.Typography.BodySmall.Font)
		end
		v37.Font = v21
		v37.TextSize = v22
		v37.TextColor3 = v20.TextDefault.Color
		v37.TextTransparency = v20.TextDefault.Transparency
		v37.TextXAlignment = Enum.TextXAlignment.Left
		v28.Text = v35(v36, v37)
		return v25(v26, v27, v28)
	end)
end
return v_u_3.forwardRef(function(p38, p39)
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_2
	return v_u_3.createElement(v_u_16, v_u_2.Dictionary.join(p38, {
		["forwardRef"] = p39
	}))
end)