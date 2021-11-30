#Class Grid allows to create the algorithm
class Grid
  #Initialize the grid.
    def initialize
        @fil = 5
        @col = 5    
        @grid = initLife()
        @grid2 = initGrid()
        #@grid2 accomodates the initializer of the Grid 
      end

    def colocacion()
      puts "Cuantas filas deseas?:"
      @fil = gets.to_i
      puts "Cuantas columnas deseas?:"
      @col = gets.to_i
      @grid = initLife()
      @grid2 = initGrid()
    end
  
    def dibujar()
      (0..@fil - 1).each do |i|
        (0..@col - 1).each do |j|
          if @grid[i][j] == 1
            print('*')
          else
            print('.')
          end
        end
        print "\n"
      end
    end
  
    def generacion()
        
      grid2 = @grid2
      grid = @grid

      (1..@fil - 2).each do |i|
        (1..@col - 2).each do |j|
          celulas_vivas = 0
          (-1..1).each do |a|
            (-1..1).each do |b|
              celulas_vivas += grid[i - a][j - b]
            end
          end
          celulas_vivas -= grid[i][j]
          grid2[i][j] = if grid[i][j] == 1 && celulas_vivas < 2
                          0
                        elsif grid[i][j] == 1 && celulas_vivas > 3
                          0
                        elsif grid[i][j].zero? && celulas_vivas == 3
                          1
                        else
                          grid[i][j]
                        end
        end
      end
    end
  
    def initLife
      puts "si llego 1"
      table = []
      (0...@fil).each do |_i|
        row = []
        (0...@col).each do |j|
          row[j] = rand(2)
        end
        table.push(row)
      end
      table
    end
  
    def initGrid
      puts "si llego 2"
      table = []
      (0...@fil).each do |_i|
        row = []
        (0...@col).each do |j|
          row[j] = 0
        end
        table.push(row)
      end
      table
    end
  
    # def initialize(raza, nombre)
    #   # atributos
    #   @raza = raza
    #   @nombre = nombre
    # end
  end
  
  # aqui pedimos los datos al usuario y creamos los grid dependiendo como lo pida el usuario
  
  print "\n"
  print 'Generación inicial'
  print "\n"
  nueva_generacion = Grid.new
   
  nueva_generacion.colocacion() # se setean variantes (numero de filas y numero de columnas)
  nueva_generacion.dibujar() # se dibuja la primer generacion
  nueva_generacion.generacion() # se hace la verificacion de las celulas vivas y muertas
  print "\n"
  print 'Siguiente generación'
  print "\n"
  nueva_generacion.dibujar() # se dibuja la segunda generacion