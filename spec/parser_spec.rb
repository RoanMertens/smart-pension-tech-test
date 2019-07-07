require_relative '../lib/parser'

describe Parser do
  context 'when parsing a file' do
    it 'should accept a .log file and return a hash' do
      expect(Parser.parse('./data/one_item.log')).to have_key('/help_page/1')
    end

    it 'should accept a .log file and return a hash with a nested hash' do
      expect(Parser.parse('./data/one_item.log')['/help_page/1']).to have_key(:all)
    end

    it 'should raise a "File not found" error when the location of the file is wrong' do
      expect { Parser.parse('nothing.rb') }.to raise_error('File not Found')
    end
  end
end
