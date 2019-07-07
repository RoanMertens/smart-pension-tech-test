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
      expect(LogReader.new('wrong path')).to raise_error('File not found')
    end
  end
  context 'when asking for an ordered list of webpages with entries' do
    describe '#all' do
      it 'should return an array' do
        expect(webserver.all[0]).to be_an_instance_of(Array)
      end
      it 'should include the path' do
        expect(one_item.all[0]).to include('/help_page/1')
      end
      it 'should return an array where each item is structured this way: path, number of views, visits' do
        expect(one_item.all[0]).to eql('/help_page/1 1 visits')
      end
      it 'should return an array that is sorted by number of entries to the page (descending)' do
        ten_items_parsed_and_sorted = ['/help_page/1 5 visits',
                                       '/about/2 4 visits',
                                       '/home 2 visits',
                                       '/contact 1 visits']
        expect(tem_items.all).to eql(ten_items_parsed_and_sorted)
      end
    end

    describe '#unique' do
      it 'should return an array' do
        expect(webserver.unique).to be_an_instance_of(Array)
      end
      it 'should include the path' do
        expect(one_item.unique[0]).to include('/help_page/1')
      end
      it 'should return an array where each item is structured this way: path, number of views, unique views' do
        expect(one_item.all[0]).to eql('/help_page/1 1 visits')
      end
      it 'should return an array that is sorted by number of unique entries to the page (descending)' do
        ten_items_parsed_and_sorted = ['/help_page/1 5 visits',
                                       '/about/2 4 visits',
                                       '/home 2 visits',
                                       '/contact 1 visits']
        expect(tem_items.all).to eql(ten_items_parsed_and_sorted)
      end
    end
  end
end
