class Parser
  def parse(file_path)
    check_file(file_path)
    file = File.open(file_path).map(&:strip)
    create_entries(file)
  end

  private

  def check_file(file_path)
    raise 'File not Found' unless File.exist?(file_path)
  end

  def create_entries(file)
    empty_entries = Hash.new { |h, k| h[k] = Hash.new(0) }
    entries = fill_hash(empty_entries, :all, file)
    fill_hash(entries, :unique, file.uniq)
  end

  def fill_hash(entries, type, file)
    file.each { |line| entries[line.split(' ')[0]][type] += 1 }
    entries
  end
end
