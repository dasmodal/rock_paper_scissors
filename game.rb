# Игра вкамень ножницы бумага

SIGNS = { '1': 'Камень', '2': 'Ножницы', '3': 'Бумага' }.freeze

# метод запроса выбора игрока, и генерации выбора компьютера
def user_input
  puts 'Сыграем?'
  puts 'Введите цифру'
  puts '1 Камень   2 Ножницы   3 Бумага'

  user_choice = gets.to_i

  # цикл проверки до тех пор пока игрок не введет допустимое число
  until user_choice >= 1 && user_choice <= 3
    puts 'Вы ввели неверное значение.'
    puts 'Введите цифру от 1 до 3'
    user_choice = gets.to_i
  end

  computer_choice = rand(1..3)

  count = [user_choice, computer_choice]

  puts "Вы выбрали: #{SIGNS[:"#{user_choice}"]}"
  puts

  computer_move_visual

  puts
  puts "Противник выбрал: #{SIGNS[:"#{computer_choice}"]}"
  puts
  puts "Вы против Компьютера! #{SIGNS[:"#{user_choice}"]} и #{SIGNS[:"#{computer_choice}"]}"
  puts 'Безумие'
  sleep(0.5)
  puts

  win?(count)
end

# метод визуального отображения хода компьютера. делает вид что противник думает
def computer_move_visual
  information = 'Противник думает'
  3.times do
    print information
    5.times do
      print '.'
      sleep(0.2)
    end
  end
end

# метод проверки кто выйграл
def win?(count)
  if count[0] == count[1]
    print 'Ничья, '
  elsif ![[1, 2], [2, 3], [3, 1]].include?(count)
    print 'Вы проиграли, '
  else
    print 'Вы победили, '
  end

  case count
  when [1, 2], [2, 1]
    puts 'потому что Камень ломает Ножницы.'
  when [1, 3], [3, 1]
    puts 'потому что Бумага оборачивает Камень.'
  when [2, 3], [3, 2]
    puts 'потому что Ножницы режут Бумагу.'
  else
    puts 'потому что Вы оба два выбрали одно и тоже'
  end
end

# метод очистки терминала
def cls
  system 'clear' or system 'cls'
end

end_game = 1 # переменная для выхода из цикла если она станет нулевой

# цикл игры
until end_game.zero?
  cls
  user_input
  puts

  puts 'Хотите сыграть еще?'
  puts 'Введите цифру 1(Да) или 0(Нет)'
  end_game = gets.to_i

  # todo
  # сделать цикл условия, если пользователь ошибся числом

  # цикл проверки до тех пор пока игрок не введет допустимое число
  until [1, 0].include?(end_game)
    puts 'Вы ввели неверное число.'
    puts 'Введите 1 или 0'
    end_game = gets.to_i
  end
end
