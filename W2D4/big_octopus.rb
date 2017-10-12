#copied merge sort from assesment I know that merge sortis O(n log(n))
class Array
    def merge_sort(&prc)
        return self if self.length == 1
        return [] if self.length == 0
        prc ||= Proc.new {|a,b| a <=> b}    

        half = self.length / 2

        left = self.dup[0...half].merge_sort(&prc)
        right = self.dup[half..-1].merge_sort(&prc)

        Array.merge(left, right, &prc)
    end
    
    def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
        res = prc.call(left, right)
        if res == -1
        merged << left.shift
        elsif res == 1
        merged << right.shift
        else
        merged << left.shift
        merged << right.shift
        end
    end

    merged.concat(left)
    merged.concat(right)
    merged
    end    
end

def sluggish_octopus(arr)
    longest = ""
    arr.each_index do |i|
        fish_one = arr[i]        
        (0...arr.length).each do |j|
            fish_two = arr[j]
            if fish_one.length > fish_two.length
                longest = fish_one if fish_one.length > longest.length
            else
                longest = fish_two if fish_two.length > longest.length
            end
        end
    end
    longest
end

def dominant_octopus(arr)
    prc = Proc.new { |x,y| x.length >= y.length}
    arr.merge_sort(&prc).last
end


def clever_octopus(arr)
    longest = ""
    arr.each_index do |i|
        longest = arr[i] if arr[i].length > longest.length
    end        
    longest
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array = TILES_ARRAY)
    tiles_array.each_index do |i|
        return i if tiles_array[i] == direction
    end
end

TILES_HASH = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}
def constant_dance(direction, tiles_hash = TILES_HASH)
    tiles_hash[direction]
end

sluggish_octopus(["fish"])