require_relative '../lib/log_reader'

# LogReader
# should be initialized with the path to the .log file
# if not: should raise an error
# should return an ordered list/array of webpages with entries
# same buth with unique entries

describe LogReader do
  context 'when initializing a new LogReader instance' do
    it 'should be initialized with the path to the .log file' do
      expect(LogReader).to receive(:new).with(instance_of(String))
      LogReader.new('../data/webserver.log')
    end
    it 'should raise an exception when the location of the file is wrong' do
      expect(LogReader.new('wrong path')).to raise_error
    end
  end
end
