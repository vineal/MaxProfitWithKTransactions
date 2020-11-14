func maxProfitWithKTransactions(_ prices: [Int], _ k: Int) -> Int {
    // Write your code here.
    print(prices)
    print(k)
    var profit = Array(repeating: Array(repeating: 0, count: prices.count) , count:k+1)
    var count = 0
    for t in 1...k{
        count+=1
        print("count=\(count)")
        var max = 0
        for d in 1...prices.count-1 {
            max = maxProfit(prices,d,profit[t-1])
            if( (prices[d] + max) > profit[t][d-1] )
            {
                profit[t][d] = prices[d] + max
                print("first if")
            }
            else{
                profit[t][d] = profit[t][d-1]
                print("second if")
            }
            print("profit=\(profit[t][d])")
            print(profit)
        }
        
    }
    return profit[k][prices.count-1]
}
func maxProfit(_ prices:[Int], _ indexOfPrice : Int, _ profit:[Int]) -> Int{
    var max = -prices[0]+profit[0]
    print("max=\(max)")
    for x in 0...indexOfPrice{
        if max < (-prices[x]+profit[x]){
            max = -prices[x]+profit[x]
        }
    }
    print("max=\(max)")
    return max
}

var arr:[Int] = [5,11,3,50,60,90]
print(maxProfitWithKTransactions(arr, 2))
