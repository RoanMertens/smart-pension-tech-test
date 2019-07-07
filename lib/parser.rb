class Parser
  def self.parse(file_path)
    check_file(file_path)
    File.open(file_path).map(&:strip)
  end

  def self.check_file(file_path)
    raise 'File not Found' unless File.exist?(file_path)
  end
end
