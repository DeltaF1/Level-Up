Gamestate = require "hump.gamestate"
Class = require "hump.class"
vector = require "hump.vector"
require "abilities"

function love.load()
	print("test")
	states = {}

	for _, name in ipairs(love.filesystem.getDirectoryItems("states")) do
		print(name)
		_, _, name = name:find("([^%.]*)%..*$")
		print(name)
		if name then
			states[name] = require("states."..name)
		end
	end

	Gamestate.registerEvents()
	Gamestate.switch(states.game) --Replace with states.intro
end
