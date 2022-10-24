Tile = Class{}

function Tile:init(x, y, color)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color

end

function Tile:render(x, y)
    
 
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['grass'], gFrames['tiles'][self.color],
        self.x + x, self.y + y)

end