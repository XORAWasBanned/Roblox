-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Shortcuts.ShortcutBar
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v1.Parent.Parent.TopBar.Components.GamepadConnector)
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Packages.ReactRoblox)
local v8 = require(v2.Packages.UIBlox)
local v9 = require(v2.Packages.Foundation)
local v_u_10 = v8.App.Navigation.ShortcutBar
require(v2.Workspace.Packages.Chrome)
local v_u_11 = require(v1.Unibar.Constants)
local v_u_12 = require(v1.Service.ViewportUtil)
local v_u_13 = require(v1.Hooks.useObservableValue)
local v_u_14 = v9.Hooks.useTokens
local v_u_15 = require(v2.Workspace.Packages.Drawer).Hooks.useDrawerAnimating
local v_u_16 = require(v1.Service)
local v17 = require(v2.Workspace.Packages.SharedFlags)
local v_u_18 = v17.FFlagEnableConsoleExpControls
local v_u_19 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_20 = v17.FFlagGamepadIconSupportCheck
local v_u_21 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_22 = v17.FFlagSideSheetFocusNav
local v_u_23 = v17.FFlagEnableDrawerAnimatingHook
local v_u_24 = require(v2.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
function ChromeShortcutBar(_) -- name: ChromeShortcutBar
	-- upvalues: (copy) v_u_6, (copy) v_u_14, (copy) v_u_13, (copy) v_u_12, (copy) v_u_20, (copy) v_u_5, (copy) v_u_16, (copy) v_u_4, (copy) v_u_19, (copy) v_u_18, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_24, (copy) v_u_15, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3
	local v_u_25, v_u_26 = v_u_6.useState({})
	local v27, v_u_28 = v_u_6.useState({})
	local v29, v_u_30 = v_u_6.useBinding(false)
	local v31 = v_u_14()
	local v_u_32 = v_u_13(v_u_12.screenSize)
	local v_u_33 = v_u_6.useRef(0)
	local function v_u_38() -- name: checkOverflow
		-- upvalues: (copy) v_u_33, (copy) v_u_32, (copy) v_u_25, (copy) v_u_28
		if v_u_33.current > v_u_32.X then
			local v34 = 1
			for v35, v36 in v_u_25 do
				if v36.displayPriority > v_u_25[v34].displayPriority then
					continue
				end
				v34 = v35
			end
			local v37 = table.clone(v_u_25)
			table.remove(v37, v34)
			v_u_28(v37)
		end
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_28, (copy) v_u_38
		v_u_28({})
		v_u_38()
	end, { v_u_32 })
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_20, (ref) v_u_5, (ref) v_u_16, (copy) v_u_26, (copy) v_u_28, (ref) v_u_4, (ref) v_u_19, (ref) v_u_18, (copy) v_u_30
		local function v39() -- name: updateShortcuts
			-- upvalues: (ref) v_u_20, (ref) v_u_5, (ref) v_u_16, (ref) v_u_26, (ref) v_u_28
			if not v_u_20 or v_u_5:getGamepadActive():get() then
				v_u_26((v_u_16:getCurrentShortcuts()))
				v_u_28({})
			end
		end
		v_u_16:onShortcutBarChanged():connect(v39)
		if v_u_20 then
			v_u_4.LastInputTypeChanged:Connect(v39)
		end
		if not v_u_19() then
			local v_u_40 = v_u_5:getShowTopBar()
			local v_u_41 = v_u_5:getGamepadActive()
			if v_u_18 then
				local function v42() -- name: shouldHideShortcutBar
					-- upvalues: (copy) v_u_40, (copy) v_u_41, (ref) v_u_16
					v_u_16:setHideShortcutBar("TopBar", not (v_u_40:get() and v_u_41:get()))
				end
				v_u_16:setHideShortcutBar("TopBar", not (v_u_40:get() and v_u_41:get()))
				v_u_40:connect(v42)
				v_u_41:connect(v42)
				return
			end
			local function v44() -- name: shouldShowShortcutBar
				-- upvalues: (copy) v_u_40, (copy) v_u_41, (ref) v_u_30
				local v43 = v_u_40:get()
				if v43 then
					v43 = v_u_41:get()
				end
				v_u_30(v43)
			end
			v_u_40:connect(v44)
			v_u_41:connect(v44)
		end
	end, {})
	if v_u_21 and (v_u_22 and v_u_23) then
		local v_u_45 = v_u_24(false)
		local v_u_46 = v_u_15()
		v_u_6.useEffect(function()
			-- upvalues: (ref) v_u_16, (copy) v_u_45, (copy) v_u_46
			v_u_16:setHideShortcutBar("SideSheet", v_u_45 or v_u_46)
		end, { v_u_45, v_u_46 })
	end
	if #v27 > 0 then
		v_u_25 = v27
	end
	local v47 = {}
	for _, v48 in v_u_25 do
		if not v48.label then
			continue
		end
		local v49 = {
			["icon"] = "",
			["text"] = ""
		}
		if v48.icon then
			v49.icon = v48.icon
		end
		v49.text = v48.label
		table.insert(v47, v49)
	end
	local v50 = v_u_7.createPortal
	local v51 = {}
	local v52 = v_u_6.createElement
	local v53 = "ScreenGui"
	local v54 = {
		["Name"] = "ShortcutBar",
		["DisplayOrder"] = nil,
		["ZIndexBehavior"] = nil,
		["Enabled"] = nil,
		["DisplayOrder"] = v_u_11.SHORTCUTBAR_DISPLAYORDER,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	if v_u_18 then
		v29 = nil
	end
	v54.Enabled = v29
	v51.Name = v52(v53, v54, { v_u_6.createElement("Frame", {
			["Name"] = "ShortcutBarWrapper",
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["Position"] = UDim2.new(0.5, 0, 1, not v31 and 0 or -v31.Gap.Medium),
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			[v_u_6.Change.AbsoluteSize] = function(p55)
				-- upvalues: (copy) v_u_33, (copy) v_u_38
				v_u_33.current = p55.AbsoluteSize.X
				v_u_38()
			end
		}, {
			["Layout"] = v_u_6.createElement("UIListLayout"),
			v_u_6.createElement(v_u_10, {
				["items"] = v47
			})
		}) })
	return v50(v51, v_u_3)
end
return ChromeShortcutBar