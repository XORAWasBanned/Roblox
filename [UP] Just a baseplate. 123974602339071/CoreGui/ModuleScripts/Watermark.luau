-- Path: CoreGui.RobloxGui.Modules.Watermark
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.WatermarkComponent)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new() -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v6 = v_u_5
	local v7 = setmetatable({}, v6)
	v7.root = v_u_3.createElement(v_u_4)
	v7.element = v_u_3.mount(v7.root, v_u_2, "Watermark")
	return v7
end
return v_u_5.new()