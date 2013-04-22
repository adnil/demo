class EventsController < ApplicationController
  def index
  end
  def new
    @option = params[:option]
    @count = params[:count]
    @level = params[:level]
    @level[:level] = (@level[:level].to_i < 1) ? 1 : @level[:level].to_i
    nu = @option[:nu].to_i
    number = @count[:number].to_i
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts number
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    if number == 1
      @q = Array.new(nu)
      @c = Array.new(nu)
      (1...nu).each do |e|
      @a = rand(10**(@level[:level]-1)...10**@level[:level])
      @b = rand(10**(@level[:level]-1)...10**@level[:level])
      @o = @option[:type] == "4" ? rand(0..3) : @option[:type].to_i
      @op = ['+', '-', '*', '/' ]
      @option[:arc] = @option[:arc] ? @option[:arc].to_i : @option[:ar].to_i
      if @option[:arc] == 2
        @d = rand(10**(@level[:level]-1)...10**@level[:level])
        @o2 = @option[:type] == "4" ? rand(0..3) : @option[:type].to_i
        @pri = rand(0..1)
        case @pri
        when 0
          @o2 = @o2 == 3 ? rand(0..2) : @o2
          @c[e] = ope(ope(@a, @b, @o), @d, @o2)
          case @o
          when 2
            @q[e] = "#{@a} #{@op[@o]} #{@b} #{@op[@o2]} #{@d} ="
          when 3
            @q[e] = "#{ope(@a, @b, 2)} #{@op[@o]} #{@b} #{@op[@o2]} #{@d} ="
          else
            @q[e] = @o2 > 1 ? "(#{@a} #{@op[@o]} #{@b}) #{@op[@o2]} #{@d} =" : "#{@a} #{@op[@o]} #{@b} #{@op[@o2]} #{@d} ="
          end
        when 1
          @o = @o == 3 ? rand(0..2) : @o
          @c[e] = ope(@a, ope(@b, @d, @o2), @o)
          case @o2
          when 3
            @q[e] = "#{@a} #{@op[@o]} (#{ope(@b, @d, 2)} #{@op[@o2]} #{@d}) ="
          else
            @q[e] = @o == 2 ? "#{@a} #{@op[@o]} #{@b} #{@op[@o2]} #{@d} =" : "#{@a} #{@op[@o]} (#{@b} #{@op[@o2]} #{@d}) ="
          end
        end
      else
        @q[number] = "#{@a} #{@op[@o]} #{@b} ="
        @c[number] = ope(@a, @b, @o)
      end
    elsif 
      @a = params[:a]
      @q = params[:q]
      @c = params[:c]
      if @option[:arc] == 2
        @option[:arc] = @option[:arc] - 1
      else
        @option[:arc] = @option[:arc] == 1 ? @option[:arc] + 1 : @option[:arc]
      end
    end      
  end
  def create
    @a = params[:a]
    @q = params[:q]
    @c = params[:c]
    @option = params[:option]
    @count = params[:count]
    @level = params[:level]
    @r = 0
    @nu = @option[:nu].to_i
    @c = Array.new(@nu)
    (1...@nu).each do |e|
      @s = e.to_s
      if @a[@s] != "" && (@a[e].to_i == @c[e].to_i)
        @r += 1
        @c[e] = true
      else
        @c[e] = false
      end
    end
    @count[:count] = @count[:count].to_i + @nu - 1
    @count[:correct] = @count[:correct].to_i + @r
    cc = (@count[:correct].to_f / @count[:count].to_f)
    case 
    when cc > 0.8
      if @option[:arc] == 1
        @option[:arc] = 2
      elsif
        @level[:level] = @level[:level].to_i + 1
      end
    when cc < 0.2
      @level[:level] = @level[:level].to_i - 1
    end
  end
end
