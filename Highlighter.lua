local load = {}
local HttpService = game:GetService("HttpService")

function load:checkClass(instance)
    local Classes = {"Part", "MeshPart", "CornerWedgePart", "WedgePart", "TrussPart", "Model", "SpawnLocation"}
    for i,v in pairs(Classes) do
        if (instance.ClassName == v) then
            return true
        end
    end
    return false
end

function load:create(instance, fill, fillTransparency, out, vis)
    if (not instance or not fill or not fillTransparency or not out or not vis) then error(string.format("[Highlighter]: An attempt to highlight '%s' was made but an argument was missing. (instance, fill color, fill transparency, outline color, visible")) return end
    if (self:checkClass(instance) and not instance:FindFirstChildOfClass('Highlight')) then
        local Highlighter = Instance.new('Highlight', instance)
        Highlighter.Name = HttpService:GenerateGUID(false)
        Highlighter.Adornee = instance
        if (vis) then Highlighter.DepthMode = "AlwaysOnTop" else Highlighter.DepthMode = "Occluded" end
        Highlighter.FillColor = fill
        Highlighter.FillTransparency = fillTransparency
        Highlighter.OutlineColor = out
    end
end

function load:edit(instance, fill, fillTransparency, out, vis)
    if (not instance or not fill or not fillTransparency or not out or not vis) then error(string.format("[Highlighter]: An attempt to highlight '%s' was made but an argument was missing. (instance, fill color, fill transparency, outline color, visible")) return end
    if (self:checkClass(instance)) then
        for i,v in pairs(instance) do
            if (v:IsA('Highlight')) then
                local Highlighter = v
                if (vis) then Highlighter.DepthMode = "AlwaysOnTop" else Highlighter.DepthMode = "Occluded" end
                Highlighter.FillColor = fill
                Highlighter.FillTransparency = fillTransparency
                Highlighter.OutlineColor = out
            end
        end
    end
end

function load:remove(instance)
    if (not instance) then error(string.format("[Highlighter]: An attempt to highlight '%s' was made but an argument was missing. (instance")) return end
    if (self:checkClass(instance)) then
        for i,v in pairs(instance) do
            if (v:IsA('Highlight')) then
                v:Destroy()
            end
        end
    end
end

return load
