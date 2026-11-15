-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SearchBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = v3.UIBlox
local v_u_7 = v3.Cryo
local v_u_8 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_9 = v6.Core.ImageSet.ImageSetLabel
local v_u_10 = v6.App.ImageSet.Images
local v11 = require(v1.Packages.Foundation)
local v_u_12 = v11.Icon
local v_u_13 = v11.Enums.IconSize
local v_u_14 = v11.Utility.normalizeFontFace
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_16 = v11.Utility.Flags.FoundationFontFaceMigration
local v17 = script.Parent.Parent
local v_u_18 = require(v17.Localization.withLocalization)
local v_u_19 = v_u_4.PureComponent:extend("SearchBar")
v_u_19.validateProps = v5.interface({
	["size"] = v5.UDim2,
	["text"] = v5.optional(v5.string),
	["onTextChanged"] = v5.optional(v5.callback),
	["onFocused"] = v5.optional(v5.callback),
	["onCancelled"] = v5.optional(v5.callback),
	["onFocusLost"] = v5.optional(v5.callback),
	["autoCaptureFocus"] = v5.optional(v5.boolean),
	["zIndex"] = v5.optional(v5.number),
	["visible"] = v5.optional(v5.boolean)
})
v_u_19.defaultProps = {
	["size"] = nil,
	["autoCaptureFocus"] = false,
	["visible"] = true,
	["size"] = UDim2.fromScale(1, 1)
}
function v_u_19.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_4
	p_u_20.textboxRef = v_u_4.createRef()
	function p_u_20.onAbsoluteSizeChanged(p21)
		-- upvalues: (copy) p_u_20
		local v22
		if p_u_20.width == p21.AbsoluteSize.X then
			v22 = false
		else
			p_u_20.width = p21.AbsoluteSize.X
			v22 = true
		end
		if p_u_20.height ~= p21.AbsoluteSize.Y then
			p_u_20.height = p21.AbsoluteSize.Y
			v22 = true
		end
		if v22 then
			p_u_20:setState({
				["width"] = p_u_20.width - 2,
				["height"] = p_u_20.height - 2
			})
		end
	end
	function p_u_20.searchTextChanged(p23)
		-- upvalues: (copy) p_u_20
		if p_u_20.props.onTextChanged then
			p_u_20.props.onTextChanged(p23.Text)
		end
	end
	function p_u_20.searchBoxFocused(_)
		-- upvalues: (copy) p_u_20
		if p_u_20.props.onFocused then
			p_u_20.props.onFocused()
		end
	end
	function p_u_20.searchCancel()
		-- upvalues: (copy) p_u_20
		if p_u_20.props.onCancelled then
			p_u_20.props.onCancelled()
		end
	end
	function p_u_20.onFocusLost()
		-- upvalues: (copy) p_u_20
		if p_u_20.props.onFocusLost then
			p_u_20.props.onFocusLost()
		end
	end
	function p_u_20.onTextboxTouchTap()
		-- upvalues: (copy) p_u_20
		if p_u_20.props.onTextboxTouchTap then
			p_u_20.props.onTextboxTouchTap()
		end
	end
end
function v_u_19.willUpdate(p24, p25) -- name: willUpdate
	if p24.props.autoCaptureFocus and (p24.props.visible == false and p25.visible) then
		p24:focus()
	end
end
function v_u_19.didMount(p26) -- name: didMount
	if p26.props.autoCaptureFocus and p26.props.visible then
		p26:focus()
	end
end
function v_u_19.focus(p27) -- name: focus
	if p27.textboxRef then
		p27.textboxRef.current:CaptureFocus()
	end
end
function v_u_19.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_16, (copy) v_u_18, (copy) v_u_4, (copy) v_u_2, (copy) v_u_15, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9, (copy) v_u_10, (copy) v_u_14
	return v_u_8(function(p29)
		-- upvalues: (ref) v_u_16
		local v30 = {}
		local v31
		if v_u_16 then
			v31 = p29
		else
			v31 = nil
		end
		v30.Tokens = v31
		v30.Theme = {
			["TextEmphasis"] = {
				["Color"] = p29.Color.Content.Emphasis.Color3,
				["Transparency"] = p29.Color.Content.Emphasis.Transparency
			},
			["TextDefault"] = {
				["Color"] = p29.Color.Content.Default.Color3,
				["Transparency"] = p29.Color.Content.Default.Transparency
			}
		}
		v30.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p29.Typography.BodyLarge.Font,
				["RelativeSize"] = p29.Typography.BodyLarge.FontSize
			}
		}
		return v30
	end, function(p_u_32)
		-- upvalues: (ref) v_u_18, (copy) p_u_28, (ref) v_u_4, (ref) v_u_2, (ref) v_u_15, (ref) v_u_12, (ref) v_u_13, (ref) v_u_9, (ref) v_u_10, (ref) v_u_16, (ref) v_u_14
		return v_u_18({
			["search"] = "CoreScripts.InGameMenu.InviteFriends.Search",
			["cancel"] = "CoreScripts.InGameMenu.Cancel"
		})(function(p33)
			-- upvalues: (copy) p_u_32, (ref) p_u_28, (ref) v_u_4, (ref) v_u_2, (ref) v_u_15, (ref) v_u_12, (ref) v_u_13, (ref) v_u_9, (ref) v_u_10, (ref) v_u_16, (ref) v_u_14
			local v34 = p_u_32.Font.Body
			local v35 = p_u_32.Font.BaseSize * v34.RelativeSize
			local v36 = p_u_32.Font.Body
			local v37 = p_u_32.Font.BaseSize * v36.RelativeSize
			local v38 = {
				["BackgroundTransparency"] = 1,
				["GroupTransparency"] = 0.5,
				["Size"] = p_u_28.props.size,
				["ZIndex"] = p_u_28.props.zIndex,
				["Visible"] = p_u_28.props.visible,
				[v_u_4.Ref] = p_u_28.props.forwardRef or v_u_4.createRef()
			}
			local v39
			if v_u_2:GetPlatform() == Enum.Platform.Android then
				v39 = Enum.TextInputType.PasswordShown
			else
				v39 = Enum.TextInputType.NoSuggestions
			end
			local v40 = v_u_4.createElement
			local v41 = "CanvasGroup"
			local v42 = {
				["SearchPanelLayout"] = v_u_4.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, 9)
				})
			}
			local v43 = v_u_4.createElement
			local v44 = "Frame"
			local v45 = {
				["Size"] = UDim2.new(1, -66, 0, 38),
				["BackgroundColor3"] = Color3.new(136, 136, 136),
				["BackgroundTransparency"] = 0.8,
				[v_u_4.Change.AbsoluteSize] = p_u_28.onAbsoluteSizeChanged
			}
			local v46 = {
				["BorderRadius"] = v_u_4.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 4)
				})
			}
			local v47 = v_u_4.createElement
			local v48 = "Frame"
			local v49 = {
				["BackgroundTransparency"] = 0,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["Position"] = nil,
				["Size"] = UDim2.fromOffset(p_u_28.state.width, p_u_28.state.height),
				["BackgroundColor3"] = Color3.new(0, 0, 0),
				["Position"] = UDim2.fromOffset(1, 1)
			}
			local v50 = {
				["SearchContainerLayout"] = v_u_4.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, 10)
				}),
				["Padding"] = v_u_4.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 12),
					["PaddingRight"] = UDim.new(0, 12)
				}),
				["BorderRadius"] = v_u_4.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 4)
				})
			}
			local v51
			if v_u_15 then
				v51 = v_u_4.createElement(v_u_12, {
					["name"] = "icons/common/search_small",
					["size"] = nil,
					["LayoutOrder"] = 1,
					["size"] = v_u_13.Medium
				})
			else
				v51 = v_u_4.createElement(v_u_9, {
					["LayoutOrder"] = 1,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["Size"] = nil,
					["Image"] = v_u_10["icons/common/search_small"],
					["Size"] = UDim2.fromOffset(18, 18)
				})
			end
			v50.SearchImage = v51
			local v52 = v_u_4.createElement
			local v53 = "TextBox"
			local v54 = {
				["LayoutOrder"] = 2,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, -28, 0, 20)
			}
			local v55
			if v_u_16 then
				v55 = nil
			else
				v55 = v36.Font
			end
			v54.Font = v55
			local v56
			if v_u_16 then
				v56 = v_u_14(p_u_32.Tokens.Typography.BodyLarge.Font)
			else
				v56 = nil
			end
			v54.FontFace = v56
			v54.Text = p_u_28.props.text or ""
			v54.TextInputType = v39
			v54.TextSize = v37
			v54.TextColor3 = p_u_32.Theme.TextEmphasis.Color
			v54.TextXAlignment = Enum.TextXAlignment.Left
			v54.PlaceholderText = p33.search
			v54.PlaceholderColor3 = p_u_32.Theme.TextDefault.Color
			v54.ClearTextOnFocus = false
			v54.ClipsDescendants = true
			v54[v_u_4.Change.Text] = p_u_28.searchTextChanged
			v54[v_u_4.Event.Focused] = p_u_28.searchBoxFocused
			v54[v_u_4.Event.FocusLost] = p_u_28.onFocusLost
			v54[v_u_4.Ref] = p_u_28.textboxRef
			v54[v_u_4.Event.TouchTap] = p_u_28.onTextboxTouchTap
			v50.SearchInput = v52(v53, v54)
			v46.SearchContainer = v47(v48, v49, v50)
			v42.SearchBorder = v43(v44, v45, v46)
			local v57 = v_u_4.createElement
			local v58 = "TextButton"
			local v59 = {
				["LayoutOrder"] = 2,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromOffset(57, 20)
			}
			local v60
			if v_u_16 then
				v60 = nil
			else
				v60 = v34.Font
			end
			v59.Font = v60
			local v61
			if v_u_16 then
				v61 = v_u_14(p_u_32.Tokens.Typography.BodyLarge.Font)
			else
				v61 = nil
			end
			v59.FontFace = v61
			v59.TextSize = v35
			v59.Text = p33.cancel
			v59.TextColor3 = p_u_32.Theme.TextEmphasis.Color
			v59[v_u_4.Event.Activated] = p_u_28.searchCancel
			v42.CancelButton = v57(v58, v59)
			return v40(v41, v38, v42)
		end)
	end)
end
return v_u_4.forwardRef(function(p62, p63)
	-- upvalues: (copy) v_u_4, (copy) v_u_19, (copy) v_u_7
	return v_u_4.createElement(v_u_19, v_u_7.Dictionary.join(p62, {
		["forwardRef"] = p63
	}))
end)