-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.KeepOutAreasHandler
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local function v_u_19(p5, p6, p7)
	local v8 = p5.X
	local v9 = p5.Y
	local v10 = p6.X
	local v11 = p6.Y - v9
	local v12 = 0
	local v13 = {}
	for _, v14 in ipairs(p7) do
		local v15 = v8 + v12
		local v16 = {
			["Position"] = {
				["X"] = v15,
				["Y"] = v9
			},
			["Size"] = {
				["X"] = v14.position.X - v15,
				["Y"] = v11
			}
		}
		table.insert(v13, v16)
		v8 = v14.position.X
		v12 = v14.size.X
	end
	local v17 = v8 + v12
	local v18 = {
		["Position"] = {
			["X"] = v17,
			["Y"] = v9
		},
		["Size"] = {
			["X"] = v10 - v17,
			["Y"] = v11
		}
	}
	table.insert(v13, v18)
	return v13
end
local function v_u_32(p20, p21)
	-- upvalues: (copy) v_u_2, (copy) v_u_19
	local v22 = {}
	for _, v23 in pairs(p21) do
		local v24 = {
			["id"] = v23.id,
			["size"] = v23.size,
			["position"] = v23.position
		}
		table.insert(v22, v24)
	end
	table.sort(v22, function(p25, p26)
		local v27
		if p25.position.X < p26.position.X then
			v27 = p25.position.X + p25.size.X < p26.size.X + p26.position.X
		else
			v27 = false
		end
		return v27
	end)
	local v28, _ = v_u_2:GetGuiInset()
	local v29 = v_u_19(Vector2.new(0, 0), Vector2.new(p20.X, v28.Y), v22)
	local v30 = nil
	for _, v31 in ipairs(v29) do
		if v30 and v31.Size.X <= v30.Width then
			continue
		end
		v30 = Rect.new(v31.Position.X, v31.Position.Y, v31.Position.X + v31.Size.X, v31.Position.Y + v31.Size.Y)
	end
	return v30
end
function KeepOutAreasHandler(_) -- name: KeepOutAreasHandler
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_32, (copy) v_u_2
	local v_u_34 = v_u_4(function(p33)
		return p33.displayOptions.screenSize
	end)
	local v_u_36 = v_u_4(function(p35)
		return p35.displayOptions.keepOutAreas
	end)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_34, (copy) v_u_36, (ref) v_u_32, (ref) v_u_2
		local v37 = v_u_32(v_u_34, v_u_36)
		if v37 then
			v_u_2:SetTopbarInset(v37)
		end
	end, { v_u_34, v_u_36 })
end
return KeepOutAreasHandler