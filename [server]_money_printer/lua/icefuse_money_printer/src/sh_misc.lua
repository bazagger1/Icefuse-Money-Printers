--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/icefuse_money_printer/src/sh_misc.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local Addon = IcefuseMoneyPrinter

--------------------------------------------------

--[[
- @param string className
- @param table options
]]
function IcefuseMoneyPrinter.definePrinter(className, options)

    local class = scripted_ents.Get(options.class)

    -- Make sure base class exists
    if class == nil then
        error(string.format("Class '%s' does not exist!", options.class))
    end

    -- Make sure base class derives from 'icefuse_printer_base'
    if not scripted_ents.IsBasedOn(options.class, 'icefuse_printer_base') then
        error(string.format("Class '%s' must be based on the printer base class 'icefuse_printer_base'.", options.class))
    end

    local classOptions = table.Merge(table.Copy(class:getDefaultOptions()), options)

    -- Register the new entity
    local ENT = {

        Base = classOptions.class,
        PrintName = classOptions.name,
        Spawnable = true,
        AdminSpawnable = true,
        Category = "Icefuse Printers",

        _options = classOptions

    }
    scripted_ents.Register(ENT, className)

    -- Fancy message
    MsgC(Color(180, 180, 180), "[Icefuse Printers] ", Color(255, 255, 255), "Successfully defined printer: ", Color(255, 255, 0), className, "\n")

    --
    -- Add the printer to DarkRP

    if not DarkRP then
        return
    end

    -- DarkRP.createEntity(classOptions.name, {
		-- ent = className,
		-- model = classOptions.model,
		-- price = classOptions.darkRP_buyPrice,
		-- max = classOptions.darkRP_max,
		-- cmd = classOptions.darkRP_buyCommand or ('buy_' .. className),
        -- allowed = classOptions.drarkRP_allowed,
		-- customCheck = function(ply)
		-- 	-- TODO
		-- end
	-- })

end
