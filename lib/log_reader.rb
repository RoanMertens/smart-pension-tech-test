require_relative 'parser'

class LogReader
  def initialize(file_path)
    @entries = Parser.parse(file_path)
  end

  def all
    format(sort_desc(@entries, :all), :all, 'visits')
  end

  def unique
    format(sort_desc(@entries, :unique), :unique, 'unique views')
  end

  private

  def sort_desc(entries, type)
    entries.sort_by { |_k, v| v[type] }.reverse
  end

  def format(entries, type, message)
    entries.map! { |k, v| "#{k} #{v[type]} #{message}" }
  end
end
