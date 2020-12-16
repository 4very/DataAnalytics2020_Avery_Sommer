igame = "W1.e4 B1.e5 W2.Nf3 B2.Nc6 W3.Bb5 B3.a6 W4.Ba4 B4.Nf6 W5.O-O B5.Be7 W6.Re1 B6.b5 W7.Bb3 B7.d6 W8.c3 B8.O-O W9.h3 B9.Na5 W10.Bc2 B10.c5 W11.d4 B11.Qc7 W12.Nbd2 B12.Bd7 W13.Nf1 B13.cxd4 W14.cxd4 B14.Rac8 W15.Ne3 B15.Nc6 W16.d5 B16.Nb4 W17.Bb1 B17.a5 W18.a3 B18.Na6 W19.b4 B19.Ra8 W20.Bd2 B20.Rfc8 W21.Bd3 B21.Qb7 W22.g4 B22.g6 W23.Nf1 B23.axb4 W24.axb4 B24.Bd8 W25.Ng3 B25.Nc7 W26.Qe2 B26.Rxa1 W27.Rxa1 B27.Ra8 W28.Qe1 B28.Nfe8 W29.Qc1 B29.Ng7 W30.Rxa8 B30.Qxa8 W31.Bh6 B31.Nce8 W32.Qb2 B32.Qa4 W33.Kg2 B33.Bb6 W34.Bc2 B34.Qa7 W35.Bd3 B35.Qa4 W36.Ne2 B36.Nc7 W37.Nxe5 B37.dxe5 W38.Qxe5 B38.Nce8 W39.Bxg7 B39.Qd1 W40.Bh6 B40.Qxd3 W41.Qe7 B41.Ng7 W42.Ng3 B42.Qc2 W43.Qf6 B43.Nf5 W44.Qxb6 B44.Nh4+ W45.Kh2 B45.Nf3+ W46.Kg2 B46.Nh4+ W47.Kh2 B47.Nf3+ W48.Kg2 B48.Nh4+ W49.Kh2"
ires = 0
num = 94

class Piece:
    def __init__(self, name, isWhite):
        self.name = name
        self.isWhite = isWhite
        kills = 0
    
    def __str__(self):
        return f'Piece {"white" if self.isWhite else "black"} {self.name}'
    
    def inc(self):
        kills+=1
    
    
class Game:
    def __init__(self):
        self.board = {
                    'a1': Piece('Lrook', True),
                    'b1': Piece('Lknight', True),
                    'c1': Piece('Lbishop', True),
                    'd1': Piece('Queen', True),
                    'e1': Piece('King', True),
                    'f1': Piece('Rbishop', True),
                    'g1': Piece('Rknight', True),
                    'h1': Piece('Rrook', True),
                    'a2': Piece('pawn0', True),
                    'b2': Piece('pawn1', True),
                    'c2': Piece('pawn2', True),
                    'd2': Piece('pawn3', True),
                    'e2': Piece('pawn4', True),
                    'f2': Piece('pawn5', True),
                    'g2': Piece('pawn6', True),
                    'h2': Piece('pawn7', True),
                    'a3': None,
                    'b3': None,
                    'c3': None,
                    'd3': None,
                    'e3': None,
                    'f3': None,
                    'g3': None,
                    'h3': None,
                    'a4': None,
                    'b4': None,
                    'c4': None,
                    'd4': None,
                    'e4': None,
                    'f4': None,
                    'g4': None,
                    'h4': None,
                    'a5': None,
                    'b5': None,
                    'c5': None,
                    'd5': None,
                    'e5': None,
                    'f5': None,
                    'g5': None,
                    'h5': None,
                    'a6': None,
                    'b6': None,
                    'c6': None,
                    'd6': None,
                    'e6': None,
                    'f6': None,
                    'g6': None,
                    'h6': None,
                    'a7': Piece('pawn0', False),
                    'b7': Piece('pawn1', False),
                    'c7': Piece('pawn2', False),
                    'd7': Piece('pawn3', False),
                    'e7': Piece('pawn4', False),
                    'f7': Piece('pawn5', False),
                    'g7': Piece('pawn6', False),
                    'h7': Piece('pawn7', False),
                    'a8': Piece('Lrook', False),
                    'b8': Piece('Lknight', False),
                    'c8': Piece('Lbishop', False),
                    'd8': Piece('Queen', False),
                    'e8': Piece('King', False),
                    'f8': Piece('Rbishop', False),
                    'g8': Piece('Rknight', False),
                    'h8': Piece('Rrook', False)
        }
        self.kills = {                    
                    'a1': 0,
                    'b1': 0,
                    'c1': 0,
                    'd1': 0,
                    'e1': 0,
                    'f1': 0,
                    'g1': 0,
                    'h1': 0,
                    'a2': 0,
                    'b2': 0,
                    'c2': 0,
                    'd2': 0,
                    'e2': 0,
                    'f2': 0,
                    'g2': 0,
                    'h2': 0,
                    'a3': 0,
                    'b3': 0,
                    'c3': 0,
                    'd3': 0,
                    'e3': 0,
                    'f3': 0,
                    'g3': 0,
                    'h3': 0,
                    'a4': 0,
                    'b4': 0,
                    'c4': 0,
                    'd4': 0,
                    'e4': 0,
                    'f4': 0,
                    'g4': 0,
                    'h4': 0,
                    'a5': 0,
                    'b5': 0,
                    'c5': 0,
                    'd5': 0,
                    'e5': 0,
                    'f5': 0,
                    'g5': 0,
                    'h5': 0,
                    'a6': 0,
                    'b6': 0,
                    'c6': 0,
                    'd6': 0,
                    'e6': 0,
                    'f6': 0,
                    'g6': 0,
                    'h6': 0,
                    'a7': 0,
                    'b7': 0,
                    'c7': 0,
                    'd7': 0,
                    'e7': 0,
                    'f7': 0,
                    'g7': 0,
                    'h7': 0,
                    'a8': 0,
                    'b8': 0,
                    'c8': 0,
                    'd8': 0,
                    'e8': 0,
                    'f8': 0,
                    'g8': 0,
                    'h8': 0
        }
        
    def __str__(self):
        l = []
        retval = ""
        for x in range(len(self.board.keys())):
            val = self.board[list(self.board.keys())[::-1][x]]
            if (x) % 8 == 0:
                retval += "".join(l[::-1])
                retval += "\n"
                l = []
            
            app = ""
            if val == None: app = "_"
            elif val.name[0] == "p": app = "P"
            else: app = val.name[1]
            l.append(app)
        retval += "".join(l[::-1])
        retval += "\n"
        return retval
    
    def move
        

print(Game())
