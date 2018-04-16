#'o' for Minplayer and 'x' for Maxplayer
class minimax_ai:
    def eval_board(self, board):
        for i in range(3):
            if board[3*i] == board[3*i+1] == board[3*i+2] != '_':
                if board[3*i] == 'x':   return 1
                return -1
        for j in range(3):
            if board[j] == board[3+j] == board[6+j] != '_':
                if board[j] == 'x': return 1
                return -1
        if board[0] == board[4] == board[8] != '_':
            if board[0] == 'x':    return 1
            return -1
        if board[2] == board[4] == board[6] != '_':
            if board[2] == 'x':    return 1
            return -1
        for i in range(9):
            if board[i] == '_':
                return None
        return 0

    def get_next_move(self, board, palyer, curdepth = 0):
        e = self.eval_board(board)
        if e is not None:   return e*(9-curdepth)       #depth heuristic
        if palyer == 'x':
            best_val, best_move = -float('inf'), -1
            for i in range(9):
                if board[i] == '_':
                    board[i] = palyer
                    move_val = self.get_next_move(board, 'o', curdepth+1)
                    if move_val > best_val:
                        best_val, best_move = move_val, i
                    board[i] = '_'
            if curdepth:    return best_val
            return best_move
        else:
            best_val, best_move = float('inf'), -1
            for i in range(9):
                if board[i] == '_':
                    board[i] = palyer
                    move_val = self.get_next_move(board, 'x', curdepth+1)
                    if move_val < best_val:
                        best_val, best_move = move_val, i
                    board[i] = '_'
            if curdepth:    return best_val
            return best_move
