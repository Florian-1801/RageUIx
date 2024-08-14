---
--- @author Dylan MALANDAIN, Kalyptus
--- @editor Florian-1801
--- @version 1.0.0
--- created at [24/05/2021 10:02]
---

Keys = {};

---Register
---@param Controls string
---@param ControlName string
---@param Description string
---@param Action function
---@return Keys
---@public
function Keys.Register(Controls, ControlName, Description, Action)
    RegisterKeyMapping(string.format('keys-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('keys-%s', ControlName), function()
        if (Action ~= nil) then
            Action();
        end
    end, false)
end