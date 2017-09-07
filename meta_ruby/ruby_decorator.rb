class Parser
  def parse
    puts 'The Parser class received the parse method'
  end
end

class XmlParser
  def initialize(parser)
    @parser = parser
  end
  def parse
    @parser.parse
    puts 'An instance of the XmlParser class received the parse message'
  end
end

class JsonParser

  def initialize(parser)
    @parser = parser
  end

  def parse
    puts 'An instance of the JsonParser class received the parse message'
    @parser.parse
  end
end

parser = Parser.new
puts 'Using XmlParser'
XmlParser.new(parser).parse

puts 'Using JsonParser'
JsonParser.new(parser).parse

puts 'Both Xml and Json Parser'
JsonParser.new(XmlParser.new(parser)).parse
