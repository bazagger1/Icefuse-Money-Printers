--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/entities/icefuse_printer_base/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include('shared.lua')

--------------------------------------------------

--[[
-
]]
function ENT:triggerHoveredAction()

    if self._hoveredAction == nil then
        return
    end

    net.Start('icefuse_printer.action')
        net.WriteEntity(self)
        net.WriteString(self._hoveredAction)
    net.SendToServer()

end

--[[
-
]]
hook.Add('KeyPress', 'icefuse_printer', function(ply, key)

    if not IsFirstTimePredicted() then
        return
    end

    if key ~= IN_USE then
        return
    end

    local trace = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = ply:GetShootPos() + ply:GetAimVector() * 70,
        filter = ply
    })

    local entity = trace.Entity
    if not IsValid(entity) or entity.icefusePrinter == nil then
        return
    end

    entity:triggerHoveredAction()

end)

--------------------------------------------------

--[[
-
]]
function ENT:Initialize()

    self._options = self._options or self:getDefaultOptions()

end

-- --[[
-- - Not in use...
-- ]]
-- function ENT:drawBattery(x, y, w, h, scale, cursor)
--
-- 	self:SetPower(50)
--
-- 	local p = .3 / scale
-- 	local indent = math.floor(.75 / scale)
-- 	local third = math.floor(h / 3)
--
-- 	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
-- 	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
--
-- 		surface.DrawRect(x + w - indent, y, indent, third)
-- 		surface.DrawRect(x + w - indent, y + h - third, indent, third)
--
-- 	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
-- 	render.SetStencilFailOperation(STENCILOPERATION_KEEP)
--
-- 		surface.SetDrawColor(220, 220, 220, 255)
-- 		surface.DrawRect(x, y, w, h)
--
-- 		surface.SetDrawColor(0, 200, 0, 255)
-- 		surface.DrawRect(x, y, w * (.01 * self:GetPower()), h)
--
-- 		if isCursorWithinRect(cursor, x, y, w, h) then
--
-- 			surface.SetDrawColor(255, 255, 255, 50)
-- 			surface.DrawRect(x, y, w, h)
--
-- 			draw.SimpleText("Recharge", 'icefuse_printer_battery',
-- 				x + w * .5, y + h * .5,
-- 				Color(40, 40, 40),
-- 				TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
--
-- 		else
--
-- 			draw.SimpleText(math.ceil(self:GetPower()) .. "%", 'icefuse_printer_battery',
-- 				x + w * .5, y + h * .5,
-- 				Color(40, 40, 40),
-- 				TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
--
-- 		end
--
-- end
