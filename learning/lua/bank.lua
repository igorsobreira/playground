
module("bank", package.seeall)

Account = {owner = "Anonimous", balance = 0}

function Account:new(account)
    account = account or {}
    -- Account works as the prototype and is the
    -- metatable of it's clones
    self.__index = self
    setmetatable(account, self)
    return account
end

function Account:__tostring()
    return "Account {owner = "..self.owner..
           ", balance = "..self.balance.."}"
end

function Account:withdraw(v)
    self.balance = self.balance - v
end

function Account:deposit(v)
    self.balance = self.balance + v
end


BonusAccount = Account:new{balance = 10}

function BonusAccount:deposit(v)
    self.balance = self.balance + v + 10.00
end
