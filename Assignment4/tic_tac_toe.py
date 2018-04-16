class tic_tac_toe:
    def __init__(self):
        self.board = ["_"]*9
        
    def is_valid(self, place):
        return self.board[place] == "_"
    
    def print_borad(self):
        for i in range(3):
            print(" | ".join(x for x in self.board[3*i:3*(i+1)]))

    def is_finished(self):
        for i in range(3):
            if self.board[3*i] == self.board[3*i+1] == self.board[3*i+2] != '_':
                print(self.board[3*i]+" wins :)")
                return True
        for j in range(3):
            if self.board[j] == self.board[3+j] == self.board[6+j] != '_':
                print(self.board[j]+" wins :)")
                return True
        if self.board[0] == self.board[4] == self.board[8] != '_':
            print(self.board[0]+" wins :)")
            return True
        if self.board[2] == self.board[4] == self.board[6] != '_':
            print(self.board[2]+" wins :)")
            return True
        for i in range(9):
            if self.board[i] == '_':
                return False
        print("Draw :{")
        return True
    
ttt = tic_tac_toe()
from random_ai import random_ai
from minimax_ai import minimax_ai
player1 = minimax_ai()
player2 = random_ai()
isplayer1 = True
while not ttt.is_finished():
    if isplayer1:
        move = player1.get_next_move(ttt.board[:], 'x')
        print("minimax best move "+str(move))            
        if ttt.is_valid(move):
            ttt.board[move] = 'x'
            ttt.print_borad()
            isplayer1 = not isplayer1
        else:   print("invalid move -_-")   
    else:
        move = player2.get_next_move(ttt.board[:])
        print("random best move "+str(move))           
        if ttt.is_valid(move):
            ttt.board[move] = 'o'
            ttt.print_borad()
            isplayer1 = not isplayer1
        else:   print("invalid move -_-")
            
        
'''    place, char = input().split()
    place = int(place)
    if ttt.is_valid(place):
        print("invalid move -_-")
        ttt.board[place] = char
    ttt.print_borad()'''