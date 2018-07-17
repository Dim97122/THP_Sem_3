require 'pry'


class Board < Array
  attr_accessor :board

  def initialize(board=[])
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts "|------------------|"
    puts "|  #{@board[0]}   |  #{@board[1]}  |  #{@board[2]} "
    puts "|------------------|"
    puts "|  #{@board[3]}   |  #{@board[4]}  |  #{@board[5]} "
    puts "|------------------|"
    puts "|  #{@board[6]}   |  #{@board[7]}  |  #{@board[8]} "
    puts "|------------------|"
  end

def play(array)
    if @board[array[2]] == " "
      if array[1] == "X"
        @board[array[2]] << "X"
      else
        @board[array[2]] << "O"
      end
    else
      puts "Dommage ! ton tour est sauté !"
    end
end

  def victory?
    case
      when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " " && @board[1] != " " && @board[2] != " "
        return  true
      when @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != " "
        return  true
      when @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != " "
        return  true
      when @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != " "
        return  true
      when @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " "
        return  true
      when @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " "
        return  true
      when @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != " "
        return  true
      when @board[6] == @board[4] && @board[4] == @board[2] && @board[6] != " "
        return  true
      else
        false
    end
  end
end

#=======================PLAYERS=========================

class Player
  attr_accessor :name, :icon
  attr_writer   :victory

  def initialize(name="name", icon="X", victory=0)
    @name = name.capitalize
    @icon = icon
    puts "#{@name}, vous avez sélectionné les #{@icon}!  Bonne chance!"
  end

  def get_name
    return @name
  end

  def get_icon
    return @icon
  end

end

#=======================GAME========================= (validé création Joueurs)

class Game
  attr_accessor :player1, :player2, :board
  def initialize(player1="player1", player2="player2", board=[])
    puts        "Nom du Joueur 1 :"
    player1 =   gets.chomp
    puts        "Vous préférez les -X- ou les -O- ?"
    icon1 =     gets.chomp
    @player1 =  Player.new(player1, icon1)

    puts        "Nom du Joueur 2 :"
    player2 =   gets.chomp
      if      icon1 == "X"
        @player2 =  Player.new(player2, icon2="O")
      elsif   icon1 == "O"
        @player2 =  Player.new(player2, icon2="X")
      else
        puts  "Nigga I don't know!!!!"
      end

      @players = [@player1, @player2]
      @objet_tableau =    Board.new
  end

  def go
    self.turn
  end

  def turn
      turns = 0
    while @objet_tableau.victory? == false
      @players.each do |player|
        @objet_tableau.display_board
        puts "#{player.name} à votre tour de jouer!"
        puts "Choisissez la case à cocher (1-9) :"
        cell = gets.chomp.to_i - 1

        @player_info = [player.name,player.icon,cell]

        @objet_tableau.play(@player_info)

        if @objet_tableau.victory?
            puts  "=========================="
            puts  "Obviously you won biche!!!"
            puts  "=========================="
        end
      end

      turns +=1

    end
  end
end


Game.new.go
