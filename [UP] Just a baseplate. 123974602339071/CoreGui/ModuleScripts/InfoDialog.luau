-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InfoDialog
local v_u_1 = game:GetService("TextService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v4 = require(v2.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.UIBlox
local v7 = v4.t
local v_u_8 = v6.App.Button.Button
local v_u_9 = v6.App.Button.Enum.ButtonType
local v_u_10 = require(v2.Workspace.Packages.Style).GetTextSize
local v_u_11 = require(v2.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local v_u_12 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v13 = script.Parent.Parent
local v_u_14 = require(v13.Resources.Assets)
local v_u_15 = require(script.Parent.ThemedTextLabel)
local v_u_16 = require(script.Parent.Divider)
local v_u_17 = v6.Core.ImageSet.ImageSetLabel
local v18 = v_u_5.PureComponent:extend("InfoDialog")
v18.validateProps = v7.strictInterface({
	["bodyText"] = v7.string,
	["dismissText"] = v7.string,
	["titleText"] = v7.string,
	["iconImage"] = v7.union(v7.string, v7.table),
	["onDismiss"] = v7.callback,
	["visible"] = v7.boolean,
	["buttonRef"] = v7.optional(v7.table)
})
function v18.render(p_u_19) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_1, (copy) v_u_5, (copy) v_u_17, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_8, (copy) v_u_9
	local v_u_20 = p_u_19.props
	return v_u_12(function(p21)
		-- upvalues: (ref) v_u_11
		local v22 = {}
		local v23
		if v_u_11 then
			v23 = p21
		else
			v23 = nil
		end
		v22.Tokens = v23
		v22.Theme = {
			["Overlay"] = {
				["Color"] = p21.Color.Common.Scrim.Color3,
				["Transparency"] = p21.Color.Common.Scrim.Transparency
			},
			["BackgroundUIDefault"] = {
				["Color"] = p21.Color.Surface.Surface_300.Color3,
				["Transparency"] = p21.Color.Surface.Surface_300.Transparency
			}
		}
		v22.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p21.Typography.BodyLarge.Font,
				["RelativeSize"] = p21.Typography.BodyLarge.FontSize
			}
		}
		return v22
	end, function(p24)
		-- upvalues: (copy) v_u_20, (ref) v_u_11, (ref) v_u_10, (ref) v_u_1, (ref) v_u_5, (ref) v_u_17, (ref) v_u_14, (copy) p_u_19, (ref) v_u_15, (ref) v_u_16, (ref) v_u_8, (ref) v_u_9
		local v25 = p24.Font.Body.Font
		local v26 = p24.Font.Body.RelativeSize * p24.Font.BaseSize
		local v27 = v_u_20.bodyText
		local v28
		if v_u_11 then
			v28 = v_u_10(v27, v26, p24.Tokens.Typography.BodyLarge.Font, Vector2.new(264, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v28 = v_u_1:GetTextSize(v27, v26, v25, Vector2.new(264, (1 / 0))).Y
		end
		local v29 = v26 * 2
		local v30 = math.max(v28, v29) + 48
		local v31 = v_u_5.createElement
		local v32 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 8,
			["Visible"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Visible"] = v_u_20.visible
		}
		local v33 = {
			["Overlay"] = v_u_5.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Text"] = "",
				["BackgroundColor3"] = p24.Theme.Overlay.Color,
				["BackgroundTransparency"] = p24.Theme.Overlay.Transparency,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
		}
		local v34 = v_u_5.createElement
		local v35 = v_u_17
		local v36 = {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Position"] = nil,
			["ScaleType"] = nil,
			["Size"] = nil,
			["SliceCenter"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = v_u_14.Images.RoundedRect.Image,
			["ImageColor3"] = p24.Theme.BackgroundUIDefault.Color,
			["ImageTransparency"] = p24.Theme.BackgroundUIDefault.Transparency,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["ScaleType"] = v_u_14.Images.RoundedRect.ScaleType,
			["Size"] = UDim2.new(0, 312, 0, v30 + 49 + 36 + 36 + 24 + 10),
			["SliceCenter"] = v_u_14.Images.RoundedRect.SliceCenter
		}
		local v37 = {
			["Padding"] = v_u_5.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10),
				["PaddingBottom"] = UDim.new(0, 24),
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24)
			}),
			["Layout"] = v_u_5.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Icon"] = v_u_5.createElement(v_u_17, {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(0, 36, 0, 36),
				["Image"] = p_u_19.props.iconImage
			}),
			["Title"] = v_u_5.createElement(v_u_15, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 48),
				["Text"] = v_u_20.titleText
			}),
			["Divider"] = v_u_5.createElement(v_u_16, {
				["LayoutOrder"] = 3
			})
		}
		local v38 = v_u_5.createElement
		local v39 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 4,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v30)
		}
		local v40 = {
			["BodyText"] = v_u_5.createElement(v_u_15, {
				["Size"] = nil,
				["Text"] = nil,
				["TextWrapped"] = true,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Text"] = v_u_20.bodyText
			})
		}
		v37.BodyTextContainer = v38("Frame", v39, v40)
		v37.ConfirmButton = v_u_5.createElement(v_u_8, {
			["buttonType"] = v_u_9.PrimarySystem,
			["layoutOrder"] = 5,
			["size"] = UDim2.new(1, 0, 0, 36),
			["onActivated"] = v_u_20.onDismiss,
			["text"] = v_u_20.dismissText,
			[v_u_5.Ref] = p_u_19.props.buttonRef
		})
		v33.DialogMainFrame = v34(v35, v36, v37)
		return v31("Frame", v32, v33)
	end)
end
function v18.bindActions(p_u_41) -- name: bindActions
	-- upvalues: (copy) v_u_3
	v_u_3:BindCoreAction("InGameMenuModalDismiss", function(_, p42, _) -- name: dismissFunc
		-- upvalues: (copy) p_u_41
		if p42 == Enum.UserInputState.Begin then
			p_u_41.props.onDismiss()
		end
	end, false, Enum.KeyCode.Escape)
end
function v18.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_3
	v_u_3:UnbindCoreAction("InGameMenuModalDismiss")
end
function v18.didMount(p43) -- name: didMount
	if p43.props.visible then
		p43:bindActions()
	end
end
function v18.didUpdate(p44) -- name: didUpdate
	if p44.props.visible then
		p44:bindActions()
	else
		p44:unbindActions()
	end
end
function v18.willUnmount(p45) -- name: willUnmount
	p45:unbindActions()
end
return v18