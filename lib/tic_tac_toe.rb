class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8],  # Right column
        [0,4,8],  # Forward diagonal
        [2,4,6]   # Reverse diagonal
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token = "X")
        board[index] = token
    end

    def position_taken?(index)
        board[index].include?("X") || board[index].include?("O") ? true : false
    end

    def valid_move?(index)
        if position_taken?(index) == true then false
        elsif index < 10 && index >= 0 then true 
        else false
        end
    end

    def turn_count
        board.filter{|input| input != " "}.size
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Space number? (1-9):"
       
        input = gets.strip
        index = input_to_index(input)

        if valid_move?(index) then
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end

    def won?
        win_combo = WIN_COMBINATIONS.find do |combo|
            space_1 = board[combo[0]]
            space_2 = board[combo[1]]
            space_3 = board[combo[2]]
            
            space_1.include?(space_2) && space_2.include?(space_3) &&  space_1 != " "
        end
  
        if win_combo != nil then win_combo
        else false
        end
    end

    def full?
        !board.include?(" ") ? true : false
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        won? || draw? ? true : false
    end

    def winner
        if won? == false then nil
        else board[won?[0]].include?("X") ? "X" : "O"
        end
    end

    def play
        until over?
            turn
        end 

        if won?
            winner == "X" || winner == "O" 
            puts "Congratulations #{winner}!" 
        else puts "Cat's Game!" 
        end 
    end
end

game = TicTacToe.new

game.play