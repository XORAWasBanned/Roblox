-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.ToggleEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Components.ToggleSwitch)
local v_u_8 = require(script.Parent.InputLabel)
local v_u_9 = require(script.Parent.DeveloperLockLabel)
local v_u_10 = require(v6.Components.ThemedTextLabel)
local v_u_11 = require(v6.Localization.withLocalization)
local v12 = v_u_4.PureComponent:extend("ToggleEntry")
v12.validateProps = v5.strictInterface({
	["LayoutOrder"] = v5.integer,
	["labelKey"] = v5.string,
	["lockedToOff"] = v5.optional(v5.boolean),
	["isDisabled"] = v5.optional(v5.boolean),
	["subtextEnabled"] = v5.optional(v5.boolean),
	["subtextKey"] = v5.optional(v5.string),
	["checked"] = v5.boolean,
	["onToggled"] = v5.callback,
	["buttonRef"] = v5.optional(v5.table),
	["NextSelectionUp"] = v5.optional(v5.union(v5.Instance, v5.table))
})
function v12.init(p13) -- name: init
	p13.state = {
		["isSelectable"] = true
	}
end
function v12.render(p_u_14) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7
	local v_u_15 = p_u_14.props.buttonRef or v_u_4.createRef()
	local v16 = v_u_4.createElement
	local v17 = "Frame"
	local v18 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = p_u_14.props.LayoutOrder,
		["Size"] = UDim2.new(1, 0, 0, 56),
		["Selectable"] = p_u_14.state.isSelectable,
		[v_u_4.Event.SelectionGained] = function()
			-- upvalues: (ref) v_u_2, (copy) v_u_15, (copy) p_u_14
			v_u_2.SelectedCoreObject = v_u_15:getValue()
			p_u_14:setState({
				["isSelectable"] = false
			})
		end
	}
	local v19 = {
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingRight"] = UDim.new(0, 30),
			["PaddingLeft"] = UDim.new(0, 24)
		}),
		["ControlLabel"] = v_u_4.createElement(v_u_8, {
			["localizationKey"] = p_u_14.props.labelKey
		})
	}
	local v20 = p_u_14.props.lockedToOff
	if v20 then
		v20 = v_u_4.createElement(v_u_9, {
			["Size"] = UDim2.new(1, -72, 0.25, 0),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(0, 1)
		})
	end
	v19.LockedLabel = v20
	local v21 = p_u_14.props.subtextEnabled
	if v21 then
		v21 = v_u_11({
			["text"] = p_u_14.props.subtextKey
		})(function(p22)
			-- upvalues: (ref) v_u_4, (ref) v_u_10
			return v_u_4.createElement(v_u_10, {
				["Text"] = nil,
				["themeKey"] = "TextDefault",
				["fontKey"] = "CaptionBody",
				["TextTransparency"] = 0.5,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Text"] = p22.text,
				["Size"] = UDim2.new(1, -72, 0.25, 0),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Bottom
			})
		end)
	end
	v19.SubtextLabel = v21
	local v23 = v_u_4.createElement
	local v24 = v_u_7
	local v25 = {
		["Position"] = UDim2.new(1, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(1, 0.5)
	}
	local v26 = p_u_14.props.checked
	if v26 then
		v26 = not p_u_14.props.lockedToOff
	end
	v25.checked = v26
	v25.onToggled = p_u_14.props.onToggled
	v25.disabled = p_u_14.props.lockedToOff or p_u_14.props.isDisabled
	v25.buttonRef = v_u_15
	function v25.onSelectionLost() -- name: onSelectionLost
		-- upvalues: (copy) p_u_14
		p_u_14:setState({
			["isSelectable"] = true
		})
	end
	function v25.onSelectionGained() -- name: onSelectionGained
		-- upvalues: (copy) p_u_14
		p_u_14:setState({
			["isSelectable"] = false
		})
	end
	v25.NextSelectionUp = p_u_14.props.NextSelectionUp
	v19.Toggle = v23(v24, v25)
	return v16(v17, v18, v19)
end
return v12