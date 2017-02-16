require 'forwardable'

class RecordCollection

  attr_accessor :records
  extend Forwardable
  def_delegator :@records, :[], :record_number
  def_delegators :@records,:size,:<<,:map

end

r = RecordCollection.new
r.records = [5,4,6]
p r.record_number(0)
p r.size
r << 7
p r.map{|x| x * 2}
