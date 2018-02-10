class Integer
  def to_roman
    target = []
    self.to_s.split("").reverse.each_with_index { |e, i| target << e + "0" * i }
    target.reverse!
    # for 2193.to_roman
    # target == ["2000", "100", "90", "3"]
    return target.map { |e| calc(e) }.join
  end

  private
  def calc(num)
    n, num = num[0].to_i, num.to_i
    # set boundaries for roman counting
    lower, middle, upper =
        if num >= 1000
          ["M", "M", "M"]
        elsif num >= 100
          ["C", "D", "M"]
        elsif num >= 10
          ["X", "L", "C"]
        else
          ["I", "V", "X"]
        end

    res = ""
    if n >= 5
      res << middle
      res << lower * (n % 5) if n % 5 > 0
    else
      res << lower * n
    end

    # computationally substitues:
    # "IIII" with "IV" and "VIIII" with "IX", etc.
    res.gsub!(middle + lower * 4, lower + upper)
    res.gsub!(lower * 4, lower + middle)
    return res
  end
end
