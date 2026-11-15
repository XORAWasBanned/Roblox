-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism.entry
-- https://lua.expert

local LuauPolyfill = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array, Set, Map, Error = LuauPolyfill.Array, LuauPolyfill.Set, LuauPolyfill.Map, LuauPolyfill.Error
local t1 = {}
local v1 = newproxy(true)

getmetatable(v1).__tostring = function() -- line: 34
    return "Value.None"
end

local rememberParent, reallyRecompute, recomputeNewValue, mightBeDirty, setClean, reportDirty, reportClean, eachParent, reportDirtyChild, reportCleanChild, removeDirtyChild, forgetChildren, forgetChild, maybeSubscribe
local parentEntrySlot = require(script.Parent.context).parentEntrySlot

require(script.Parent.initTypes)
require(script.Parent.depTypes)

local helpers = require(script.Parent.helpers)
local maybeUnsubscribe, toArray = helpers.maybeUnsubscribe, helpers.toArray
local t2 = {}

local function assert(p1, p2) -- line: 73
    -- upvalues: Error (copy)
    if not p1 then
        error(Error.new(p2 or "assertion failure"))
    end
end

require(script.Parent.entryTypes)
require(script.Parent.anyEntryTypes)

local function valueIs(p3, p4) -- line: 87
    local v2 = #p3

    if v2 > 0 and v2 == #p4 then
        return p3[v2] == p4[v2]
    end

    return false
end

local function valueGet(p5) -- line: 98
    -- upvalues: Error (copy), v1 (copy)
    if p5[2] == nil then
        if p5[1] == nil then
            error(Error.new("unknown value"))

            return
        end

        return if p5[1] ~= v1 then p5[1] else nil
    end

    error(p5[2])
end

local function valueCopy(p6) -- line: 123
    return (table.clone(p6))
end

local t3 = {}

t3.__index = t3
t3.count = 0

function t3.new(p7) -- line: 138
    -- upvalues: Set (copy), Map (copy), t3 (copy)
    local self = setmetatable({}, t3)

    self.parents = Set.new()
    self.childValues = Map.new(nil)
    self.dirtyChildren = nil
    self.dirty = true
    self.recomputing = false
    self.value = {}
    self.deps = nil
    self.fn = p7
    t3.count += 1

    return self
end

function t3:peek() -- line: 159
    -- upvalues: rememberParent (ref), mightBeDirty (ref)
    if #self.value ~= 1 or mightBeDirty(self) then
        return nil
    end

    rememberParent(self)

    return self.value[1]
end

function t3:recompute(p10) -- line: 173
    -- upvalues: Error (copy), rememberParent (ref), reallyRecompute (ref), mightBeDirty (ref), valueGet (copy)
    if self.recomputing then
        error(Error.new("already recomputing"))
    end

    rememberParent(self)

    if mightBeDirty(self) then
        return reallyRecompute(self, p10)
    end

    return valueGet(self.value)
end

function t3:setDirty() -- line: 183
    -- upvalues: reportDirty (ref), maybeUnsubscribe (copy)
    if self.dirty then
        return
    end

    self.dirty = true
    self.value = {}
    reportDirty(self)
    maybeUnsubscribe(self)
end

function t3.dispose(p12) -- line: 198
    -- upvalues: eachParent (ref), forgetChildren (ref), forgetChild (ref)
    p12:setDirty()
    forgetChildren(p12)
    eachParent(p12, function(p13, _) -- line: 216
        -- upvalues: p12 (copy), forgetChild (ref)
        p13:setDirty()
        forgetChild(p13, p12)

        return nil
    end)
end

function t3.forget(p15) -- line: 223
    p15:dispose()
end

function t3:dependOn(p17) -- line: 230
    -- upvalues: Set (copy), t2 (copy)
    p17:add(self)

    if not self.deps then
        self.deps = table.remove(t2) or Set.new()
    end

    self.deps:add(p17)
end

function t3:forgetDeps() -- line: 240
    -- upvalues: Array (copy), toArray (copy), t2 (copy)
    if self.deps then
        Array.forEach(toArray(self.deps), function(p19) -- line: 244
            -- upvalues: self (copy)
            p19:delete(self)
        end)
        self.deps:clear()
        table.insert(t2, self.deps)
        self.deps = nil
    end
end

t1.Entry = t3

function rememberParent(p20) -- line: 255
    -- upvalues: mightBeDirty (ref), reportDirtyChild (ref), reportCleanChild (ref), parentEntrySlot (copy)
    local v4 = parentEntrySlot:getValue()

    if not v4 then
        return nil
    end

    p20.parents:add(v4)

    if not v4.childValues:has(p20) then
        v4.childValues:set(p20, {})
    end

    if mightBeDirty(p20) then
        reportDirtyChild(v4, p20)
    else
        reportCleanChild(v4, p20)
    end

    return v4
end

function reallyRecompute(p21, p22) -- line: 281
    -- upvalues: recomputeNewValue (ref), setClean (ref), forgetChildren (ref), maybeSubscribe (ref), parentEntrySlot (copy), valueGet (copy)
    forgetChildren(p21)

    local recomputeNewValue2 = recomputeNewValue

    parentEntrySlot:withValue(p21, recomputeNewValue2, {
        p21,
        p22
    })

    if maybeSubscribe(p21, p22) then
        setClean(p21)
    end

    return valueGet(p21.value)
end

function recomputeNewValue(_, p24, p25) -- line: 298
    -- upvalues: v1 (copy)
    p24.recomputing = true
    table.clear(p24.value)

    local fn = p24.fn
    local unpack = table.unpack
    local ok, result = pcall(fn, unpack(p25))

    if ok then
        p24.value[1] = result

        if p24.value[1] == nil then
            p24.value[1] = v1
        end
    else
        p24.value[2] = result
    end

    p24.recomputing = false
end

function mightBeDirty(p26) -- line: 321
    local dirty = p26.dirty

    if not dirty then
        dirty = p26.dirtyChildren ~= nil and p26.dirtyChildren.size > 0
    end

    return dirty
end

function setClean(p27) -- line: 327
    -- upvalues: mightBeDirty (ref), reportClean (ref)
    p27.dirty = false

    if not mightBeDirty(p27) then
        reportClean(p27)
    end
end

function reportDirty(p28) -- line: 339
    -- upvalues: eachParent (ref), reportDirtyChild (ref)
    eachParent(p28, reportDirtyChild)
end

function reportClean(p29) -- line: 343
    -- upvalues: eachParent (ref), reportCleanChild (ref)
    eachParent(p29, reportCleanChild)
end

function eachParent(p30, p31) -- line: 347
    -- upvalues: toArray (copy)
    local size = p30.parents.size

    if size then
        local v5 = toArray(p30.parents)

        for i = 1, size do
            p31(v5[i], p30)
        end
    end
end

function reportDirtyChild(p32, p33) -- line: 360
    -- upvalues: Set (copy), Error (copy), mightBeDirty (ref), reportDirty (ref), t2 (copy)
    if _G.__DEV__ then
        local v6, v7 = p32.childValues:has(p33)

        if not v6 then
            error(Error.new(v7 or "assertion failure"))
        end

        local v8, v9 = mightBeDirty(p33)

        if not v8 then
            error(Error.new(v9 or "assertion failure"))
        end
    end

    local v10 = not mightBeDirty(p32)

    if p32.dirtyChildren then
        if p32.dirtyChildren:has(p33) then
            return
        end
    else
        p32.dirtyChildren = table.remove(t2) or Set.new()
    end

    p32.dirtyChildren:add(p33)

    if v10 then
        reportDirty(p32)
    end
end

function reportCleanChild(p34, p35) -- line: 394
    -- upvalues: Error (copy), mightBeDirty (ref), reportClean (ref), removeDirtyChild (ref)
    if _G.__DEV__ then
        local v11, v12 = p34.childValues:has(p35)

        if not v11 then
            error(Error.new(v12 or "assertion failure"))
        end

        if mightBeDirty(p35) then
            error(Error.new("assertion failure"))
        end
    end

    local v13 = p34.childValues:get(p35)

    if #v13 == 0 then
        local childValues = p34.childValues
        local value = p35.value

        childValues:set(p35, (table.clone(value)))
    else
        local value = p35.value
        local v14 = #v13

        if not (v14 > 0) or v14 ~= #value or v13[v14] ~= value[v14] then
            p34:setDirty()
        end
    end

    removeDirtyChild(p34, p35)

    if not mightBeDirty(p34) then
        reportClean(p34)
    end
end

function removeDirtyChild(p36, p37) -- line: 421
    -- upvalues: t2 (copy)
    local dirtyChildren = p36.dirtyChildren

    if dirtyChildren ~= nil then
        dirtyChildren:delete(p37)

        if dirtyChildren.size == 0 then
            if #t2 < 100 then
                table.insert(t2, dirtyChildren)
            end

            p36.dirtyChildren = nil
        end
    end
end

function forgetChildren(p38) -- line: 436
    -- upvalues: Array (copy), Error (copy), forgetChild (ref)
    if p38.childValues.size > 0 then
        local v15 = table.clone(p38.childValues:keys())

        Array.forEach(v15, function(p39) -- line: 444
            -- upvalues: p38 (copy), forgetChild (ref)
            forgetChild(p38, p39)
        end)
    end

    p38:forgetDeps()

    if p38.dirtyChildren ~= nil then
        error(Error.new("assertion failure"))
    end
end

function forgetChild(p40, p41) -- line: 458
    -- upvalues: removeDirtyChild (ref)
    p41.parents:delete(p40)
    p40.childValues:delete(p41)
    removeDirtyChild(p40, p41)
end

function maybeSubscribe(p42, p43) -- line: 464
    -- upvalues: maybeUnsubscribe (copy)
    local v16 = typeof(p42.subscribe) == "function"
    local v17

    if v16 then
        local function v18() -- line: 466
            -- upvalues: p42 (copy), p43 (copy), maybeUnsubscribe (copy)
            maybeUnsubscribe(p42)
            p42.unsubscribe = p42.subscribe(table.unpack(p43))

            return nil, false
        end

        v17 = pcall(v18)
    end

    if not v16 or v17 then
        return true
    end

    p42:setDirty()

    return false
end

return t1
