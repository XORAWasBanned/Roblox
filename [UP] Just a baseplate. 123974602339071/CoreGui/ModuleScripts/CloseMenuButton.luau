-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SideNavigation.CloseMenuButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.t
local v_u_4 = v2.Roact
local v5 = v2.UIBlox
local v_u_6 = v2.Cryo
local v7 = require(v1.Packages.Foundation)
local v8 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_9
if v8 then
	v_u_9 = v7.UNSTABLE.withCursorMigration
else
	v_u_9 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_10
if v8 then
	v_u_10 = v7.Enums.CursorType
else
	v_u_10 = v5.App.SelectionImage.CursorKind
end
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.Resources.Assets)
local v_u_13 = require(v11.GlobalConfig)
local v_u_14 = v5.Core.ImageSet.ImageSetButton
local v_u_15 = v7.Image
local v_u_16 = v7.Enums.ControlState
local v_u_17 = v3.strictInterface({
	["AnchorPoint"] = v3.optional(v3.Vector2),
	["Position"] = v3.optional(v3.UDim2),
	["layoutOrder"] = v3.optional(v3.integer),
	["onActivated"] = v3.callback,
	["onSelectionGained"] = v3.optional(v3.callback),
	["onSelectionLost"] = v3.optional(v3.callback),
	["forwardRef"] = v3.optional(v3.table)
})
local v_u_18
if v8 then
	v_u_18 = v_u_4.Component:extend("CloseMenuButton")
	function v_u_18.init(p19) -- name: init
		p19.wasSelected = false
	end
	function v_u_18.render(p_u_20) -- name: render
		-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_17, (copy) v_u_4, (copy) v_u_15, (copy) v_u_12, (copy) v_u_10, (copy) v_u_16
		local v_u_21 = p_u_20.props
		return v_u_9(function(p22)
			-- upvalues: (ref) v_u_13, (ref) v_u_17, (copy) v_u_21, (ref) v_u_4, (ref) v_u_15, (ref) v_u_12, (ref) v_u_10, (ref) v_u_16, (copy) p_u_20
			if v_u_13.propValidation then
				local v23 = v_u_17
				local v24 = v_u_21
				assert(v23(v24))
			end
			local v25 = v_u_4.createElement
			local v26 = v_u_15
			local v29 = {
				["AnchorPoint"] = v_u_21.AnchorPoint,
				["Position"] = v_u_21.Position,
				["Size"] = UDim2.new(0, 32, 0, 32),
				["backgroundStyle"] = {
					["Transparency"] = 1
				},
				["LayoutOrder"] = v_u_21.layoutOrder,
				["Image"] = v_u_12.Images.CloseButton,
				["selection"] = {
					["SelectionImageObject"] = p22(v_u_10.RoundedRect)
				},
				["onActivated"] = v_u_21.onActivated,
				["onStateChanged"] = function(p27) -- name: onStateChanged
					-- upvalues: (ref) v_u_16, (ref) p_u_20, (ref) v_u_21
					local v28 = p27 == v_u_16.Selected and true or p27 == v_u_16.SelectedPressed
					if v28 and not p_u_20.wasSelected then
						if v_u_21.onSelectionGained then
							v_u_21.onSelectionGained()
						end
					elseif not v28 and (p_u_20.wasSelected and v_u_21.onSelectionLost) then
						v_u_21.onSelectionLost()
					end
					p_u_20.wasSelected = v28
				end,
				["ref"] = v_u_21.forwardRef
			}
			return v25(v26, v29)
		end)
	end
else
	v_u_18 = function(p_u_30)
		-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_17, (copy) v_u_4, (copy) v_u_14, (copy) v_u_12, (copy) v_u_10
		return v_u_9(function(p31)
			-- upvalues: (ref) v_u_13, (ref) v_u_17, (copy) p_u_30, (ref) v_u_4, (ref) v_u_14, (ref) v_u_12, (ref) v_u_10
			if v_u_13.propValidation then
				local v32 = v_u_17
				local v33 = p_u_30
				assert(v32(v33))
			end
			return v_u_4.createElement(v_u_14, {
				["AnchorPoint"] = p_u_30.AnchorPoint,
				["BackgroundTransparency"] = 1,
				["Image"] = v_u_12.Images.CloseButton,
				["Position"] = p_u_30.Position,
				["Size"] = UDim2.new(0, 32, 0, 32),
				["LayoutOrder"] = p_u_30.layoutOrder,
				["SelectionImageObject"] = p31(v_u_10.RoundedRect),
				[v_u_4.Event.Activated] = p_u_30.onActivated,
				[v_u_4.Event.SelectionGained] = p_u_30.onSelectionGained,
				[v_u_4.Event.SelectionLost] = p_u_30.onSelectionLost,
				[v_u_4.Ref] = p_u_30.forwardRef
			})
		end)
	end
end
return v_u_4.forwardRef(function(p34, p35)
	-- upvalues: (copy) v_u_4, (ref) v_u_18, (copy) v_u_6
	return v_u_4.createElement(v_u_18, v_u_6.Dictionary.join(p34, {
		["forwardRef"] = p35
	}))
end)