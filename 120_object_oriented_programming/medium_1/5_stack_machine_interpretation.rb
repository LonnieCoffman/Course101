class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  VALID_OPS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT).freeze
  EMPTY_STACK_MSG = 'Empty stack!'.freeze
  INVALID_TOKEN_MSG = 'Invalid token:'.freeze

  def initialize(operation)
    @operation = operation
    @register = 0
    @stack = []
  end

  def eval
    @operation.split.each do |op|
      if op.to_i.to_s == op
        @register = op.to_i
      elsif VALID_OPS.include? op
        send op.downcase
      else
        raise BadTokenError, INVALID_TOKEN_MSG + " #{op}"
      end
    end
  rescue MinilangRuntimeError => error
    puts error.message
  end

  def print; puts @register end
  def push;  @stack << @register end
  def div;   @register /= @stack.pop end
  def mult;  @register *= @stack.pop end
  def add;   @register += @stack.pop end
  def mod;   @register %= @stack.pop end
  def sub;   @register -= @stack.pop end

  def pop
    raise EmptyStackError, EMPTY_STACK_MSG if @stack.empty?
    @register = @stack.pop
  end
end

Minilang.new('PRINT').eval
# 0
#
Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15
#
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8
#
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5
#
Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!
#
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6
#
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12
#
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB
#
Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8
#
Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
