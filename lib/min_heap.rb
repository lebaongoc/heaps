class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn) adding element to end of array is O(1) while heap-up worst case is O(logn)
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key,value)
    @store.push(new_node)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    if @store.empty?
      return nil
    end
    swap(0,@store.length - 1)
    result = @store.pop
    heap_down(0)
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return (@store.length == 0) ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    
    if index.odd?
      parent_index = (index-1)/2
    else
      parent_index = (index-2)/2
    end
    while @store[index].key < @store[parent_index].key && parent_index > -1
      swap(index,parent_index)
      index = parent_index
      if index.odd?
        parent_index = (index-1)/2
      else
        parent_index = (index-2)/2
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    child_index = 1
    while @store[child_index] != nil && @store[index].key > @store[child_index].key
      swap(index, child_index)
      index = child_index
      child_index = 2 * index + 1
    end
    p @store
  end
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end