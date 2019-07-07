require_relative '../lib/parser'

describe Parser do
  context 'when parsing a file' do
    it 'should accept a .log file and return an array' do
      allow(Parser).to receive(:parse).with('./data/webserver.log').and_return(an_instance_of(Array))
    end
    it 'should strip the \n from the strings in the array' do
      expect(Parser.parse('./data/one_item.log').join).not_to include('\n')
    end
    it 'should raise a "File not found" error when the location of the file is wrong' do
      expect { Parser.parse('nothing.rb') }.to raise_error('File not Found')
    end
  end
end
