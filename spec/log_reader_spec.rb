require_relative '../lib/log_reader'

# LogReader
# should be initialized with the path to the .log file
# if not: should raise an error
# should return an ordered list/array of webpages with entries
# same buth with unique entries

describe LogReader do
  webserver = LogReader.new('../data/webserver.log')
  one_item = LogReader.new('../data/one_item.log')
  ten_items = LogReader.new('../data/ten_items.log')

  context 'when initializing a new LogReader instance' do
    it 'should be initialized with the path to the .log file' do
      expect(LogReader).to receive(:new).with(instance_of(String))
      LogReader.new('../data/webserver.log')
    end
    it 'should raise an exception when the location of the file is wrong' do
      expect(LogReader.new('wrong path')).to raise_error
    end
  end
  context 'when asking for an ordered list of webpages with entries' do
    describe '#all' do
      it 'should return an array' do
        expect(webserver.all).to be_an_instance_of(Array)
      end
      it 'should include the path' do
      end
      it 'should return an array where each item is structured this way: path, number of views, visits' do
      end
      it 'should return an array that is sorted by number of entries to the page (descending)' do
      end
    end

    describe '#unique' do
      it 'should return an array' do
        expect(webserver.unique).to be_an_instance_of(Array)
      end
      it 'should include the path' do
      end
      it 'should return an array where each item is structured this way: path, number of views, unique views' do
      end
      it 'should return an array that is sorted by number of unique entries to the page (descending)' do
      end
    end
  end
end
