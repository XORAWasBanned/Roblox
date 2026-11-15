-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.SourceSpan
-- https://lua.expert

local t1 = {}

t1.__index = t1

local function new(p1, p2, p3, p4) -- line: 26
    -- upvalues: t1 (copy)
    if p1 < 0 then
        error((("lineIndex %* must be >= 0"):format(p1)))
    end

    if p2 < 0 then
        error((("columnIndex %* must be >= 0"):format(p2)))
    end

    if p3 < 0 then
        error((("inputIndex %* must be >= 0"):format(p3)))
    end

    if p4 < 0 then
        error((("length %* must be >= 0"):format(p4)))
    end

    return (setmetatable({
        _lineIndex = p1,
        _columnIndex = p2,
        _inputIndex = p3,
        _length = p4
    }, t1))
end

function t1.of(p5, p6, p7, p8) -- line: 47
    -- upvalues: new (copy)
    return (new(p5, p6, p7, p8))
end

function t1.getLineIndex(p9) -- line: 54
    return p9._lineIndex
end

function t1.getColumnIndex(p10) -- line: 58
    return p10._columnIndex
end

function t1.getInputIndex(p11) -- line: 62
    return p11._inputIndex
end

function t1.getLength(p12) -- line: 66
    return p12._length
end

function t1.subSpan(p13, p14, p15) -- line: 73
    -- upvalues: new (copy)
    local _length = p13._length

    if p15 == nil then
        return p13:subSpan(p14, _length)
    end

    if p14 < 0 then
        error((("beginIndex %* + must be >= 0"):format(p14)))
    end

    if _length < p14 then
        error((("beginIndex %* must be <= length %*"):format(p14, _length)))
    end

    if p15 < 0 then
        error((("endIndex %* + must be >= 0"):format(p15)))
    end

    if _length < p15 then
        error((("endIndex %* must be <= length %*"):format(p15, _length)))
    end

    if p15 < p14 then
        error((("beginIndex %* must be <= endIndex %*"):format(p14, p15)))
    end

    if p14 == 0 and p15 == _length then
        return p13
    end

    return (new(p13._lineIndex, p13._columnIndex + p14, p13._inputIndex + p14, p15 - p14))
end

function t1.equals(p16, p17) -- line: 102
    if p16 == p17 then
        return true
    end

    if p17 == nil then
        return false
    end

    if p16._lineIndex == p17._lineIndex and p16._columnIndex == p17._columnIndex and p16._inputIndex == p17._inputIndex then
        return p16._length == p17._length
    end

    return false
end

function t1.toString(p18) -- line: 116
    return (("SourceSpan{line=%*, column=%*, input=%*, length=%*}"):format(p18._lineIndex, p18._columnIndex, p18._inputIndex, p18._length))
end

return t1
