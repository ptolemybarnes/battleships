require './lib/game'
require './lib/board'

rules_array = [
  nil, #0
  nil, #1
  3, #2
  3, #3
  2, #4
  0, #5
]

build_plan = [[0,1],[0,2],[0,3],[0,4]]
build_plan_of_5 = [[0,1],[0,2],[0,3],[0,4],[0,5]]
build_plan_of_2 = [[0,1],[0,2]]

describe Game do 
  let(:rules)    { double(:rules, get_rules: rules_array)}
  let(:game)     { Game.new(rules.get_rules)}
  let(:player)   { Player.new rules_array }
end