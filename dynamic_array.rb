class StaticArray
	def initialize(length)
		@store = Array.new(length)
	end

	def [](index)
		@store[index]
	end

	def []=(index, value)
		@store[index] = value
	end

	def length
		@store.length
	end
end


class DynamicArray
	attr_reader :length

	def initialize
		@store = Array.new(8)
		@length = 0
	end

	def [](index)
		check_index(index)
		@store[index]
	end

	def []=(index, value)
		check_index(index)
		@store[index]=value
	end

	def pop(num)
		return "cannot pop negative number" unless num >= 0
		val = @store[-num..-1]
		@length -= 1

		val
	end

	def push(val)
		resize if @length + 1 > @store.length
		@store[@length + 1] = val
		@length += 1
	end

	def shift(num)
		return "cannot shift negative number" unless num >= 0
		val = @store[0...num]
		(1...length) {|element| @store[element - 1] = @store[element]}
		@length -= 1

		val
	end

	def unshift(val)
		resize if @length + 1 > @store.length
		@length += 1

		(0...length) {|element| @store[element] = @store[element+1]}
		@store[0] = val
	end


	protected
	def check_index(index)
		raise "Not an index" unless (index >= 0) && (index < this.length)
	end

	def resize
	    new_store = StaticArray.new(store_size * 2)
	    length.times { |i| new_store[i] = @store[i] }
	    @store = new_store
	end
end
