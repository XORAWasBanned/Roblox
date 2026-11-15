-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.DisplayOptions
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
if require(v4.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
end
local v5 = v4.Actions
local v6 = require(v5.SetMenuOpen)
local v7 = require(v5.SetTopBarEnabled)
local v8 = require(v5.SetSmallTouchDevice)
local v9 = require(v5.SetScreenSize)
local v10 = require(v5.SetKeepOutArea)
local v11 = require(v5.RemoveKeepOutArea)
require(v5.SetInputType)
local v12 = require(v5.SetInspectMenuOpen)
local v13 = require(v5.SetGamepadMenuOpen)
local v14 = require(v5.SetGamepadNavigationDialogOpen)
local v_u_15 = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest)
local v16 = require(v1.Workspace.Packages.CoreGuiCommon)
local v17 = v16.Flags.FFlagTopBarSignalizeMenuOpen
local v18 = v16.Flags.FFlagTopBarSignalizeKeepOutAreas
local v19 = v16.Flags.FFlagTopBarSignalizeScreenSize
local _ = require(v4.Constants).InputType
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v20 = {
	["menuOpen"] = false,
	["inspectMenuOpen"] = false,
	["topbarEnabled"] = true,
	["isSmallTouchDevice"] = false,
	["screenSize"] = nil,
	["isGamepadMenuOpen"] = false,
	["isGamepadNavigationDialogOpen"] = nil,
	["keepOutAreas"] = nil,
	["screenSize"] = Vector2.new(0, 0)
}
local v21
if v_u_15 then
	v21 = false
else
	v21 = nil
end
v20.isGamepadNavigationDialogOpen = v21
v20.keepOutAreas = {}
return v2.createReducer(v20, {
	[v17 and "" or v6.name] = not v17 and function(p22, p23)
		-- upvalues: (copy) v_u_3
		local v24 = p22.isGamepadMenuOpen
		if not p22.menuOpen and p23.menuOpen then
			v24 = false
		end
		return v_u_3.Dictionary.join(p22, {
			["menuOpen"] = p23.menuOpen,
			["isGamepadMenuOpen"] = v24
		})
	end or nil,
	[v7.name] = function(p25, p26)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p25, {
			["topbarEnabled"] = p26.enabled
		})
	end,
	[v8.name] = function(p27, p28)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p27, {
			["isSmallTouchDevice"] = p28.isSmallTouchDevice
		})
	end,
	[v19 and "" or v9.name] = not v19 and function(p29, p30)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p29, {
			["screenSize"] = p30.screenSize
		})
	end or nil,
	[v17 and "" or v12.name] = not v17 and function(p31, p32)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p31, {
			["inspectMenuOpen"] = p32.inspectMenuOpen
		})
	end or nil,
	[v13.name] = function(p33, p34)
		-- upvalues: (copy) v_u_3, (copy) v_u_15
		local v35 = v_u_3.Dictionary.join
		local v36 = {
			["isGamepadMenuOpen"] = p34.open
		}
		local v37
		if v_u_15 then
			v37 = false
		else
			v37 = nil
		end
		v36.isGamepadNavigationDialogOpen = v37
		return v35(p33, v36)
	end,
	[v14.name] = v_u_15 and function(p38, p39)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p38, {
			["isGamepadNavigationDialogOpen"] = p39.open
		})
	end or nil,
	[v18 and "" or v10.name] = not v18 and function(p40, p41)
		-- upvalues: (copy) v_u_3
		local v42 = table.clone(p40.keepOutAreas)
		v42[p41.id] = {
			["size"] = p41.size,
			["position"] = p41.position
		}
		return v_u_3.Dictionary.join(p40, {
			["keepOutAreas"] = v42
		})
	end or nil,
	[v18 and "" or v11.name] = not v18 and function(p43, p44)
		-- upvalues: (copy) v_u_3
		local v45 = table.clone(p43.keepOutAreas)
		v45[p44.id] = nil
		return v_u_3.Dictionary.join(p43, {
			["keepOutAreas"] = v45
		})
	end or nil
})