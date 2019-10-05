
require 'min_heap.rb'
# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return [] if list.empty?
  min_heap = MinHeap.new
  list.each do |num|
    min_heap.add(num)
  end
  sorted_array = []
  while !min_heap.empty?
    sorted_array << min_heap.remove()
  end
  return sorted_array
end