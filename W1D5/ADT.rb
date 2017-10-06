require 'byebug'
class Stack
    def initialize
        @stack = []
    end

    def add(el)
        @stack << el
    end

    def remove
        @stack.pop
    end

    def show
        @stack.dup
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def show
        @queue.dup
    end
end

class Map
    def initialize
        @map = []
    end

    def assign(key, val)
        index = @map.index {|hash| hash[0] == key }
        if index == nil
            @map.push([key, val])
        else
            @map[index][1] = val
        end
    end

    def lookup(key)
        @map.each {|el| return el[1] if el[0] == key}
        nil
    end

    def remove(key)
        index = @map.index {|hash| hash[0] == key }
        if index == nil
            return nil
        else
            @map.delete_at(index)
        end            
    end

    # def show
    #     @map.dup
    # end

    #After looking at solutions this is how show should be done
    #forgot we needed to use deep_dup because of the pair values
    def show
        deep_dup(@map)
    end

    private
    def deep_dup(arr)
        arr.map do |el| 
            if el.is_a?(Array) 
                deep_dup(el)
            else
                el
            end
        end
    end

end