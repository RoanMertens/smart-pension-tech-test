require_relative 'parser'

class LogReader
  def initialize(file_path)
    @file = Parser.parse(file_path)
  end

  def all
    create_list(@file, 'visits')
  end

  def unique
    create_list(@file.uniq, 'unique views')
  end

  private

  def create_list(file, message)
    rows = Hash.new(0)
    file.map { |line| rows[line.split(' ')[0]] += 1 }
    rows = sort_desc(rows)
    format(rows, message)
  end

  def sort_desc(rows)
    rows.sort_by { |_k, v| v }.reverse
  end

  def format(rows, message)
    list = []
    rows.each { |k, v| list << "#{k} #{v} #{message}" }
    list
  end
end
