
--Move to separate file for ability definitions/constructors
Ability = Class{}

noop = function() end

Ability.do_self = noop
Ability.do_other = noop

function Ability:init(level)
	self.level = level
end

function Ability:activate(character, target)
	self:do_self(character)
	self:do_other(character, target)
end

function do_other_melee(range, mindmg, maxdmg)
	return function(self, character, target)
		-- For every enemy
		-- If (enemy.pos - self.pos):len() <= range and sign((enemy.pos - self.pos).x) == sign(self.facing) then
			dmg = (love.math.random() * (maxdmg - mindmg)) + mindmg
		-- enemy:damage(dmg, self.element)
		-- play sweep animation, scaled by range
	end 
end

function do_self_heal(mindmg, maxdmg)
	return function(self, character)
		dmg = (love.math.random() * (maxdmg - mindmg)) + mindmg
		character:damage(-dmg)
		--Play red sparkle particle system
	end
end

heal_light_wounds = Ability(1)

heal_light_wounds.do_self = do_self_heal(2,2)

slash = Ability(1)

slash.do_other = do_other_melee(10, 10, 15)


massive_strike = Ability(2)

massive_strike.do_self = function(self, character)
	--oldspeed = character.speed
	--set timer (function() character.speed = oldpseed end)
	character.speed = 0.1
end

massive_strike.do_other = do_other_melee(10, 30, 50)