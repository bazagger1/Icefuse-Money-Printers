--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/icefuse_money_printer/config/sh_printers.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

//===============================================================================================\\
// This configuration file is for APB only! The Values have been increased 10x the normal rate!
//===============================================================================================\\


-- All possible values that can be set:
local example = {

	class = 'icefuse_printer_small',
	name = "Printer",

	model = 'error.mdl',
	modelColor = false, -- True to inherit color, false for no color, color for custom color
	color = Color(255, 255, 255),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',

	health = 100,

	moneyCapacity = 5000,
	moneyRate = 100,

	inkCapacity = 500,
	inkCost = 0.10, -- Ink cost per unit

	heatRate = .5, -- The rate health builds up in temperature/second
	coolingCost = 100,
	
	fireOnExplodeChance = .5, -- 0 = 0%, 1 = 100%
	
-- 	darkRP_buyPrice = 1000,
-- 	darkRP_max = 0, -- Max amount of entities you may buy (0 = infinite)
-- 	darkRP_buyCommand = nil,
-- 	darkRP_allowed = nil

}

IcefuseMoneyPrinter.config.printers = {

-----------------------------------------------------------------------------------------------------
--                                       Small Printers
-----------------------------------------------------------------------------------------------------
  ['copper'] = {

    class = 'icefuse_printer_small',

    name = "Copper Printer",
    health = 100,
    color = Color(184, 115, 51),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_small.mdl',
	modelColor = false,

    moneyCapacity = 50000,
	moneyRate = 2000,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['bronze'] = {

    class = 'icefuse_printer_small',

    name = "Bronze Printer",
    health = 125,
    color = Color(201, 174, 93),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_small.mdl',
	modelColor = false,

    moneyCapacity = 85000,
	moneyRate = 2500,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['silver'] = {

    class = 'icefuse_printer_small',

    name = "Silver Printer",
    health = 140,
    color = Color(192, 192, 192),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_small.mdl',
	modelColor = false,

    moneyCapacity = 95000,
	moneyRate = 3000,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['gold'] = {

    class = 'icefuse_printer_small',

    name = "Gold Printer",
    health = 150,
    color = Color(212, 175, 55),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_small_gold.mdl',
	modelColor = false,

    moneyCapacity = 100000,
	moneyRate = 3500,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
-----------------------------------------------------------------------------------------------------
--                                       Large Printers
-----------------------------------------------------------------------------------------------------
    ['ruby'] = {

    class = 'icefuse_printer_big',

    name = "Ruby Printer",
    health = 200,
    color = Color(155, 17, 30),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_big.mdl',
	modelColor = false,

    moneyCapacity = 150000,
	moneyRate = 4000,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['sapphire'] = {

    class = 'icefuse_printer_big',

    name = "Sapphire Printer",
    health = 225,
    color = Color(15, 82, 186),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_big.mdl',
	modelColor = false,

    moneyCapacity = 165000,
	moneyRate = 4500,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['emerald'] = {

    class = 'icefuse_printer_big',

    name = "Emerald Printer",
    health = 240,
    color = Color(80, 200, 120),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_big.mdl',
	modelColor = false,

    moneyCapacity = 195000,
	moneyRate = 5000,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },
------------------------------------------------------------------------------------------------------
    ['legendary'] = {

    class = 'icefuse_printer_big',

    name = "Legendary Printer",
    health = 250,
    color = Color(255, 128, 0),
	sound = 'ambient/levels/labs/equipment_printer_loop1.wav',
    model = 'models/icefuse_money_printer/money_printer_big_gold.mdl',
	modelColor = false,

    moneyCapacity = 200000,
	moneyRate = 6000,
	inkCapacity = 18000,
	inkCost = 0.10,

	heatRate = 0.08,
	coolingCost = 150,
    },

}
