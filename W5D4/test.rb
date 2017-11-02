def isPrime(num)
  if num < 2
    return false
  end

  (2...num).each do |i|
    return false if num % i == 0
  end

  return true
end