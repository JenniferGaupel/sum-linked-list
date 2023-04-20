
# This class represents the actual nodes on the singly linked list
# This implementation calls it next_node because next is a keyword in Ruby and was giving me errors
class Node 
    attr_accessor :value, :next_node

    def initialize(value, next_node)
        @value = value
        @next_node = next_node
    end
end

##############################################

# This is the class to represent the singly linked list
# It only has the method to add a new value & to get the head value, since that's all we need for the quiz
class LinkedList
    def initialize(value)
        @head = Node.new(value, nil)
    end
    def get_head
        @head
    end

    def addition(value)
        current_node = @head
        while current_node.next_node != nil
            current_node = current_node.next_node
        end
        current_node.next_node = Node.new(value, nil)
    end    
end

##############################################
# Two functions to recursivley sum a linked list

# this is how I initially wrote it
def sum_list_1(node, sum)
    if(node)
        sum += node.value
        sum_list_1(node.next_node, sum)
    else
        return sum
    end    
end

# I also wrote it in a way that I felt was more idiomatic to Ruby
#  I’ve seen code bases where people like to write concise one liners
# so I wanted to show my code flexibility. 
# I prefer the first option but I will follow the standards of the codebase
def sum_list_2(node, sum)
    return sum unless node 
    sum += node.value
    sum_list_2(node.next_node, sum)
end

# first sample object from the quiz
list_1 = LinkedList.new(1)
list_1.addition(1)

# second sample object from the quiz
list_2 = LinkedList.new(0)
list_2.addition(1)
list_2.addition(1)


puts "sum_list_1 w/ list_1 result: #{sum_list_1(list_1.get_head, 0)}"
puts "sum_list_2 w/ list_1 result: #{sum_list_2(list_1.get_head, 0)}"

puts "sum_list_1 w/ list_2 result: #{sum_list_1(list_2.get_head, 0)}"
puts "sum_list_2 w/list_2 result: #{sum_list_2(list_2.get_head, 0)}"