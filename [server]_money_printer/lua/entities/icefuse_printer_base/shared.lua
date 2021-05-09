--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/entities/icefuse_printer_base/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Printer - Base"
ENT.Author = "Icefuse Networks & Ikefi"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.RenderGroup = RENDERGROUP_BOTH

ENT.icefusePrinter = true

--[[
-
]]
function ENT:SetupDataTables()

	self:NetworkVar('Int', 0, 'Money')
	self:NetworkVar('Int', 1, 'Ink')
	self:NetworkVar('Float', 0, 'Temperature')

end

--[[
- @param string key
- @param any default
-
- @return any
]]
function ENT:getOption(key, default)

    if self._options[key] == nil then
        return default
    end

    return self._options[key]
end

--[[
- @static
]]
function ENT:getDefaultOptions()
    return {

		class = self.ClassName,
		name = "UNNAMED",

        model = 'error.mdl',
		modelColor = false, -- True to inherit color, false for no color, color for custom color
        color = Color(255, 255, 255),
        sound = 'ambient/levels/labs/equipment_printer_loop1.wav',

		health = 100,

		moneyCapacity = 5000,
		moneyRate = 100,

		inkCapacity = 500,
		inkCost = 1, -- Ink cost per unit

		heatRate = .5, -- The rate health builds up in temperature/second
		coolingCost = 100,

		fireOnExplodeChance = .5, -- 0 = 0%, 1 = 100%

		darkRP_buyPrice = 1000,
		darkRP_max = 0, -- Max amount of entities you may buy (0 = infinite)
		darkRP_buyCommand = nil,
		drarkRP_allowed = nil

    }
end
