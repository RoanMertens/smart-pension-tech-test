class LogReader
  def initialize(file_path)
    check_file(file_path)
    @file = parse(file_path)
  end

  private

  def parse(file_path)
    File.open(file_path).map(&:strip)
  end

  def check_file(file_path)
    raise 'File not Found' unless File.exist?(file_path)
  end
end
