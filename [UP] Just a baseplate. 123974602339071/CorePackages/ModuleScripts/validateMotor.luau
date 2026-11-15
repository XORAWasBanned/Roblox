-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.validateMotor
return function(p1) -- name: validateMotor
	local v2 = typeof(p1) == "table"
	assert(v2)
	local v3 = p1.start
	local v4 = typeof(v3) == "function"
	assert(v4)
	local v5 = p1.stop
	local v6 = typeof(v5) == "function"
	assert(v6)
	local v7 = p1.step
	local v8 = typeof(v7) == "function"
	assert(v8)
	local v9 = p1.setGoal
	local v10 = typeof(v9) == "function"
	assert(v10)
	local v11 = p1.onStep
	local v12 = typeof(v11) == "function"
	assert(v12)
	local v13 = p1.onComplete
	local v14 = typeof(v13) == "function"
	assert(v14)
	local v15 = p1.destroy
	local v16 = typeof(v15) == "function"
	assert(v16)
end