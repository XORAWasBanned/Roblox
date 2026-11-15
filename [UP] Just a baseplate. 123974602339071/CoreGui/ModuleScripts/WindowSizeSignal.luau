-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.WindowSizeSignal
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.AppCommonLib).Signal
require(v2.Workspace.Packages.Chrome)
local v_u_4 = require(v1.Service.ViewportUtil)
local v_u_5 = require(v1.Unibar.Constants)
local v_u_6 = require(v2.Workspace.Packages.SharedFlags).FFlagChromeWindowSignalConstraintsToggle
local function v_u_17(p7, p8, p9) -- name: getConstrainedWindowSize
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v10 = v_u_4.mobileDevice:get()
	local v11 = v_u_4.screenSize:get()
	local v12 = v11.Y > v11.X
	if v10 and not (v_u_6 and p9) then
		if v12 then
			local v13 = v_u_5.MAX_HEIGHT_PORTRAIT
			p8 = math.min(p8, v13)
			local v14 = v_u_5.MAX_WIDTH_PORTRAIT
			p7 = math.min(p7, v14)
		elseif not v12 then
			local v15 = v_u_5.MAX_HEIGHT_LANDSCAPE
			p8 = math.min(p8, v15)
			local v16 = v_u_5.MAX_WIDTH_LANDSCAPE
			p7 = math.min(p7, v16)
		end
	end
	return UDim2.new(0, p7, 0, p8)
end
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new(p19, p20, p21, p22) -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_17, (copy) v_u_5, (copy) v_u_3, (copy) v_u_18
	local v23 = {}
	local v24
	if v_u_6 then
		v24 = v_u_17(p19 or v_u_5.DEFAULT_WIDTH, p20 or v_u_5.DEFAULT_HEIGHT, p22 or false)
	else
		v24 = v_u_17(p19 or v_u_5.DEFAULT_WIDTH, p20 or v_u_5.DEFAULT_HEIGHT)
	end
	v23._state = v24
	v23._isLarge = p21 or false
	local v25
	if v_u_6 then
		v25 = p22 or false
	else
		v25 = nil
	end
	v23._ignoreConstraints = v25
	v23._changeSignal = v_u_3.new()
	local v26 = v_u_18
	return setmetatable(v23, v26)
end
function v_u_18.connect(p27, p28) -- name: connect
	return p27._changeSignal:connect(p28)
end
function v_u_18.requestSize(p29, p30, p31) -- name: requestSize
	-- upvalues: (copy) v_u_6, (copy) v_u_17
	local v32
	if v_u_6 then
		v32 = v_u_17(p30, p31, p29._ignoreConstraints)
	else
		v32 = v_u_17(p30, p31)
	end
	if p29._state ~= v32 then
		p29._state = v32
		p29._changeSignal:fire(v32)
	end
end
function v_u_18.toggleIsLarge(p33) -- name: toggleIsLarge
	local v34 = not p33._isLarge
	p33._isLarge = v34
	p33._changeSignal:fire(v34)
end
function v_u_18.get(p35) -- name: get
	return p35._state
end
function v_u_18.getIsLarge(p36) -- name: getIsLarge
	return p36._isLarge
end
function v_u_18.updateConstraints(p37) -- name: updateConstraints
	p37:requestSize(p37._state.Width.Offset, p37._state.Height.Offset)
end
return v_u_18