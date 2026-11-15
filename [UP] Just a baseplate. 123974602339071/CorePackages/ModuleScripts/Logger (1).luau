-- Path: CorePackages.Packages._Index.lumberyak.lumberyak.Logger
-- https://lua.expert

local Cryo = require(script.Parent.Parent.Cryo)
local t1 = {}

t1.__index = t1
t1.Levels = {
    Error = "Error",
    Warning = "Warning",
    Info = "Info",
    Debug = "Debug",
    Trace = "Trace"
}

local t2 = {
    t1.Levels.Error,
    t1.Levels.Warning,
    t1.Levels.Info,
    t1.Levels.Debug,
    t1.Levels.Trace
}
local t3 = {}

for v1, v2 in pairs(t2) do
    t3[v2] = v1
end

function t1.Levels.fromString(p1) -- line: 28
    -- upvalues: t2 (copy)
    if type(p1) ~= "string" then
        return nil
    end

    for _, v3 in pairs(t2) do
        if string.lower(v3) == string.lower(p1) then
            return v3
        end
    end

    return nil
end

function t1.new(p2, p3) -- line: 40
    -- upvalues: t1 (copy)
    local t4 = {
        dirty = true,
        name = p3,
        sinks = {},
        children = {},
        parent = p2,
        context = {},
        active = {},
        cache = {
            sinks = {},
            context = {}
        }
    }

    for v4, _ in pairs(t1.Levels) do
        if p2 then
            t4.active[v4] = p2.active[v4]
        else
            t4.active[v4] = false
        end
    end

    if p2 then
        p2.children[t4] = true
    end

    setmetatable(t4, t1)

    return t4
end

local function setActive(p4, p5) -- line: 72
    -- upvalues: t2 (copy), t3 (copy), setActive (copy)
    local v5 = t3[p4]

    if v5 then
        for i = 1, v5 do
            p5.active[t2[i]] = true
        end

        for v6, _ in pairs(p5.children) do
            setActive(p4, v6)
        end
    end
end

local function setDirty(p6) -- line: 85
    -- upvalues: setDirty (copy)
    p6.dirty = true

    for v7, _ in pairs(p6.children) do
        setDirty(v7)
    end
end

local function updateCache(p7) -- line: 93
    -- upvalues: Cryo (copy), updateCache (copy)
    if p7.dirty then
        if p7.parent then
            updateCache(p7.parent)
            p7.cache.context = Cryo.Dictionary.join(p7.parent.cache.context, p7.context)

            if p7.parent.cache.context.prefix and p7.context.prefix then
                p7.cache.context.prefix = p7.parent.cache.context.prefix .. p7.context.prefix
            end

            p7.cache.sinks = Cryo.List.join(p7.parent.cache.sinks, p7.sinks)
        else
            p7.cache.context = p7.context
            p7.cache.sinks = p7.sinks
        end

        p7.dirty = false
    end
end

function t1.setParent(p8, p9) -- line: 117
    -- upvalues: t2 (copy), t3 (copy), setActive (copy), setDirty (copy), updateCache (copy)
    if p8.parent then
        p8.parent.children[p8] = nil
    end

    updateCache(p9)
    p8.parent = p9
    p8.parent.children[p8] = true

    local n1 = -1

    for _, v8 in pairs(p9.cache.sinks) do
        if t3[v8.maxLevel] then
            n1 = math.max(n1, t3[v8.maxLevel])
        end
    end

    if n1 > -1 then
        setActive(t2[n1], p8)
    end

    p8.dirty = true

    for v10, _ in pairs(p8.children) do
        setDirty(v10)
    end
end

function t1.addSink(p10, p11) -- line: 141
    -- upvalues: setActive (copy), setDirty (copy)
    setActive(p11.maxLevel, p10)
    table.insert(p10.sinks, p11)
    p10.dirty = true

    for v11, _ in pairs(p10.children) do
        setDirty(v11)
    end
end

function t1.setContext(p12, p13) -- line: 147
    -- upvalues: setDirty (copy)
    p12.context = p13
    p12.dirty = true

    for v12, _ in pairs(p12.children) do
        setDirty(v12)
    end
end

local function log(p14, p15, p16) -- line: 152
    -- upvalues: t3 (copy), updateCache (copy)
    if p15.dirty then
        updateCache(p15)
    end

    local t5 = {
        level = p14,
        rawMessage = p16,
        loggerName = p15.name
    }

    for v13, v14 in pairs(p15.cache.context) do
        if type(v14) == "function" then
            t5[v13] = v14()
        else
            t5[v13] = v14
        end
    end

    local v15 = if p16.n == 0 then "LUMBERYAK INTERNAL: No log message given" else p16[1]

    if t5.prefix then
        v15 = t5.prefix .. v15
    end

    if v15:find("{") then
        local n2 = 1
        local v16 = v15:gsub("{(.-)}", function(p17) -- line: 186
            -- upvalues: p16 (copy), t5 (copy), n2 (ref)
            if p17 == "" then
                n2 += 1

                return (tostring(p16[n2]))
            end

            local v18 = t5[p17]

            return v18 and tostring(v18)
        end)

        if p16.n > n2 then
            v16 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
        elseif p16.n < n2 then
            v16 ..= "\nLUMBERYAK INTERNAL: Too few arguments given for format string"
        end

        v15 = v16
    elseif p16.n > 1 then
        v15 ..= "\nLUMBERYAK INTERNAL: Too many arguments given for format string"
    end

    local v19 = t3[p14]

    for _, v20 in pairs(p15.cache.sinks) do
        if t3[v20.maxLevel] and v19 <= t3[v20.maxLevel] then
            v20:log(v15, t5)
        end
    end
end

function t1.error(p18, ...) -- line: 213
    -- upvalues: t1 (copy), log (copy)
    if p18.active[t1.Levels.Error] then
        log(t1.Levels.Error, p18, table.pack(...))
    end
end

function t1.warning(p19, ...) -- line: 220
    -- upvalues: t1 (copy), log (copy)
    if p19.active[t1.Levels.Warning] then
        log(t1.Levels.Warning, p19, table.pack(...))
    end
end

function t1.info(p20, ...) -- line: 227
    -- upvalues: t1 (copy), log (copy)
    if p20.active[t1.Levels.Info] then
        log(t1.Levels.Info, p20, table.pack(...))
    end
end

function t1.debug(p21, ...) -- line: 234
    -- upvalues: t1 (copy), log (copy)
    if p21.active[t1.Levels.Debug] then
        log(t1.Levels.Debug, p21, table.pack(...))
    end
end

function t1.trace(p22, ...) -- line: 241
    -- upvalues: t1 (copy), log (copy)
    if p22.active[t1.Levels.Trace] then
        log(t1.Levels.Trace, p22, table.pack(...))
    end
end

return t1
