-- Path: CorePackages.Packages._Index.mock-31ab8d40-0.1.0.mock.symbols
local v1 = {}
local v2 = newproxy(true)
local v_u_3 = ("Mocks.%s"):format("Calls")
getmetatable(v2).__tostring = function()
	-- upvalues: (ref) v_u_3
	return v_u_3
end
v1.Calls = v2
local v4 = newproxy(true)
local v_u_5 = ("Mocks.%s"):format("Children")
getmetatable(v4).__tostring = function()
	-- upvalues: (ref) v_u_5
	return v_u_5
end
v1.Children = v4
local v6 = newproxy(true)
local v_u_7 = ("Mocks.%s"):format("Lock")
getmetatable(v6).__tostring = function()
	-- upvalues: (ref) v_u_7
	return v_u_7
end
v1.Lock = v6
local v8 = newproxy(true)
local v_u_9 = ("Mocks.%s"):format("None")
getmetatable(v8).__tostring = function()
	-- upvalues: (ref) v_u_9
	return v_u_9
end
v1.None = v8
local v10 = newproxy(true)
local v_u_11 = ("Mocks.%s"):format("ReturnValue")
getmetatable(v10).__tostring = function()
	-- upvalues: (ref) v_u_11
	return v_u_11
end
v1.ReturnValue = v10
return v1