class ArraySet
	def initialize
		self.store = []
	end

	def include?(target)
		self.store.each do |element|
			return true if element == target
		end

		return false
	end

	def insert(val)
		return false if self.include?(val)
		self.store << val
		return true
	end

	def remove(target)
		return false if !self.include?(val)
		self.store.each_with_index do |element, idx|
			next if element != target
			self.store.delete_at(idx) if element == target
			return true
		end
	end

	protected
	attr_accessor :store
end


class MaxIntSet
	def initialize(max_int)
		@store = Array.new(max_int, false)
	end

	def include?(val)
		@store[val]
	end

	def insert(val)
		@store[val] = true
	end

	def remove(target)
		@store[val] = false
	end
end

class IntHashSet
	attr_reader :count

	def initialize(len)
		@buckets = Array.new(len, [])
		@count = 0
	end

	def include?(val)
		bucket_for(val).include?(val)
	end

	def insert(val)
		return if include?(val)

		self.resize! if count == @buckets.length

		bucket_for(val).push(val)
		@count += 1
	end

	def remove(val)
		return unless include?(val)

		bucket_for(val).delete(val)
		@count -= 1
	end

	protected
	def bucket_for(val, buckets = @buckets)
		idx = val % buckets.length
		buckets[idx]
	end

	def resize!
		num_buckets = @buckets.length
		new_buckets = Array.new(num_buckets, [])
		self.buckets.each do |bucket|
			bucket.each do |element|
				bucket_for(element, new_buckets) << element
			end
		end

		@buckets = new_buckets
	end

end


class HashSet < IntHashSet
end



