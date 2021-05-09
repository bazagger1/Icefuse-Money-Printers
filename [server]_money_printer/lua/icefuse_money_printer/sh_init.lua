--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/icefuse_money_printer/sh_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

IcefuseMoneyPrinter = IcefuseMoneyPrinter or {
    version = '0.2.1',
    config = {
        printers = {}
    }
}

AddCSLuaFile 'src/sh_misc.lua'
include 'src/sh_misc.lua'

AddCSLuaFile 'config/sh_printers.lua'
include 'config/sh_printers.lua'

hook.Add('PostGamemodeLoaded', 'icefuse_printers', function()

    -- Define the configured printers
    for className, options in pairs(IcefuseMoneyPrinter.config.printers) do
        IcefuseMoneyPrinter.definePrinter('icefuse_printer_' .. className, options)
    end

end)
