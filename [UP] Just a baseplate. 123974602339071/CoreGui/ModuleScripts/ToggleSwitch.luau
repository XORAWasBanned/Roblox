-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ToggleSwitch
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v_u_5 = v2.Otter
local v6 = v2.t
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = require(v1.Packages.Foundation)
local v9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v4.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v4.App.SelectionImage.CursorKind
end
local v12 = script.Parent.Parent
local v_u_13 = require(v12.Utility.divideTransparency)
local v_u_14 = require(script.Parent.AssetImage)
local v_u_15 = UDim2.new(0, -3, 0.5, 0)
local v_u_16 = UDim2.new(1, -39, 0.5, 0)
local v_u_17 = {
	["frequency"] = 4
}
local v18 = v_u_3.PureComponent:extend("ToggleSwitch")
v18.validateProps = v6.strictInterface({
	["checked"] = v6.boolean,
	["onToggled"] = v6.callback,
	["disabled"] = v6.optional(v6.boolean),
	["buttonRef"] = v6.optional(v6.union(v6.callback, v6.table)),
	["AnchorPoint"] = v6.optional(v6.Vector2),
	["LayoutOrder"] = v6.optional(v6.integer),
	["Position"] = v6.optional(v6.UDim2),
	["NextSelectionUp"] = v6.optional(v6.union(v6.Instance, v6.table)),
	["onSelectionLost"] = v6.optional(v6.callback),
	["onSelectionGained"] = v6.optional(v6.callback)
})
function v18.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_5
	local v20 = p_u_19.props.checked and 1 or 0
	local v21, v22 = v_u_3.createBinding(v20)
	p_u_19.progress = v21
	p_u_19.setProgress = v22
	p_u_19.fillTransparency = p_u_19.progress:map(function(p23)
		-- upvalues: (ref) v_u_13, (copy) p_u_19
		return v_u_13(1 - p23, p_u_19.props.disabled and 4 or 1)
	end)
	p_u_19.knobPosition = p_u_19.progress:map(function(p24)
		-- upvalues: (ref) v_u_15, (ref) v_u_16
		return v_u_15:lerp(v_u_16, p24)
	end)
	p_u_19.motor = v_u_5.createSingleMotor(v20)
	p_u_19.motor:onStep(p_u_19.setProgress)
end
function v18.renderWithSelectionCursor(p_u_25, p_u_26) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_14, (copy) v_u_13, (copy) v_u_11
	return v_u_7(function(p27)
		local v28 = {}
		local v29 = {
			["SecondaryDefault"] = {
				["Color"] = p27.Color.Extended.White.White_70.Color3,
				["Transparency"] = p27.Color.Extended.White.White_70.Transparency
			},
			["Success"] = {
				["Color"] = p27.Color.System.Success.Color3,
				["Transparency"] = p27.Color.System.Success.Transparency
			}
		}
		v28.Theme = v29
		return v28
	end, function(p30)
		-- upvalues: (ref) v_u_3, (ref) v_u_14, (copy) p_u_25, (ref) v_u_13, (copy) p_u_26, (ref) v_u_11
		local v31 = v_u_3.createElement
		local v32 = v_u_14.Button
		local v33 = {
			["Size"] = UDim2.new(0, 60, 0, 36),
			["BackgroundTransparency"] = 1,
			["Position"] = p_u_25.props.Position,
			["LayoutOrder"] = p_u_25.props.LayoutOrder,
			["imageKey"] = "ToggleOutline",
			["AnchorPoint"] = p_u_25.props.AnchorPoint,
			["ImageColor3"] = p30.Theme.SecondaryDefault.Color,
			["ImageTransparency"] = v_u_13(p30.Theme.SecondaryDefault.Transparency, p_u_25.props.disabled and 4 or 1),
			["NextSelectionUp"] = p_u_25.props.NextSelectionUp,
			[v_u_3.Event.Activated] = p_u_25.props.onToggled,
			[v_u_3.Ref] = p_u_25.props.buttonRef,
			[v_u_3.Event.SelectionLost] = p_u_25.props.onSelectionLost,
			[v_u_3.Event.SelectionGained] = p_u_25.props.onSelectionGained,
			["SelectionImageObject"] = p_u_26(v_u_11.Toggle)
		}
		local v34 = {
			["Fill"] = v_u_3.createElement(v_u_14.Label, {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["imageKey"] = "ToggleFill",
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["ImageColor3"] = p30.Theme.Success.Color,
				["ImageTransparency"] = p_u_25.fillTransparency
			}),
			["Knob"] = v_u_3.createElement(v_u_14.Label, {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["imageKey"] = "ToggleKnob",
				["ImageTransparency"] = nil,
				["ZIndex"] = 2,
				["Size"] = UDim2.new(0, 42, 0, 42),
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = p_u_25.knobPosition,
				["ImageTransparency"] = v_u_13(0, p_u_25.props.disabled and 4 or 1)
			})
		}
		return v31(v32, v33, v34)
	end)
end
function v18.render(p_u_35) -- name: render
	-- upvalues: (copy) v_u_10
	return v_u_10(function(p36)
		-- upvalues: (copy) p_u_35
		return p_u_35:renderWithSelectionCursor(p36)
	end)
end
function v18.didUpdate(p37) -- name: didUpdate
	-- upvalues: (copy) v_u_5, (copy) v_u_17
	local v38 = p37.props.checked and 1 or 0
	p37.motor:setGoal(v_u_5.spring(v38, v_u_17))
end
function v18.willUnmount(p39) -- name: willUnmount
	p39.motor:destroy()
end
return v18