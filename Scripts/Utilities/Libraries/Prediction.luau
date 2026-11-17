--[[
	Prediction Library (improved)
	Base source: https://devforum.roblox.com/t/predict-projectile-ballistics-including-gravity-and-motion/1842434

	Changes from original:
	- Jump/landing correction now only runs when the target is actually airborne
	  (gated on `playerJump`), instead of on any frame where Y velocity is nonzero
	  (which fires constantly from normal movement jitter and was causing aim to
	  drop toward the target's feet).
	- Replaced the fake "100 iteration" loop (which always broke after 1 pass)
	  with a single downward raycast + closed-form landing-time solve.
	- Quartic solver now picks the SMALLEST positive real root, not just the
	  first one found in array order, so we always aim for the earliest valid
	  intercept time instead of a potentially later/wrong one.
	- Added nil/NaN guards so a bad raycast or degenerate solve can't return
	  a garbage position.
]]

local module = {}
local eps = 1e-9

local function isZero(d)
	return (d > -eps and d < eps)
end

local function cuberoot(x)
	return (x > 0) and math.pow(x, (1 / 3)) or -math.pow(math.abs(x), (1 / 3))
end

local function solveQuadric(c0, c1, c2)
	local s0, s1
	local p, q, D

	p = c1 / (2 * c0)
	q = c2 / c0
	D = p * p - q

	if isZero(D) then
		s0 = -p
		return s0
	elseif (D < 0) then
		return
	else -- D > 0
		local sqrt_D = math.sqrt(D)
		s0 = sqrt_D - p
		s1 = -sqrt_D - p
		return s0, s1
	end
end

local function solveCubic(c0, c1, c2, c3)
	local s0, s1, s2
	local num, sub
	local A, B, C
	local sq_A, p, q
	local cb_p, D

	A = c1 / c0
	B = c2 / c0
	C = c3 / c0

	sq_A = A * A
	p = (1 / 3) * (-(1 / 3) * sq_A + B)
	q = 0.5 * ((2 / 27) * A * sq_A - (1 / 3) * A * B + C)

	cb_p = p * p * p
	D = q * q + cb_p

	if isZero(D) then
		if isZero(q) then
			s0 = 0
			num = 1
		else
			local u = cuberoot(-q)
			s0 = 2 * u
			s1 = -u
			num = 2
		end
	elseif (D < 0) then -- Casus irreducibilis: three real solutions
		local phi = (1 / 3) * math.acos(-q / math.sqrt(-cb_p))
		local t = 2 * math.sqrt(-p)

		s0 = t * math.cos(phi)
		s1 = -t * math.cos(phi + math.pi / 3)
		s2 = -t * math.cos(phi - math.pi / 3)
		num = 3
	else -- one real solution
		local sqrt_D = math.sqrt(D)
		local u = cuberoot(sqrt_D - q)
		local v = -cuberoot(sqrt_D + q)

		s0 = u + v
		num = 1
	end

	sub = (1 / 3) * A

	if (num > 0) then s0 = s0 - sub end
	if (num > 1) then s1 = s1 - sub end
	if (num > 2) then s2 = s2 - sub end

	return s0, s1, s2
end

function module.solveQuartic(c0, c1, c2, c3, c4)
	local s0, s1, s2, s3
	local coeffs = {}
	local z, u, v, sub
	local A, B, C, D
	local sq_A, p, q, r
	local num

	A = c1 / c0
	B = c2 / c0
	C = c3 / c0
	D = c4 / c0

	sq_A = A * A
	p = -0.375 * sq_A + B
	q = 0.125 * sq_A * A - 0.5 * A * B + C
	r = -(3 / 256) * sq_A * sq_A + 0.0625 * sq_A * B - 0.25 * A * C + D

	if isZero(r) then
		coeffs[3] = q
		coeffs[2] = p
		coeffs[1] = 0
		coeffs[0] = 1

		local results = { solveCubic(coeffs[0], coeffs[1], coeffs[2], coeffs[3]) }
		num = #results
		s0, s1, s2 = results[1], results[2], results[3]
	else
		coeffs[3] = 0.5 * r * p - 0.125 * q * q
		coeffs[2] = -r
		coeffs[1] = -0.5 * p
		coeffs[0] = 1

		s0, s1, s2 = solveCubic(coeffs[0], coeffs[1], coeffs[2], coeffs[3])
		z = s0

		u = z * z - r
		v = 2 * z - p

		if isZero(u) then
			u = 0
		elseif (u > 0) then
			u = math.sqrt(u)
		else
			return
		end
		if isZero(v) then
			v = 0
		elseif (v > 0) then
			v = math.sqrt(v)
		else
			return
		end

		coeffs[2] = z - u
		coeffs[1] = q < 0 and -v or v
		coeffs[0] = 1

		do
			local results = { solveQuadric(coeffs[0], coeffs[1], coeffs[2]) }
			num = #results
			s0, s1 = results[1], results[2]
		end

		coeffs[2] = z + u
		coeffs[1] = q < 0 and v or -v
		coeffs[0] = 1

		if (num == 0) then
			local results = { solveQuadric(coeffs[0], coeffs[1], coeffs[2]) }
			num = num + #results
			s0, s1 = results[1], results[2]
		end
		if (num == 1) then
			local results = { solveQuadric(coeffs[0], coeffs[1], coeffs[2]) }
			num = num + #results
			s1, s2 = results[1], results[2]
		end
		if (num == 2) then
			local results = { solveQuadric(coeffs[0], coeffs[1], coeffs[2]) }
			num = num + #results
			s2, s3 = results[1], results[2]
		end
	end

	sub = 0.25 * A

	if (num > 0) then s0 = s0 - sub end
	if (num > 1) then s1 = s1 - sub end
	if (num > 2) then s2 = s2 - sub end
	if (num > 3) then s3 = s3 - sub end

	return { s3, s2, s1, s0 }
end

--[[
	Resolves the target's landing position/time if they are airborne.
	Returns adjusted (targetPos, verticalVelocity) — verticalVelocity is zeroed
	out once we've snapped targetPos to the ground, since at that point the
	target is no longer accelerating downward relative to our aim solve.

	maxFallDistance: safety cap on the downward raycast so this doesn't behave
	oddly over pits/voids with no floor. Defaults to 500 studs.
]]
local function resolveAirborneTarget(targetPos, verticalVelocity, playerGravity, playerHeight, params, maxFallDistance)
	maxFallDistance = maxFallDistance or 500

	local downRay = workspace:Raycast(targetPos, Vector3.new(0, -maxFallDistance, 0), params)
	if not downRay then
		-- No ground found within range; fall back to treating them as unaffected
		return targetPos, verticalVelocity
	end

	local groundY = downRay.Position.Y + playerHeight
	local fallHeight = targetPos.Y - groundY

	if fallHeight <= 0 then
		-- Already at/below ground level (e.g. edge case at jump apex); nothing to correct
		return targetPos, verticalVelocity
	end

	-- Solve 0.5*g*t^2 - v0*t - fallHeight = 0 for landing time (v0 = current upward velocity)
	local a, b, c = 0.5 * playerGravity, -verticalVelocity, -fallHeight
	local disc = b * b - 4 * a * c
	if disc < 0 then
		return targetPos, verticalVelocity
	end

	local landTime = (-b + math.sqrt(disc)) / (2 * a)
	if not landTime or landTime <= 0 or landTime ~= landTime then -- landTime ~= landTime catches NaN
		return targetPos, verticalVelocity
	end

	local groundedPos = Vector3.new(targetPos.X, groundY, targetPos.Z)
	return groundedPos, 0
end

function module.SolveTrajectory(origin, projectileSpeed, gravity, targetPos, targetVelocity, playerGravity, playerHeight, playerJump, params, maxFallDistance)
	local p, q, r = targetVelocity.X, targetVelocity.Y, targetVelocity.Z

	-- Only run landing correction when the target is actually airborne (jumping/falling).
	-- Gating on playerJump avoids this firing on ordinary per-frame velocity jitter
	-- from walking, which was previously dragging the aim point down toward the feet.
	if playerJump and math.abs(q) > 0.01 and playerGravity and playerGravity > 0 then
		targetPos, q = resolveAirborneTarget(targetPos, q, playerGravity, playerHeight, params, maxFallDistance)
	end

	local disp = targetPos - origin
	local h, j, k = disp.X, disp.Y, disp.Z
	local l = -0.5 * gravity

	if gravity == 0 then
		local t = disp.Magnitude / projectileSpeed
		if t <= 0 then return end
		local d = (h + p * t) / t
		local e = (j + q * t - l * t * t) / t
		local f = (k + r * t) / t
		return origin + Vector3.new(d, e, f)
	end

	local solutions = module.solveQuartic(
		l * l,
		-2 * q * l,
		q * q - 2 * j * l - projectileSpeed * projectileSpeed + p * p + r * r,
		2 * j * q + 2 * h * p + 2 * k * r,
		j * j + h * h + k * k
	)

	if not solutions then
		return
	end

	-- Pick the SMALLEST positive real root — the earliest valid intercept time —
	-- rather than just the first positive one found in array order.
	local bestT = nil
	for _, v in solutions do
		if v and v == v and v > eps then -- v == v filters out NaN
			if not bestT or v < bestT then
				bestT = v
			end
		end
	end

	if not bestT then
		return
	end

	local t = bestT
	local d = (h + p * t) / t
	local e = (j + q * t - l * t * t) / t
	local f = (k + r * t) / t

	local result = origin + Vector3.new(d, e, f)

	-- Final sanity check: reject NaN/garbage results rather than returning a bad aim point
	if result.X ~= result.X or result.Y ~= result.Y or result.Z ~= result.Z then
		return
	end

	return result
end

return module
