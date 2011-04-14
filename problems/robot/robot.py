# coding: utf-8
# Suponha que você precisa implementar um robo controlado pelos seguintes comandos:
# 
# L - Virar 90 graus para a esquerda
# R - Virar 90 graus para a direita
# M - Mover um ponto para frente
# T - Se tele transportar para um determinado ponto
# 
# O robo anda em um plano cartesiano, em um espaço de tamanho especifico. 
# Ele não pode se mover ou tele transportar para fora desse espaço. O input do 
# problema vem de um arquivo no seguinte formato (sem os comentários):
# 
# 10 10              # o tamanho do espaço que o robo pode usar
# 2 5 N              # sua localização atual e para qual direção ele está virado
# LLRRMMMRLRMMM      # um conjunto de inputs
# T 1 3              # para se tele transportar para um ponto especifico dentro do espaço definido
# LLRRMMRMMRM        # um outro conjunto de entradas
# 
# O resultado final deve ser dado pelo robo para indicar sua posição e para onde ele está apontando, por exemplo:
# 
# 2 4 E              # na posição 2 4, virado para East
# 
# Assuma que, o quadrado, imediatamente ao norte de (x, y) é (x, y + 1)

class Robot(object):
    
    clockwise_positions = {
        'N': 'E',
        'E': 'S',
        'S': 'W',
        'W': 'N',
    }
    counterclockwise_positions = {
        'N': 'W',
        'W': 'S',
        'S': 'E',
        'E': 'N',
    }

    def __init__(self, x, y, position):
        self.transport(x, y)
        self.position = position

    def transport(self, x, y):
        self.x = int(x)
        self.y = int(y)

    def do(self, action):
        actions = {
            'L': self.turn_left,
            'R': self.turn_rigth,
            'M': self.move,
        }
        actions[action]()

    def turn_rigth(self):
        self.position = self.clockwise_positions[self.position]

    def turn_left(self):
        self.position = self.counterclockwise_positions[self.position]

    def move(self):
        actions = {
            'N': self.move_north,
            'E': self.move_east,
            'S': self.move_south,
            'W': self.move_west,
        }
        actions[self.position]()

    def move_north(self):
        self.y += 1

    def move_south(self):
        self.y -= 1

    def move_east(self):
        self.x += 1

    def move_west(self):
        self.x -= 1

    def __str__(self):
        return "%s %s %s" % (self.x,self.y,self.position)

def main():
    file_obj = open('robot.in')
    max_x, max_y = map(int, file_obj.readline().strip().split())
    x,y,position = file_obj.readline().strip().split()

    robot = Robot(x,y,position)

    for line in file_obj:
        if line.startswith('T'):
            _, x, y = line.strip().split()
            robot.transport(int(x), int(y))
        else:
            for position in line.strip():
                robot.do(position)
    
    print robot
    file_obj.close()

if __name__ == '__main__':
    main()
