-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayoutContainer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.UIBlox
local v6 = v2.t
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v_u_9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v_u_9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v5.App.SelectionImage.CursorKind
end
local v12 = script.Parent.Parent.Parent
local v_u_13 = require(v12.GlobalConfig)
local v_u_14 = require(script.Parent.Parent.ThemedTextLabel)
local v_u_15 = require(script.Parent.Parent.Divider)
local v_u_16 = require(v12.Actions.NavigateBack)
local v_u_17 = require(v12.Localization.withLocalization)
local v_u_18 = require(v12.Resources.Assets)
local v_u_19 = v5.Core.ImageSet.ImageSetButton
local v_u_20 = v5.Core.ImageSet.ImageSetLabel
local v_u_21 = v8.Image
local v_u_22 = v6.strictInterface({
	["titleText"] = v6.string,
	[v_u_3.Children] = v6.optional(v6.table),
	["onClosed"] = v6.callback,
	["closeButtonRef"] = v6.optional(v6.table)
})
local function v_u_45(p_u_23, p_u_24) -- name: ControlLayoutContainerWithSelectionCursor
	-- upvalues: (copy) v_u_13, (copy) v_u_22, (copy) v_u_17, (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_21, (copy) v_u_18, (copy) v_u_11, (copy) v_u_19, (copy) v_u_14, (copy) v_u_15, (copy) v_u_20
	if v_u_13.propValidation then
		local v25 = v_u_22
		assert(v25(p_u_23))
	end
	return v_u_17({
		["titleText"] = p_u_23.titleText
	})(function(p_u_26)
		-- upvalues: (ref) v_u_7, (ref) v_u_3, (copy) p_u_23, (ref) v_u_9, (ref) v_u_21, (ref) v_u_18, (copy) p_u_24, (ref) v_u_11, (ref) v_u_19, (ref) v_u_14, (ref) v_u_15, (ref) v_u_20
		return v_u_7(function(p27)
			local v28 = {}
			local v29 = {
				["Overlay"] = {
					["Color"] = p27.Color.Common.Scrim.Color3,
					["Transparency"] = p27.Color.Common.Scrim.Transparency
				}
			}
			v28.Theme = v29
			return v28
		end, function(p30)
			-- upvalues: (ref) v_u_3, (ref) p_u_23, (ref) v_u_9, (ref) v_u_21, (ref) v_u_18, (ref) p_u_24, (ref) v_u_11, (ref) v_u_19, (ref) v_u_14, (copy) p_u_26, (ref) v_u_15, (ref) v_u_20
			local v31 = v_u_3.createElement
			local v32 = "Frame"
			local v33 = {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["Active"] = true,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BackgroundColor3"] = p30.Theme.Overlay.Color
			}
			local v34 = {
				["PageContent"] = v_u_3.createElement("Frame", {
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Position"] = nil,
					["ClipsDescendants"] = true,
					["Size"] = UDim2.new(1, 0, 1, -132),
					["Position"] = UDim2.new(0, 0, 0, 132)
				}, p_u_23[v_u_3.Children])
			}
			local v35 = v_u_3.createElement
			local v36 = "Frame"
			local v37 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 132)
			}
			local v38 = {
				["Padding"] = v_u_3.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 95),
					["PaddingRight"] = UDim.new(0, 95)
				})
			}
			local v39
			if v_u_9 then
				local v40 = v_u_3.createElement
				local v41 = v_u_21
				local v42 = {
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Position"] = UDim2.new(0, 0, 0, 100),
					["Size"] = UDim2.new(0, 36, 0, 36),
					["backgroundStyle"] = {
						["Transparency"] = 1
					},
					["Image"] = v_u_18.Images.CloseModal,
					["selection"] = {
						["SelectionImageObject"] = p_u_24(v_u_11.RoundedRect)
					},
					["onActivated"] = p_u_23.onClosed,
					["ref"] = p_u_23.closeButtonRef
				}
				v39 = v40(v41, v42)
			else
				v39 = v_u_3.createElement(v_u_19, {
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Position"] = UDim2.new(0, 0, 0, 100),
					["Size"] = UDim2.new(0, 36, 0, 36),
					["Image"] = v_u_18.Images.CloseModal,
					["BackgroundTransparency"] = 1,
					["SelectionImageObject"] = p_u_24(v_u_11.RoundedRect),
					[v_u_3.Event.Activated] = p_u_23.onClosed,
					[v_u_3.Ref] = p_u_23.closeButtonRef
				})
			end
			v38.CloseButton = v39
			v38.HeaderTextLabel = v_u_3.createElement(v_u_14, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Text"] = nil,
				["Size"] = UDim2.new(0, 250, 0, 28),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.new(0.5, 0, 0, 100),
				["Text"] = p_u_26.titleText
			})
			v38.HeaderDivider = v_u_3.createElement(v_u_15, {
				["Size"] = UDim2.new(1, 0, 0, 2),
				["AnchorPoint"] = Vector2.new(0.5, 1),
				["Position"] = UDim2.new(0.5, 0, 1, 0)
			})
			v34.HeaderContainer = v35(v36, v37, v38)
			local v43
			if v_u_9 then
				v43 = v_u_3.createElement(v_u_21, {
					["Image"] = v_u_18.Images.RadialGlow,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["backgroundStyle"] = {
						["Transparency"] = 1
					},
					["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
					["Size"] = UDim2.new(1, 0, 1, 0)
				})
			else
				v43 = v_u_3.createElement(v_u_20, {
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["SizeConstraint"] = nil,
					["Size"] = nil,
					["Image"] = v_u_18.Images.RadialGlow,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
					["Size"] = UDim2.new(1, 0, 1, 0)
				})
			end
			v34.RadialGlowBig = v43
			local v44
			if v_u_9 then
				v44 = v_u_3.createElement(v_u_21, {
					["Image"] = v_u_18.Images.RadialGlow,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 1, 0),
					["backgroundStyle"] = {
						["Transparency"] = 1
					},
					["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
					["Size"] = UDim2.new(1, 0, 0.6, 0)
				})
			else
				v44 = v_u_3.createElement(v_u_20, {
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["SizeConstraint"] = nil,
					["Size"] = nil,
					["Image"] = v_u_18.Images.RadialGlow,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 1, 0),
					["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
					["Size"] = UDim2.new(1, 0, 0.6, 0)
				})
			end
			v34.RadialGlowSquashed = v44
			return v31(v32, v33, v34)
		end)
	end)
end
return v4.UNSTABLE_connect2(nil, function(p_u_46)
	-- upvalues: (copy) v_u_16
	return {
		["onClosed"] = function() -- name: onClosed
			-- upvalues: (copy) p_u_46, (ref) v_u_16
			p_u_46(v_u_16())
		end
	}
end)(function(p_u_47) -- name: ControlLayoutContainer
	-- upvalues: (copy) v_u_10, (copy) v_u_45
	return v_u_10(function(p48)
		-- upvalues: (ref) v_u_45, (copy) p_u_47
		return v_u_45(p_u_47, p48)
	end)
end)