
require 'minitest/autorun'
require_relative '/home/ec2-user/environment/改札機/gate'
require_relative '/home/ec2-user/environment/改札機/ticket'

class GateTest < Minitest::Test
  def setup
    @uweno = Gate.new(:uweno)
    @kanda = Gate.new(:kanda)
    @tokyo = Gate.new(:tokyo)
  end
  
  def test_uweno_to_kanda
    ticket = Ticket.new(140)
    @uweno.enter(ticket)
    assert @kanda.exit(ticket)
  end
  
  def test_uweno_to_tokyo_when_fare_is_not_enough
    ticket = Ticket.new(140)
    @uweno.enter(ticket)
    refute @tokyo.exit(ticket)
  end
  
  def test_uweno_to_tokyo_when_fare_is_enough
    ticket = Ticket.new(160)
    @uweno.enter(ticket)
    assert @tokyo.exit(ticket)
  end
  
  def test_kanda_to_tokyo
    ticket = Ticket.new(140)
    @kanda.enter(ticket)
    assert @tokyo.exit(ticket)
  end
end