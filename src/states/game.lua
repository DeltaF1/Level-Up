local game = {}

Character = Class{}

function Character:init(pos)

end

function game:init()
	love.graphics.setDefaultFilter("nearest", "nearest")
	default_icon = love.graphics.newImage("img/default_icon.png")
end

function game:draw()
	love.graphics.setColor(0, 50, 200)
	love.graphics.print("TEST", 50, 50)
	
	love.graphics.setColor(255,255,255)
	
	for i = 1,4 do
		love.graphics.draw(default_icon, 100 + (i* 45), 300)
	end
end

return game
