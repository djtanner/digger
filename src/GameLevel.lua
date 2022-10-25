GameLevel = Class{}

function GameLevel:init(tiles)
   -- self.entities = entities
   -- self.objects = objects
    self.tiles = tiles
end


function GameLevel:update(dt)
    self.tiles:update(dt)

end


function GameLevel:render()
    for y = 1, #self.tiles do

        for x = 1, #self.tiles[1] do
            self.tiles[y][x]:render(self.x, self.y, self.color)
        end

    end


end