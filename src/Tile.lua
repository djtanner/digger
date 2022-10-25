Tile = Class{}

function Tile:init(x, y, color)
    
    self.width = TILE_SIZE

    -- coordinate positions
    self.x = x
    self.y = y

    -- tile appearance/points
    self.color = color

end

function Tile:render()
    
 
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['grass'], gFrames['tiles'][self.color],
    (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)

end