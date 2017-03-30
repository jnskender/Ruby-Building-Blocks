def stock_picker(stocks)
    # for each stock value, compare that days value to all future days value
    # if any of those days value is higher than current high(0 or more)
    # record the difference as sell
    # do this for every stock value and rewrite sell value for every if new value is higher
    current_high = 0
    best_buy_day = 0
    best_sell_day = 0
    stocks.each_with_index do |v, i|
        j = i
        for j in i...stocks.size
          if stocks[j] - stocks[i] > current_high
            current_high = stocks[j] - stocks[i]
            best_buy_day = i
            best_sell_day = j
          end
        end
    end
    puts "If you were to buy on day #{best_buy_day} and sell on day #{best_sell_day},"
    puts "you would make a profit of $#{current_high}"
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
