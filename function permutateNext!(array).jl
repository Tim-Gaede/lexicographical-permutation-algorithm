function permutateNext!(a)
# Returns a value of true if the permutation was last

    left = 1 # left index
    len = length(a)

    # Find left index ....................
    adj_items_out_of_order = false
    for i = 1 : len-1
        if a[i] < a[i+1]
            adj_items_out_of_order = true
            left = i
        end
    end
    # ...................................


    if adj_items_out_of_order
        # Find right index if adjacent elements were out of order
        right = left + 1
        for i = left + 2 : len
            if a[left] < a[i]
                right = i
            end
        end

        #Swap(ref a, left, right)
        a[left], a[right]  =  a[right], a[left]

        # Reverse pairs of elements to the right of left
        pairs = (len - left) ÷ 2
        for p = 1 : pairs
            a[left + p], a[len - p + 1]  =  a[len - p + 1], a[left + p]
        end

    end

    !adj_items_out_of_order
end


function main()

    arr = [1,2,3,4]

    last = false
    cnt = 0
    while !last
        println(arr)
        last = permutateNext!(arr)
        cnt += 1
    end

    println("\n$cnt permutations")
end
main()

