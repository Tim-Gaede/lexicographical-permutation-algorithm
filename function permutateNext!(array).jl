#-------------------------------------------------------------------------------
function permuNext!(a)
 # Returns a value of true if the permutation is lexicographically last.
    len = length(a)
    iₗ = 1

    # Find iₗ
    disorder_fnd = false
    for i = 1 : len-1
        if a[i] < a[i+1]
            disorder_fnd = true
            iₗ = i
        end
    end


    if disorder_fnd
        # Find iᵣ
        iᵣ = iₗ + 1
        for i = iₗ + 2 : len
            if a[iₗ] < a[i];    iᵣ = i; end
        end

        a[iₗ], a[iᵣ]  =  a[iᵣ], a[iₗ] # Swap

        # Swap pairs of elements to the right of iₗ
        pairs = (len - iₗ)  ÷  2
        for p = 1 : pairs
            a[iₗ + p], a[len - p + 1]  =  a[len - p + 1], a[iₗ + p]
        end
    end

    !disorder_fnd
end
#-------------------------------------------------------------------------------



function main()
    println("\n"^6)
    arr = ['A', 'B', 'C', 'D', 'E']
    cnt = 1
    println(arr, " ", lpad(cnt,3))
    while !permuNext!(arr);    cnt+=1;    println(arr, " ", lpad(cnt,3)); end
end
main()
