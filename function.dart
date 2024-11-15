// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.reduce((value, element) => value + element);
  return total + (total * taxRate);
}

// Function to apply a discount using a higher-order function
List<double> applyDiscount(List<double> prices, double Function(double) discount) {
  return prices.map(discount).toList();
}

// Recursive function to calculate a factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}

void main() {
  // Sample list of item prices
  List<double> itemPrices = [12.99, 5.99, 22.50, 9.99, 45.00];

  // Anonymous function to filter out items below $10
  List<double> filteredPrices = itemPrices.where((price) => price >= 10).toList();
  print('Filtered Prices: $filteredPrices');

  // Discount function to reduce price by 10%
  double discountFunction(double price) {
    return price * 0.9;
  }

  // Apply discount to all items
  List<double> discountedPrices = applyDiscount(filteredPrices, discountFunction);
  print('Discounted Prices: $discountedPrices');

  // Calculate total price with 5% tax
  double totalPrice = calculateTotal(discountedPrices, taxRate: 0.05);
  print('Total Price after Discount and Tax: \$${totalPrice.toStringAsFixed(2)}');

  // Calculate factorial discount based on the number of items
  double factorialDiscount = calculateFactorialDiscount(discountedPrices.length);
  print('Factorial Discount: $factorialDiscount%');

  // Apply the factorial discount to the total price
  double finalPrice = totalPrice - (totalPrice * (factorialDiscount / 100));
  print('Final Price after Factorial Discount: \$${finalPrice.toStringAsFixed(2)}');
}
