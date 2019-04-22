tr0 = Train.new("TR0", "passenger", 10)
tr1 = Train.new("TR1", "passenger", 120)
tr2 = Train.new("TR2", "cargo", 100)

st1 = Station.new("st1")
finish = Station.new("finish")
start = Station.new("start")

route0 = Route.new(start, finish)
route0.add_station(st1)
tr0.route(route0)