
require "bank"

function assert_equals(expected, received)
    if expected ~= received then
        local msg = string.format("'%s' should be equal to '%s'",
                                  tostring(expected), tostring(received))
        assert(false, msg)
    end
    io.write(".")
end

anonymous_account = bank.Account:new()
assert_equals("Anonimous", anonymous_account.owner)

ac1 = bank.Account:new{owner="Igor"}
assert_equals("Account {owner = Igor, balance = 0}", tostring(ac1))
assert_equals("Igor", ac1.owner)
assert_equals(0, ac1.balance)

ac2 = bank.Account:new{owner="Joh", balance=20.00}
assert_equals("Joh", ac2.owner)
assert_equals(20.00, ac2.balance)
assert_equals("Account {owner = Joh, balance = 20}", tostring(ac2))

ac2:deposit(40)
assert_equals(60.00, ac2.balance)

ac2:withdraw(30)
assert_equals(30.00, ac2.balance)

assert_equals("Account {owner = Igor, balance = 0}", tostring(ac1))


bonus_account1 = bank.BonusAccount:new()
assert_equals("Anonimous", bonus_account1.owner)
assert_equals(10.00, bonus_account1.balance)

bonus_account1:deposit(30)
assert_equals(50.00, bonus_account1.balance)

print("")
