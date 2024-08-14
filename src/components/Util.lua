---
--- @author Dylan MALANDAIN, Kalyptus
--- @editor Florian-1801
--- @version 1.0.0
--- created at [24/05/2021 10:02]
---
function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end