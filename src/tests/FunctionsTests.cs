namespace tests;

using Shouldly;
using static lib.Functions;

public class FunctionsTests
{
  [Test]
  public void Should_return_mean_from_list()
  {
    var numbers = new[]
    {
      10, 11, 9
    };
    
    var result = CalculateMean(numbers);

    const decimal expected = 10.0M;
    
    result.ShouldBe(expected);
    
  }

  [Test]
  public void Should_return_standard_deviation_from_list()
  {
    var numbers = new[]
    {
      66, 30, 40, 64
    };
    
    var result = StandardDeviation(numbers);

    const decimal expected = 15.43M;
    
    var roundedResult = Math.Round(result, 2);
    
    roundedResult.ShouldBe(expected);
    
  }

  [Test]
  public void Should_return_square_root_for_number()
  {
    var result = SquareRoot(49);

    const int expected = 7;
    
    result.ShouldBe(expected);

  }

  [Test]
  public void Should_return_histograms_from_list()
  {
    var numbers = Enumerable.Range(0, 100).ToList();
    var result = Histogram(numbers);

    const int expected = 10;
    
    foreach (var i in result)
    {
      i.ShouldBe(expected);
    }
    
  }

  [Test]
  public void Should_calculate_compound_interest()
  {
    const int term = 5;
    const decimal rate = .04M;
    const int deposit = 100;

    var result = CalculateCompoundInterest(term, rate, deposit);

    const decimal expected = 21.67M;

    var roundedResult = Math.Round(result, 2);
    
    roundedResult.ShouldBe(expected);

  }
  
}
