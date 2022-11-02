GameLevel = Class{}

function GameLevel:init(tiles, objects)
   
    self.objects = objects
    self.tiles = tiles
    
end


function GameLevel:update(dt)
    
    
    for k, object in pairs(self.objects) do
        object:update(dt)
        
    end 

end


function GameLevel:pointToTile(x, y)
    
    if x < 0 or x > 24 * TILE_SIZE or y < 0 or y > 14 * TILE_SIZE then
        return nil
    end
    
    return self.tiles[math.floor(y / TILE_SIZE) + 1][math.floor(x / TILE_SIZE) + 1]
end


function GameLevel:render()
    for y = 1, #self.tiles do

        for x = 1, #self.tiles do
            self.tiles[y][x]:render(self.x, self.y, self.color)
        end

    end

    --render gameobjects
    for k, object in pairs(self.objects) do
        object:render()
        
    end


end