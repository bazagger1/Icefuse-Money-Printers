--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_money_printer/lua/entities/icefuse_printer_small/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include('shared.lua')

--------------------------------------------------

surface.CreateFont('icefuse_printer_normal', {
	font = 'Arial',
	size = 26,
	weight = 600,
	antialias = true
})

surface.CreateFont('icefuse_printer_small', {
	font = 'Roboto',
	size = 18,
	weight = 500,
	antialias = true
})

surface.CreateFont('icefuse_printer_small_bold', {
	font = 'Roboto',
	size = 18,
	weight = 600,
	antialias = true
})

--------------------------------------------------

--[[
- @param table cursor
- @param number x
- @param number y
- @param number w
- @param number h
]]
local function isCursorWithinRect(cursor, x, y, w, h)
	return cursor.x >= x and cursor.x <= x + w and cursor.y >= y and cursor.y <= y + h
end

--------------------------------------------------

--[[
-
]]
function ENT:Draw()
	self:DrawModel()
end

--[[
-
]]
function ENT:DrawTranslucent()

	-- Start with no hovered action
	self._hoveredAction = nil

	local client = LocalPlayer()
	local distance = self:GetPos():DistToSqr(client:GetShootPos())

	if distance > 1000 ^ 2 then
		return
	end

	local lpos = Vector(14.1, -14.5, 20.1)
	local lang = Angle(0, 180, 33.3)
	local scale = .10

	local pos = self:LocalToWorld(lpos)
	local ang = self:LocalToWorldAngles(lang)

	-- Calculate cursor pos
	local cursor = { x = 0, y = 0, z = 0 }
	do
		local isec = util.IntersectRayWithPlane(client:GetShootPos(), client:GetAimVector(), pos, ang:Up())
		if isec then
			local hit = self:WorldToLocal(isec) - lpos

			-- For currently an unknown reason I have to rotate it..?
			hit:Rotate(lang)
			hit:Rotate(Angle(-180, 0, 0))

			cursor = {
				x = - hit.x * (1/ scale),
				y = - hit.y * (1/ scale),
				z = - hit.z * (1/ scale)
			}

		end
	end

	cam.Start3D2D(pos, ang, scale)

		local w, h = 282.5, 252.5
		local paddingX, paddingY = 7, 7

		render.ClearStencil()
		render.SetStencilEnable(true)

		render.SetStencilReferenceValue(1)

		-- Put the pixels that only should be drawn on our stencil
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER) -- Never pass, so that the upcoming drawings are not actually drawn
		render.SetStencilFailOperation(STENCILOPERATION_REPLACE) -- Replace value of each upcoming pixel drawn by 1 (reference value)

			surface.SetDrawColor(255, 255, 255)
			surface.DrawRect(0, 0, w, h)

		-- Draw only the pixels that have its pixel value on 1
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_KEEP) -- Do not change the pixel value anymore
		render.SetStencilPassOperation(STENCILOPERATION_KEEP) -- Do not change the pixel value anymore

		repeat

			-- Background
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)

			if distance > 400 ^ 2 then
				break
			end

			local name = "unknown"

			local owner = self:CPPIGetOwner()
			if IsValid(owner) then
				name = owner:Nick()
			end

			-- Owner name
			do
				local x, y = paddingX, paddingY
				local w, h = w - paddingX * 2, 35

				surface.SetDrawColor(55, 55, 55, 255)
				surface.DrawRect(x, y, w, h)

				draw.SimpleText(name, 'icefuse_printer_normal',
					x + w * .5, y + h * .5,
					Color(220, 220, 220),
					TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			end

			-- Printer name
			do
				local x, y = paddingX, paddingY + 35 + 5
				local w, h = w - paddingX * 2, 35

				surface.SetDrawColor(55, 55, 55, 255)
				surface.DrawRect(x, y, w, h)

				draw.SimpleText(self:getOption('name', ""), 'icefuse_printer_normal',
					x + w * .5, y + h * .5,
					self:getOption('color', Color(255, 255, 255)),
					TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			end

			-- Money
			do
				local x, y = paddingX, paddingY + 95
				local w, h = w - paddingX * 2, 25

				local money = self:GetMoney()
				local moneyCapacity = self:getOption('moneyCapacity', 0)

				draw.SimpleText("Money:", 'icefuse_printer_small_bold',
					x + 5, y + h * .5,
					Color(255, 255, 255),
					TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				draw.SimpleText("$" .. string.Comma(money) .. " / $" .. string.Comma(moneyCapacity), 'icefuse_printer_small',
					x + w - 5, y + h * .5,
					Color(255, 255, 255),
					TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

			end

			-- Temperature
			do
				local x, y = paddingX, paddingY + 125
				local w, h = w - paddingX * 2, 25

				if isCursorWithinRect(cursor, x, y, w, h) then
					self._hoveredAction = 'cool'

					local coolingCost = self:getOption('coolingCost', 0)

					surface.SetDrawColor(70, 70, 70, 255)
					surface.DrawRect(x, y, w, h)

					draw.SimpleText("Cool printer ($" .. string.Comma(coolingCost) .. ")", 'icefuse_printer_small_bold',
						x + w * .5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				else

					local temp = math.ceil(self:GetTemperature())
					local dangerAmount = math.Clamp((math.Clamp(temp, 80, math.huge) - 80) / (150 - 80), 0, 1)

					if dangerAmount > 0 then

						if dangerAmount > .1 then
							-- Warning sound
							if SysTime() - (self._lastTempWarningSound or 0) >= (1 / dangerAmount) * .25 then
								self._lastTempWarningSound = SysTime()
								self:EmitSound('npc/turret_floor/ping.wav', 60, 100, dangerAmount)
							end
						end

						surface.SetDrawColor(255, 0, 0, math.abs(math.sin(CurTime() * 3) * 255) * dangerAmount)
						surface.DrawRect(x, y, w, h)

					end

					draw.SimpleText("Temperature:", 'icefuse_printer_small_bold',
						x + 5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					draw.SimpleText(temp .. " °C " .. math.Round(temp * 9 / 5 + 32) .. " °F", 'icefuse_printer_small',
						x + w - 5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

				end

			end

			-- Ink
			do
				local x, y = paddingX, paddingY + 155
				local w, h = w - paddingX * 2, 25

				if isCursorWithinRect(cursor, x, y, w, h) then
					self._hoveredAction = 'buy_ink'

					local inkCapacity = self:getOption('inkCapacity', 0)
					local inkCost = math.ceil((inkCapacity - self:GetInk()) * self:getOption('inkCost', 0))

					surface.SetDrawColor(70, 70, 70, 255)
					surface.DrawRect(x, y, w, h)

					draw.SimpleText("Buy more ink ($" .. string.Comma(inkCost) .. ")", 'icefuse_printer_small_bold',
						x + w * .5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				else

					local amount = math.ceil((100 / self:getOption('inkCapacity', 0)) * self:GetInk())

					draw.SimpleText("Ink:", 'icefuse_printer_small_bold',
						x + 5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					draw.SimpleText(amount .. "%", 'icefuse_printer_small',
						x + w - 5, y + h * .5,
						Color(255, 255, 255),
						TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

				end

			end

			-- Take money
			do
				local x, y = paddingX, paddingY + h - 35 - paddingY * 2
				local w, h = w - paddingX * 2, 35

				if isCursorWithinRect(cursor, x, y, w, h) then
					self._hoveredAction = 'withdraw_money'

					surface.SetDrawColor(70, 70, 70, 255)
					surface.DrawRect(x, y, w, h)

				end

				draw.SimpleText("Take money", 'icefuse_printer_normal',
					x + w * .5, y + h * .5,
					Color(255, 255, 255),
					TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			end

		until true

		render.SetStencilEnable(false)

	cam.End3D2D()

end
