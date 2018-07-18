#=======================BOARD=========================
#Rôle de cette classe : mettre en place la structure du terrain de jeu

class Board < Array
  attr_accessor :board

  def initialize(board=[])
  #Methode pour construire le terrain de jeu
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
  #Methode pour construire l'affichage du terrain de jeu avec des arrays "boards"qui relient à la commande (cf plus bas)
    puts "|------------------|"
    puts "|  #{@board[0]}   |  #{@board[1]}  |  #{@board[2]} "
    puts "|------------------|"
    puts "|  #{@board[3]}   |  #{@board[4]}  |  #{@board[5]} "
    puts "|------------------|"
    puts "|  #{@board[6]}   |  #{@board[7]}  |  #{@board[8]} "
    puts "|------------------|"
  end

  def play(array)
  #Methode pour définir les conditions de réception le terrain de jeu par rapport aux choix des joueurs
    if @board[array[2]] == " "
      if array[1] == "X"
        @board[array[2]] << "X"
      else
        @board[array[2]] << "O"
      end
    else
      puts "Case déjà prise frère ! Dsl ton tour est sauté du coup !"
    end
  end

  def victory? #méthode booléenne
  #Methode qui vérifie les combinaisons possibles de victoire
    case
      #premier combinaison : ligne 1-2-3
      when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " " && @board[1] != " " && @board[2] != " "
        return  true
      #deuxième combinaison : ligne 4-5-6
      when @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != " "
        return  true
      #troisième combinaison : ligne 7-8-9
      when @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != " "
        return  true
      #quatrième combinaison : colonne 1-4-5
      when @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != " "
        return  true
      #cinquième combinaison : colonne 2-5-8
      when @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " "
        return  true
      #sixième combinaison : colonne 3-6-9
      when @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " "
        return  true
      #septième combinaison : diagonale 1-5-9
      when @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != " "
        return  true
      #huitième combinaison : diagonale 3-5-7
      when @board[6] == @board[4] && @board[4] == @board[2] && @board[6] != " "
        return  true
      else
        false
    end
  end
end

#=======================PLAYERS=========================
#Rôle de cette classe : définir les deux joueurs et leurs symboles respectifs

class Player
  attr_accessor :name, :icon
  attr_writer   :victory
  #A aller chercher dans la def Victory de la class Board

  def initialize(name="name", icon="X", victory=0)
  #Petite initialisation des familles pour définir les variables générales
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

#=======================GAME=========================
#Rôle de cette classe : execution du programme avec validation de la création des joueurs, leurs attributions d'icone, leurs moves respectifs, le cycle de jeu et la définition de leur victoire

class Game
  attr_accessor :player1, :player2, :board
  def initialize(player1="player1", player2="player2", board=[])
  #Methode pour définir les deux joueurs et leurs icones
    puts        "Nom du Joueur 1 :"
    player1 =   gets.chomp
    puts        "Vous préférez les X ou les O ?"
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
      #création d'un tableau qui couvre les deux joueurs

      @objet_tableau =    Board.new
  end

  def go
  #méthode pour lancer le game
    self.turn
  end

  def turn
  #méthode pour receptionner les choix respectifs des joueurs
      turns = 0
    while @objet_tableau.victory? == false
      @players.each do |player|
        @objet_tableau.display_board
        puts "#{player.name} à ton tour de jouer!"
        puts "Choisis la case à cocher frère (1-9) :"
        cell = gets.chomp.to_i - 1

        @player_info = [player.name,player.icon,cell]
        #tableau qui relie les joueurs, leurs symboles et les cases

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
