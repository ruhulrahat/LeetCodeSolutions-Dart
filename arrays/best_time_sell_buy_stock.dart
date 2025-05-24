// You are given an array prices where prices[i] is the price of a given stock on the i-th day.

// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

// Return the maximum profit you can achieve from this transaction.
// If no profit is possible, return 0.

// Input: prices = [7, 1, 5, 3, 6, 4]
// Output: 5
// Explanation: Buy on day 1 (price = 1) and sell on day 4 (price = 6), profit = 6 - 1 = 5

// Input: prices = [7, 6, 4, 3, 1]
// Output: 0
// Explanation: No profit is possible, as prices decrease every day.

int maxProfit(List<int> prices) {
  int minPrice = prices[0];
  int maxProfit = 0;

  for (int i = 1; i < prices.length; i++) {
    if (prices[i] < minPrice) {
      minPrice = prices[i];
    } else {
      int profit = prices[i] - minPrice;
      if (profit > maxProfit) {
        maxProfit = profit;
      }
    }
  }

  return maxProfit;
}

void main() {
  print(maxProfit([7, 1, 5, 3, 6, 4])); // Output: 5
  print(maxProfit([7, 6, 4, 3, 1])); // Output: 0

  print(actualProfit([7, 1, 5, 3, 6, 4])); // Output: 5
  print(
      actualProfit([7, 6, 4, 3, 1])); // Output: -1 (best: buy at 6, sell at 4)
  print(actualProfit([5, 10, 2, 12])); // Output: 10 (buy at 2, sell at 12)

  print(maxProfitMultipleTransactions([7, 1, 5, 3, 6, 4])); // Output: 7
  print(maxProfitMultipleTransactions([1, 2, 3, 4, 5])); // Output: 4
  print(maxProfitMultipleTransactions([7, 6, 4, 3, 1])); // Output: 0
}

int actualProfit(List<int> prices) {
  int minPrice = prices[0];
  int actualProfit =
      prices[1] - prices[0]; // Start with first valid transaction

  for (int i = 1; i < prices.length; i++) {
    int profit = prices[i] - minPrice;
    if (profit > actualProfit) {
      actualProfit = profit;
    }
    if (prices[i] < minPrice) {
      minPrice = prices[i];
    }
  }

  return actualProfit;
}

// You are given an integer array prices where prices[i] is the price of a stock on day i.

// You can complete as many transactions as you like (buy one and sell one share of the stock multiple times), but you must sell the stock before you buy again.

// Return the maximum profit you can achieve.

// Input: prices = [7, 1, 5, 3, 6, 4]
// Output: 7
// Explanation:
// - Buy on day 1 (price = 1), sell on day 2 (price = 5), profit = 4
// - Buy on day 3 (price = 3), sell on day 4 (price = 6), profit = 3
// - Total profit = 4 + 3 = 7

// Input: prices = [1, 2, 3, 4, 5]
// Output: 4
// Explanation: Buy on day 0, sell on day 4 = profit 4 (or buy/sell every day for same profit)

int maxProfitMultipleTransactions(List<int> prices) {
  int profit = 0;

  for (int i = 1; i < prices.length; i++) {
    if (prices[i] > prices[i - 1]) {
      profit += prices[i] - prices[i - 1];
    }
  }

  return profit;
}
