class ApplicationController < ActionController::Base
  protect_from_forgery
  def ope(a, b, o)
    case o
    when 0
      c = a + b
    when 1
      c = a - b
    when 2
      c = a * b
    when 3
      t = a * b
      c = a
      a = t
      return c
    end
  end
end
