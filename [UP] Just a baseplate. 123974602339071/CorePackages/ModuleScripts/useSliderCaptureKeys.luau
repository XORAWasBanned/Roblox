-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.useSliderCaptureKeys
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers.Services).UserInputService
local v_u_5 = require(script.Parent.constants)
return function(p_u_6, p7) -- name: useSliderCaptureKeys
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v_u_8 = v_u_3.useRef(p7)
	v_u_8.current = p7
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_6, (ref) v_u_4, (ref) v_u_5, (copy) v_u_8
		if p_u_6 then
			local v_u_11 = v_u_4.InputBegan:Connect(function(p9)
				-- upvalues: (ref) v_u_5, (ref) v_u_8
				local v10 = p9.KeyCode
				if table.find(v_u_5.enter, v10) ~= nil and true or table.find(v_u_5.thumbSwitch, v10) ~= nil then
					v_u_8.current()
				end
			end)
			return function()
				-- upvalues: (copy) v_u_11
				v_u_11:Disconnect()
			end
		end
	end, { p_u_6 })
end