-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Flags.FFlagTopBarDeprecateCoreGuiRodux)
local v_u_5 = require(v3.Flags.FFlagTopBarDeprecateChatRodux)
local v_u_6 = require(v3.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local v_u_7 = require(v3.Flags.FFlagTopBarDeprecateRespawnRodux)
local v_u_8 = require(v3.Flags.FFlagTopBarDeprecateMoreMenuRodux)
local v9 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_10 = v9.Flags.FFlagTopBarSignalizeHealthBar
local v_u_11 = v9.Flags.FFlagTopBarSignalizeMenuOpen
local v_u_12 = require(script.CoreGuiConnector)
local v_u_13 = require(script.MenuConnector)
local v_u_14 = require(script.ChatConnector)
local v_u_15 = require(script.HealthConnector)
local v_u_16 = require(script.EnabledNotifier)
local v_u_17 = require(script.OpenUIConnector)
require(script.LastInputTypeConnector)
local v18 = v_u_2.PureComponent:extend("Connection")
function v18.render(_) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_7, (copy) v_u_13, (copy) v_u_5, (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_8, (copy) v_u_17
	local v19 = v_u_2.createFragment
	local v20 = {}
	local v21
	if v_u_4 then
		v21 = nil
	else
		v21 = v_u_2.createElement(v_u_12)
	end
	v20.CoreGuiConnector = v21
	local v22
	if v_u_11 and v_u_7 then
		v22 = nil
	else
		v22 = v_u_2.createElement(v_u_13)
	end
	v20.MenuConnector = v22
	local v23
	if v_u_5 then
		v23 = nil
	else
		v23 = v_u_2.createElement(v_u_14)
	end
	v20.ChatConnector = v23
	local v24
	if v_u_10 then
		v24 = nil
	else
		v24 = v_u_2.createElement(v_u_15)
	end
	v20.HealthConnector = v24
	local v25
	if v_u_6 then
		v25 = nil
	else
		v25 = v_u_2.createElement(v_u_16)
	end
	v20.EnabledNotifier = v25
	local v26
	if v_u_8 then
		v26 = nil
	else
		v26 = v_u_2.createElement(v_u_17)
	end
	v20.OpenUIConnector = v26
	return v19(v20)
end
return v18