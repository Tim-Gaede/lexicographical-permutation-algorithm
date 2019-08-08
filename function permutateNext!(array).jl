#using OffsetArrays





function permutateNext!(a)
# Returns a value of true if the permutation was last

    left = 1
    len = length(a)

    # Find left .........................
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
        a[left], a[right] = a[right], a[left]

        # Reverse pairs of elements to the right of left
        pairs = (len - left) ÷ 2

        for p = 1 : pairs
            a[left + p], a[len - p - 1]  =  a[len - p - 1], a[left + p]
        end

    end

end





function arraingementWorks(a)
    return (a[1] + a[2] + a[3] == a[4] + a[3] + a[5]  &&
            a[4] + a[3] + a[5] == a[6] + a[5] + a[7]  &&
            a[6] + a[5] + a[7] == a[8] + a[7] + a[9]  &&
            a[8] + a[7] + a[9] == a[10] + a[9] + a[2]  )

end


function indexOfSmallest(a)
    smallest = a[1]
    result = 1

    for i = 2 : length(a)
        if (a[i] < smallest)
            smallest = a[i]
            result = i
        end
    end
    return result
end

function gonCode(a)

    resultText = ""




    subCodes = []
    push!(subCodes, a[1]*100 + a[2]*10 + a[3])
    push!(subCodes, a[4]*100 + a[3]*10 + a[5])
    push!(subCodes, a[6]*100 + a[5]*10 + a[7])
    push!(subCodes, a[8]*100 + a[7]*10 + a[9])
    push!(subCodes, a[10]*100 + a[9]*10 + a[2])


    subCodesFirstNum = []
    push!(subCodesFirstNum, a[1])
    push!(subCodesFirstNum, a[4])
    push!(subCodesFirstNum, a[6])
    push!(subCodesFirstNum, a[8])
    push!(subCodesFirstNum, a[10])

    iStart = indexOfSmallest(subCodesFirstNum)
    for extra = 0 : 4
        index = (iStart-1 + extra) % 5 + 1
        resultText *= string(subCodes[index])
    end


    return parse(Int64, resultText)
end

numberInPositions = []
for i = 1 : 10
    push!(numberInPositions, i)
end

function main()
    println("Searching...\r\n\r\n")
    loopCount = 0
    loopMax = factorial(10)
    codeMax = 0
    permWasLast = false
    while(!permWasLast)
        if (arraingementWorks(numberInPositions))
            code = gon16Code(numberInPositions)
            if (code > codeMax  &&  code < 10^16)
                codeMax = code
                println("\r\n", codeMax, "\r\n")
            end
        end

        permWasLast = permutateNext!(numberInPositions)
        loopCount += 1

        if (loopCount % 100_000 == 0)
            println((100loopCount / loopMax), "% finished.")
        end
    end

    println("\r\n\r\n\r\nThe answer is ", codeMax)

end
main()
