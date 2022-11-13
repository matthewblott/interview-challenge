namespace lib;

public static class Functions
{
  public static decimal CalculateMean(IList<int> numbers)
  {
    var len = numbers.Count;
    var validNumberCount = 0;
    var sum1 = 0;
    
    for(var i = 0; i < len; i++)
    {
      var number = numbers[i];
      var isValidNumber = number is >= 0 and <= 100;

      if (!isValidNumber)
        continue;
      
      validNumberCount++;
      sum1 += number;

    }
    
    var mean = sum1 / validNumberCount;

    return mean;

  }

  public static decimal StandardDeviation(IList<int> numbers)
  {
    var len = numbers.Count;
    var validNumberCount = 0;
    decimal sum1 = 0;

    var validNumbers = Array.Empty<int>();
    
    // Calculate sum
    for(var i = 0; i < len; i++)
    {
      var number = numbers[i];
      var isValidNumber = number is >= 0 and <= 100;

      if (!isValidNumber)
        continue;

      Array.Resize(ref validNumbers, validNumbers.Length + 1);
      
      validNumbers[validNumberCount] = number;

      validNumberCount++;
      sum1 += number;

    }
    
    // Calculate mean
    var mean = sum1 / validNumberCount;
    decimal sum2 = 0;

    // For each number:
    // (x - mean) squared
    for(var i = 0; i < validNumberCount; i++)
    {
      var number = validNumbers[i];
      var y = (number - mean) * (number - mean);

      sum2 += y;

    }
    
    // Calculate mean for the above result
    var value = sum2 / validNumberCount;

    var deviation = Math.Sqrt((double)value);
    
    return (decimal)deviation;

  }

  public static IEnumerable<int> Histogram(List<int> numbers)
  {
    var ranges = new int[10];

    foreach (var number in numbers)
    {
      if(number < 0 || number > 100)
      {
        continue;
      }
      for(var i = 0; i < 10; i++)
      {
        var count = ranges[i];
        var rangeStart = i * 10;
        var rangeEnd = rangeStart + 10;
        var inRange = number >= rangeStart && number < rangeEnd;
      
        if(inRange)
        {
          ranges[i] = count + 1;
        }
      
      }
      
    }
    
    return ranges;

  }

  public static int SquareRoot(int number)
  {
    for(var i = 1; i < number + 1; i++) 
    {
      for(var j = 1; j < i + 1; j++)
      {
        var x = i * j;

        if (x == 237)
        {
          Console.WriteLine();
        }
        
        if(x == number && i == j)
        {
          return i;
        }

      }
    
    }

    return 0;

  }
  
  public static decimal CalculateCompoundInterest(int term, decimal rate, int deposit)
  {
    decimal value = deposit;
    
    for(var i = 0; i < term; i++)
    {
      var x = value * rate;
      
      value += x;
    }
    
    return value - deposit;
    
  }

}
