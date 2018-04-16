from random import shuffle
class random_ai:
    def get_next_move(self, board):
        valid_moves = [i for i in range(9) if board[i] == '_']
        shuffle(valid_moves)
        return valid_moves[0]