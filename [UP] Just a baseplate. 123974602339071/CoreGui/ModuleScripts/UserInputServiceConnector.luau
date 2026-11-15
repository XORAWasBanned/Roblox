-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.UserInputServiceConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Actions.ClosePlayerDropDown)
local v_u_7 = require(v5.Actions.SetIsUsingGamepad)
local v_u_8 = require(script.Parent.EventConnection)
local v9 = v_u_3.PureComponent:extend("UserInputServiceConnector")
function v9.render(p_u_10) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_2
	local v11 = v_u_3.createFragment
	local v17 = {
		["InputBeganConnection"] = v_u_3.createElement(v_u_8, {
			["event"] = v_u_2.InputBegan,
			["callback"] = function(p12, p13) -- name: callback
				-- upvalues: (copy) p_u_10
				if p_u_10.props.playerDropdownVisible then
					if not p13 then
						local v14 = p12.UserInputType
						if v14 == Enum.UserInputType.Touch or v14 == Enum.UserInputType.MouseButton1 then
							p_u_10.props.closePlayerDropDown()
						end
					end
				else
					return
				end
			end
		}),
		["LastInputTypeChangedConnection"] = v_u_3.createElement(v_u_8, {
			["event"] = v_u_2.LastInputTypeChanged,
			["callback"] = function(p15) -- name: callback
				-- upvalues: (copy) p_u_10
				local v16 = p15.Name:find("Gamepad") ~= nil
				if v16 ~= p_u_10.props.isUsingGamepad then
					p_u_10.props.setIsUsingGamepad(v16)
				end
			end
		})
	}
	return v11(v17)
end
return v4.connect(function(p18) -- name: mapStateToProps
	return {
		["playerDropdownVisible"] = p18.playerDropDown.isVisible,
		["isUsingGamepad"] = p18.displayOptions.isUsingGamepad
	}
end, function(p_u_19) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	return {
		["closePlayerDropDown"] = function() -- name: closePlayerDropDown
			-- upvalues: (copy) p_u_19, (ref) v_u_6
			return p_u_19(v_u_6())
		end,
		["setIsUsingGamepad"] = function(p20) -- name: setIsUsingGamepad
			-- upvalues: (copy) p_u_19, (ref) v_u_7
			return p_u_19(v_u_7(p20))
		end
	}
end)(v9)