PlayState = Class{__includes = BaseState}

function PlayState:init()
   self.x = 1
   self.y = 1



    self.tiles = {}

    for tileY = 1, 40 do
        
        -- empty table that will serve as a new row
        table.insert(self.tiles, {})

        for tileX = 1, 40 do
           
                table.insert(self.tiles[tileY], Tile(tileX, tileY, 2))
                
         
            
        end
    end

    
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    
end


function PlayState:render()
    love.graphics.setColor(175/255, 53/255, 42/255, 1)
    love.graphics.printf('Digger', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')
    
    for y = 1, #self.tiles do

        for x = 1, #self.tiles[1] do
            self.tiles[y][x]:render(self.x, self.y, 2)
        end

    end



end
