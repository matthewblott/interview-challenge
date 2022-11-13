# Coding Test

## CSharp Test

Avoiding built in methods like Sum, Average etc, write your own algorithms to execute the calculations.
Please build a test application and submit your project.
There should also be some unit tests (NUnit) to prove the application works correctly.

### Test Instructions

The latest .NET runtime is required for this project. To run the tests:

```bash
cd ./src/tests
dotnet test
```

### Functions

1. Calculate the arithmetic mean of a list of numbers input.
   Numbers within the list should be between 0 and 100 inclusive.
   Do not assume that all values will fall within the required range.
   See ``Functions.CalculateMean``.

2. Calculate the standard deviation for a list of numbers;
   Numbers within the list should be between 0 and 100 inclusive.
   Do not assume that all values will fall within the required range.
   See `Functions.StandardDeviation`.

3. Compute the frequencies of numbers in bins of 10 (histogram 0 to < 10, 10 to < 20 etc.).
   Numbers within the list should be between 0 and 100 inclusive. 
   Do not assume that all values will fall within the required range.
   See `Functions.Histogram`.

4. Calculate the square root of a number.
   Include appropriate validation.
   See `Functions.SquareRoot`

5. Calculate the compound increase of a value for a given interest rate for a given period of time in years.
   See `Functions.CalculateCompoundInterest`.

### Notes

Calculate the compound decrease of a value for a given interest rate for a given period of time in years.

This wasn't clear and no separate function is provided. If a negative interest rate is provided as an argument for the `Functions.CalculateCompoundInterest` function above then the correct value is calculated.

## SQL Test