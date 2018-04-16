from random import shuffle
class not_so_random_ai:
    def get_random_next_move(self, board):
        valid_moves = [i for i in range(9) if board[i] == '_']
        shuffle(valid_moves)
        return valid_moves[0]

    def get_next_move(self, board, player):
        e = self.any_wining_pos()