class LogReader
  def initialize(file_path)
    check_file(file_path)
    @file = parse(file_path)
  end

  def all
    rows = Hash.new(0)
    file = @file.map { |line| rows[line.split(' ')[0]] += 1 }
    rows = rows.sort_by { |_k, v| v }.reverse
    list = []
    rows.each { |key, val| list << "#{key} #{val} visits" }
    list
  end

  def unique
    rows = Hash.new(0)
    file = @file.uniq.map { |line| rows[line.split(' ')[0]] += 1 }
    rows = rows.sort_by { |_k, v| v }.reverse
    list = []
    rows.each { |key, val| list << "#{key} #{val} unique views" }
    list
  end

  private

  def parse(file_path)
    File.open(file_path).map(&:strip)
  end

  def check_file(file_path)
    raise 'File not Found' unless File.exist?(file_path)
  end
end
