-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Page
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.UIBlox
local v_u_6 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v7 = require(v1.Packages.Foundation)
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_9
if v_u_8 then
	v_u_9 = v7.UNSTABLE.withCursorMigration
else
	v_u_9 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_10
if v_u_8 then
	v_u_10 = v7.Enums.CursorType
else
	v_u_10 = v5.App.SelectionImage.CursorKind
end
local v11 = script.Parent.Parent
local v_u_12 = require(v11.Thunks.NavigateUp)
local v_u_13 = require(v11.Resources.Assets)
local v_u_14 = require(v11.Resources.Constants)
local v_u_15 = require(v11.Components.ZonePortal)
local v_u_16 = require(v11.Enums.Direction)
local v_u_17 = v5.Core.ImageSet.ImageSetButton
local v_u_18 = v7.Image
local v_u_19 = require(script.Parent.ThemedTextLabel)
local function v_u_36(p_u_20, p_u_21) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_3, (copy) v_u_18, (copy) v_u_13, (copy) v_u_10, (copy) v_u_17, (copy) v_u_19, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
	return v_u_6(function(p22)
		local v23 = {}
		local v24 = {
			["IconEmphasis"] = {
				["Color"] = p22.Color.Content.Emphasis.Color3,
				["Transparency"] = p22.Color.Content.Emphasis.Transparency
			},
			["BackgroundContrast"] = {
				["Color"] = p22.Color.Surface.Surface_100.Color3,
				["Transparency"] = p22.Color.Surface.Surface_100.Transparency
			}
		}
		v23.Theme = v24
		return v23
	end, function(p25)
		-- upvalues: (copy) p_u_20, (ref) v_u_8, (ref) v_u_3, (ref) v_u_18, (ref) v_u_13, (copy) p_u_21, (ref) v_u_10, (ref) v_u_17, (ref) v_u_19, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16
		local v26 = {
			["ExtraChildren"] = p_u_20.titleChildren
		}
		local v27
		if v_u_8 then
			local v28 = v_u_3.createElement
			local v29 = v_u_18
			local v30 = {
				["Image"] = nil,
				["tag"] = "content-emphasis anchor-center-left size-900",
				["backgroundStyle"] = nil,
				["Position"] = nil,
				["selection"] = nil,
				["onActivated"] = nil,
				["ref"] = nil,
				["Image"] = v_u_13.Images.NavigateBack,
				["backgroundStyle"] = {
					["Transparency"] = 1
				},
				["Position"] = UDim2.new(0, 4, 0.5, 0),
				["selection"] = {
					["NextSelectionDown"] = p_u_20.NextSelectionDown,
					["SelectionImageObject"] = p_u_21(v_u_10.RoundedRect)
				},
				["onActivated"] = p_u_20.navigateUp,
				["ref"] = p_u_20.buttonRef
			}
			v27 = v28(v29, v30)
		else
			v27 = v_u_3.createElement(v_u_17, {
				["BackgroundTransparency"] = 1,
				["Image"] = v_u_13.Images.NavigateBack,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["ImageColor3"] = p25.Theme.IconEmphasis.Color,
				["ImageTransparency"] = p25.Theme.IconEmphasis.Transparency,
				["Position"] = UDim2.new(0, 4, 0.5, 0),
				["Size"] = UDim2.new(0, 36, 0, 36),
				["NextSelectionDown"] = p_u_20.NextSelectionDown,
				[v_u_3.Event.Activated] = p_u_20.navigateUp,
				[v_u_3.Ref] = p_u_20.buttonRef,
				["SelectionImageObject"] = p_u_21(v_u_10.RoundedRect)
			})
		end
		v26.BackButton = v27
		local v31 = v_u_3.createElement
		local v32 = "TextButton"
		local v33 = {
			["AutoButtonColor"] = false,
			["Text"] = "",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = nil,
			["Size"] = nil,
			["Visible"] = nil,
			["ZIndex"] = nil,
			["Selectable"] = false,
			["BackgroundColor3"] = p25.Theme.BackgroundContrast.Color,
			["BackgroundTransparency"] = p25.Theme.BackgroundContrast.Transparency,
			["Position"] = p_u_20.position,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v34 = p_u_20.visible
		if v34 then
			v34 = not p_u_20.pageIsModal
		end
		v33.Visible = v34
		v33.ZIndex = p_u_20.zIndex
		local v35 = {
			["PageTitle"] = v_u_3.createElement(v_u_19, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 28),
				["Size"] = UDim2.new(1, -48, 0, 28),
				["Text"] = p_u_20.pageTitle
			}, v26),
			["PageContainer"] = v_u_3.createElement("Frame", {
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = Vector2.new(0, 1),
				["Position"] = UDim2.new(0, v_u_14.Zone.ContentOffset, 1, 0),
				["Size"] = UDim2.new(1, -v_u_14.Zone.ContentOffset, 1, -68)
			}, p_u_20[v_u_3.Children]),
			["ZonePortal"] = v_u_3.createElement(v_u_15, {
				["targetZone"] = 0,
				["direction"] = nil,
				["direction"] = v_u_16.Left
			})
		}
		return v31(v32, v33, v35)
	end)
end
return v4.UNSTABLE_connect2(nil, function(p_u_37)
	-- upvalues: (copy) v_u_12
	return {
		["navigateUp"] = function() -- name: navigateUp
			-- upvalues: (copy) p_u_37, (ref) v_u_12
			p_u_37(v_u_12)
		end
	}
end)(function(p_u_38) -- name: Page
	-- upvalues: (copy) v_u_9, (copy) v_u_36
	return v_u_9(function(p39)
		-- upvalues: (ref) v_u_36, (copy) p_u_38
		return v_u_36(p_u_38, p39)
	end)
end)