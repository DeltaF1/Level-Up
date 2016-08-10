Gamestate = require "hump.gamestate"
Class = require "hump.class"

function love.load()
	print("test")
	states = {}

	for _, name in ipairs(love.filesystem.getDirectoryItems("states")) do
		print(name)
		_, _, name = name:find("(.*)%..*")
		print(name)
		states[name] = require("states."..name)
	end

	Gamestate.registerEvents()
	Gamestate.switch(states.game) --Replace with states.intro
end
