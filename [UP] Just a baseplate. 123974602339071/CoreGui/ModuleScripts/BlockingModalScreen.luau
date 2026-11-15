-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Blocking.BlockingModalScreen
local v_u_1 = game:GetService("CoreGui")
local v2 = v_u_1:WaitForChild("RobloxGui")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Packages.t)
local v_u_5 = require(v3.Packages.Roact)
local v6 = require(v3.Packages.Foundation)
local v_u_7 = require(script.Parent.BlockingModalContainer)
local v_u_8 = require(v2.Modules.Common.renderWithCoreScriptsStyleProvider)
local v9 = require(v3.Workspace.Packages.FocusNavigationUtils)
local v_u_10 = v9.FocusRoot
local v_u_11 = v9.FocusNavigableSurfaceIdentifierEnum
local v_u_12 = v6.Hooks.useOverlay
local v_u_13 = v_u_5.PureComponent:extend("BlockingModalScreen")
local v14 = v4.interface
local v15 = {
	["closeModal"] = v4.callback,
	["player"] = v4.interface({
		["DisplayName"] = v4.string,
		["Name"] = v4.string,
		["UserId"] = v4.number
	}),
	["translator"] = v4.optional(v4.table),
	["source"] = v4.optional(v4.string),
	["onBlockingSuccess"] = v4.optional(v4.callback),
	["overlay"] = v4.optional(v4.instanceIsA("GuiBase2d"))
}
v_u_13.validateProps = v14(v15)
function v_u_13.render(p16) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_7, (copy) v_u_1, (copy) v_u_8
	local v17 = p16.props.overlay
	local v18 = v_u_5.createElement(v_u_10, {
		["surfaceIdentifier"] = nil,
		["isIsolated"] = true,
		["isAutoFocusRoot"] = true,
		["surfaceIdentifier"] = v_u_11.CentralOverlay
	}, {
		["BlockingModalContainerWrapper"] = v_u_5.createElement(v_u_7, p16.props)
	})
	local v19
	if v17 == nil then
		v19 = {}
		local v20 = v_u_5.createElement
		local v21 = v_u_5.Portal
		local v22 = {
			["target"] = v_u_1
		}
		local v23 = {
			["BlockingModalScreen"] = v_u_5.createElement("ScreenGui", {
				["IgnoreGuiInset"] = true,
				["AutoLocalize"] = false,
				["DisplayOrder"] = 6
			}, {
				["BlockingModalContainer"] = v18
			})
		}
		__set_list(v19, 1, {v20(v21, v22, v23)})
	else
		v19 = { v_u_5.createElement(v_u_5.Portal, {
				["target"] = v17
			}, {
				["BlockingModalScreen"] = v18
			}) }
	end
	return v_u_8(v19)
end
return function(p24) -- name: BlockingModalScreenWithFoundationOverlay
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_13
	local v25 = v_u_12()
	local v26 = table.clone(p24)
	v26.overlay = v25
	return v_u_5.createElement(v_u_13, v26)
end