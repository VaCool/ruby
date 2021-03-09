# frozen_string_literal: true

# Logger user operation
class Logger
  def log(name, age, message)
    file = File.open('log.txt', 'a')
    file.puts("Name: #{name}, age: #{age}, result: #{message}")
    file.close
  end
end
