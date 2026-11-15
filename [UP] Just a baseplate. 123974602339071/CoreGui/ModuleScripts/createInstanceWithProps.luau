-- Path: CoreGui.RobloxGui.Modules.CoreScriptsRhodiumTest.TestHelpers.createInstanceWithProps
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Packages.UIBlox)
return function(p4, p5, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_7 = Instance.new("ScreenGui", game:GetService("CoreGui"))
	local v8
	if p6 then
		v8 = v_u_2.createElement("Frame", {
			["Size"] = p6
		}, {
			["testElement"] = v_u_2.createElement(p4, p5)
		})
	else
		v8 = v_u_2.createElement(p4, p5)
	end
	local v9 = v_u_2.createFragment
	local v10 = {
		["styleProvider"] = v_u_2.createElement(v_u_3.App.Style.AppStyleProvider, {
			["style"] = {
				["themeName"] = "Dark",
				["fontName"] = "Gotham"
			}
		}, {
			["myElement"] = v8
		})
	}
	local v11 = v9(v10)
	local v_u_12 = v_u_2.mount(v11, v_u_7)
	return v_u_7, function()
		-- upvalues: (ref) v_u_2, (copy) v_u_12, (copy) v_u_7
		v_u_2.unmount(v_u_12)
		v_u_7:Destroy()
	end
end