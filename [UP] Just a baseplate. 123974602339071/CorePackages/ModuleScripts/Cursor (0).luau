-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.Cursors.Cursor
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.FoundationImages)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Images
local v_u_6 = require(script.Parent.Parent.CursorComponent)
local v_u_7 = require(v1.Enums.CursorType)
require(v1.Enums.ColorNamespace)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v9 = script.Parent.Parent.Parent.Parent.Components
local v_u_10 = require(v9.Image.ImageSet.getScaledSlice)
local v_u_11 = {
	[v_u_7.BulletUp] = {
		["Tag"] = "SlicedImage",
		["Image"] = "component_assets/bulletUp_17_stroke_3",
		["SliceCenter"] = nil,
		["InsetAdjustment"] = nil,
		["SliceCenter"] = Rect.new(8, 8, 9, 9),
		["InsetAdjustment"] = Vector2.new(2, 2)
	},
	[v_u_7.BulletDown] = {
		["Tag"] = "SlicedImage",
		["Image"] = "component_assets/bulletDown_17_stroke_3",
		["SliceCenter"] = nil,
		["InsetAdjustment"] = nil,
		["SliceCenter"] = Rect.new(8, 8, 9, 9),
		["InsetAdjustment"] = Vector2.new(2, 2)
	},
	[v_u_7.InputFields] = {
		["Tag"] = "SlicedImage",
		["Image"] = "component_assets/circle_22_stroke_3",
		["SliceCenter"] = nil,
		["InsetAdjustment"] = nil,
		["SliceCenter"] = Rect.new(11, 11, 12, 12),
		["InsetAdjustment"] = Vector2.new(7, 0)
	},
	[v_u_7.SelectionCell] = {
		["Tag"] = "SlicedImage",
		["Image"] = "component_assets/square_7_stroke_3",
		["SliceCenter"] = nil,
		["InsetAdjustment"] = nil,
		["Padding"] = 50,
		["SliceCenter"] = Rect.new(3.5, 3.5, 3.5, 3.5),
		["InsetAdjustment"] = Vector2.new(2, 2)
	},
	[v_u_7.SelectedKnob] = {
		["Tag"] = "FixedSizeImage",
		["Image"] = "component_assets/circle_42_stroke_3",
		["Size"] = 42
	},
	[v_u_7.UnselectedKnob] = {
		["Tag"] = "FixedSizeImage",
		["Image"] = "component_assets/circle_52_stroke_3",
		["Size"] = 52
	},
	[v_u_7.InputButton] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 11,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 11)
	},
	[v_u_7.RoundedRect] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 9,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 8)
	},
	[v_u_7.RoundedRectNoInset] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 8)
	},
	[v_u_7.RoundedSlot] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 7)
	},
	[v_u_7.SkinToneCircle] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0.5, 0)
	},
	[v_u_7.SmallPill] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 15)
	},
	[v_u_7.LargePill] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 26)
	},
	[v_u_7.Square] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 2,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 0)
	},
	[v_u_7.Toggle] = {
		["Tag"] = "RoundedImage",
		["CornerRadius"] = nil,
		["Offset"] = 0,
		["BorderWidth"] = 3,
		["CornerRadius"] = UDim.new(0, 13)
	}
}
return v_u_4.forwardRef(function(p12, p13)
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_10, (copy) v_u_6
	local v14 = v_u_8()
	local v15 = p12.colorNamespace
	if p12.cursorType == v_u_7.NavHighlight then
		return v_u_4.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BorderSizePixel"] = 1,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0,
			["BorderColor3"] = nil,
			["ref"] = nil,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, -3),
			["Size"] = UDim2.new(1, 0, 0, 3),
			["BackgroundColor3"] = v14[v15].Selection.Start.Color3,
			["BorderColor3"] = v14[v15].Selection.Start.Color3,
			["ref"] = p13
		})
	elseif p12.cursorType == v_u_7.Invisible then
		return v_u_4.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["ref"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["ref"] = p13
		})
	else
		local v16 = v_u_11[p12.cursorType]
		if v16.Tag == "FixedSizeImage" then
			local v17 = UDim2.fromOffset(v16.Size, v16.Size)
			local v18 = UDim2.new(0.5, -v17.X.Offset / 2, 0.5, -v17.Y.Offset / 2)
			return v_u_4.createElement("ImageLabel", {
				["Image"] = nil,
				["BackgroundTransparency"] = 1,
				["ImageRectOffset"] = nil,
				["ImageRectSize"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["ref"] = nil,
				["Image"] = v_u_5[v16.Image].Image,
				["ImageRectOffset"] = v_u_5[v16.Image].ImageRectOffset,
				["ImageRectSize"] = v_u_5[v16.Image].ImageRectSize,
				["Size"] = v17,
				["Position"] = v18,
				["ImageColor3"] = v14[v15].Selection.Start.Color3,
				["ImageTransparency"] = v14[v15].Selection.Start.Transparency,
				["ref"] = p13
			})
		elseif v16.Tag == "SlicedImage" then
			local v19 = v16.InsetAdjustment
			local v20 = UDim2.new(1, v19.X * 2, 1, v19.Y * 2)
			local v21 = v_u_10(v16.SliceCenter)
			local v22
			if v16.Padding then
				v22 = v_u_4.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, v16.Padding),
					["PaddingBottom"] = UDim.new(0, v16.Padding),
					["PaddingLeft"] = UDim.new(0, v16.Padding),
					["PaddingRight"] = UDim.new(0, v16.Padding)
				})
			else
				v22 = nil
			end
			return v_u_4.createElement("ImageLabel", {
				["Image"] = nil,
				["BackgroundTransparency"] = 1,
				["ImageRectOffset"] = nil,
				["ImageRectSize"] = nil,
				["SliceCenter"] = nil,
				["SliceScale"] = nil,
				["ScaleType"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["ref"] = nil,
				["Image"] = v_u_5[v16.Image].Image,
				["ImageRectOffset"] = v_u_5[v16.Image].ImageRectOffset,
				["ImageRectSize"] = v_u_5[v16.Image].ImageRectSize,
				["SliceCenter"] = v21.center,
				["SliceScale"] = v21.scale,
				["ScaleType"] = Enum.ScaleType.Slice,
				["Size"] = v20,
				["Position"] = UDim2.fromOffset(-v19.X, -v19.Y),
				["ImageColor3"] = v14[v15].Selection.Start.Color3,
				["ImageTransparency"] = v14[v15].Selection.Start.Transparency,
				["ref"] = p13
			}, {
				["Padding"] = v22
			})
		elseif v16.Tag == "RoundedImage" then
			return v_u_4.createElement(v_u_6, {
				["isVisible"] = p12.isVisible,
				["cornerRadius"] = v16.CornerRadius,
				["offset"] = v16.Offset - v16.BorderWidth,
				["borderWidth"] = v16.BorderWidth,
				["colorNamespace"] = p12.colorNamespace,
				["ref"] = p13
			})
		else
			return nil
		end
	end
end)