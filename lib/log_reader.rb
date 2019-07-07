class LogReader
  def initialize(file_path)
    check_file(file_path)
    @file = parse(file_path)
  end

  def all
    rows = Hash.new(0)
    file = @file.map { |line| rows[line.split(' ')[0]] += 1 }
    rows = sort_desc(rows)
    format(rows, 'visits')
  end

  def unique
    rows = Hash.new(0)
    file = @file.uniq.map { |line| rows[line.split(' ')[0]] += 1 }
    rows = sort_desc(rows)
    format(rows, 'unique views')
  end

  private

  def sort_desc(rows)
    rows.sort_by { |_k, v| v }.reverse
  end

  def format(rows, message)
    list = []
    rows.each { |key, val| list << "#{key} #{val} #{message}" }
    list
  end

  def parse(file_path)
    File.open(file_path).map(&:strip)
  end

  def check_file(file_path)
    raise 'File not Found' unless File.exist?(file_path)
  end
end
