
days = {"seg", "ter", "qua", "qui", "sex"}
rev_days = {}

for d, day in pairs(days) do
    rev_days[day] = d
end
result = pairs(rev_days)
--print(result)

for i,v in next, days do
    print(i, v)
end
