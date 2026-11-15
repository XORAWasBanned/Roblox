-- Path: CoreGui.RobloxGui.Modules.CoreScriptsRhodiumTest.Helpers.withServices
local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Packages.Roact)
local v_u_5 = require(v3.Packages.Rodux)
local v_u_6 = require(v3.Packages.RoactRodux)
local v7 = require(v3.Packages.UIBlox)
local v_u_8 = v7.App.Style.AppStyleProvider
local v_u_9 = v7.App.Style.Constants
local v_u_10 = require(v3.Packages.Foundation).Enums.ColorMode
local function v_u_16(p11, p12) -- name: dumpInstanceTree
	-- upvalues: (copy) v_u_16
	local v13 = p12 or ""
	if p11 == nil then
		print(v13 .. "[nil Instance]")
	else
		print(v13 .. p11.Name)
		local v14 = v13 .. "  "
		for _, v15 in ipairs(p11:GetChildren()) do
			v_u_16(v15, v14)
		end
	end
end
return function(p_u_17, p18, p19, p20, p21)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_1, (copy) v_u_2, (copy) v_u_16
	local v22 = v_u_5.Store.new(p19, p20 or {}, { v_u_5.thunkMiddleware })
	local v23 = v_u_4.createElement(v_u_6.StoreProvider, {
		["store"] = v22
	}, {
		["AppStyleProvider"] = v_u_4.createElement(v_u_8, {
			["style"] = {
				["themeName"] = v_u_10.Dark,
				["fontName"] = v_u_9.FontName.Gotham
			}
		}, {
			["Folder"] = v_u_4.createElement("Folder", {}, {
				["Root"] = v_u_4.createElement(p18, p21 or {})
			})
		})
	})
	local v24 = tostring(p18)
	local v25 = v_u_4.createElement("ScreenGui", {
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}, {
		[v24] = v23
	})
	local v26 = "Test-" .. v_u_1:GenerateGUID(false)
	local v27 = v_u_4.mount(v25, v_u_2, v26)
	local v_u_28 = ("game.CoreGui.%s.*[ClassName=Folder].*"):format(v26)
	local v29, v30 = pcall(function()
		-- upvalues: (copy) p_u_17, (copy) v_u_28
		p_u_17(v_u_28)
	end)
	if not v29 then
		print("Test instance tree:\n")
		v_u_16(v_u_2:FindFirstChild(v26))
		print()
	end
	v_u_4.unmount(v27)
	if not v29 then
		error(v30)
	end
end