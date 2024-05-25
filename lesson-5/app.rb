require_relative "cash_machine"
require "rack"

class App
  def call(env)
    req = Rack::Request.new(env)
    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    router(req.path, params)
  end
end

def cash_machine_controller(params)
  cash_machine = Account.new
  method = params['method']
  amount = params['amount'].to_i

  case method
  when 'deposit'
    cash_machine.deposit(amount)
  when 'withdraw'
    cash_machine.withdraw(amount)
  when 'balance'
    cash_machine.balance
  else
    "Неизвестная операция"
  end
end

def router(path, params)
  case path
  when '/'
    [200, { 'Content-Type' => 'text/html' }, ['Hello, world!']]
  when '/user'
    [200, { 'Content-Type' => 'text/html' }, ['Hello user!']]
  when '/cash_machine'
    response_text = cash_machine_controller(params)
    [200, { 'Content-Type' => 'text/html; charset=utf-8' }, [response_text]]
  else
    [404, { 'Content-Type' => 'text/html' }, ['404']]
  end
end