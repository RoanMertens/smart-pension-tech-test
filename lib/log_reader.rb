class LogReader
  def initialize(file_path)
    check_file(file_path)
    @file = parse(file_path)
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
