# frozen_string_literal: true

def gcd(a, b)
  (a % b).zero? ? b : gcd(b, (a % b))
end

def factorization(n)
  t = n**2
  while true
    a = rand(1..n)
    gcd_result = gcd(n, a)

    if gcd_result > 1
      puts "Number: #{n} | Divider: #{gcd_result} | a: #{a}"
      return
    end

    r = 2
    r += 1 while ((a**r) % n) == 1 && (a**r) < t

    next if r.odd?

    if (gcd_result = gcd(n, (a**(r / 2)) - 1) > 1)
      puts "Number: #{n} | Divider: #{gcd_result} | a: #{a} | r: #{r}"
      return
    end

    if (gcd_result = gcd(n, (a**(r / 2)) + 1) > 1)
      puts "Number: #{n} | Divider: #{gcd_result} | a: #{a} | r: #{r}"
      return
    end
  end
end

factorization(12)
factorization(91)
factorization(57)
factorization(143)
factorization(1737)
factorization(1859)
factorization(13_843)
factorization(988_027)
