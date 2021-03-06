require './lib/cell'
require 'pry'

class Board

  attr_accessor :cells, :cell_names

  def initialize
    @cell_names = {
      :A1 => Cell.new('A', '1'), :A2 => Cell.new('A', '2'), :A3 => Cell.new('A', '3'), :A4 => Cell.new('A', '4'),
      :B1 => Cell.new('B', '1'), :B2 => Cell.new('B', '2'), :B3 => Cell.new('B', '3'), :B4 => Cell.new('B', '4'),
      :C1 => Cell.new('C', '1'), :C2 => Cell.new('C', '2'), :C3 => Cell.new('C', '3'), :C4 => Cell.new('C', '4'),
      :D1 => Cell.new('D', '1'), :D2 => Cell.new('D', '2'), :D3 => Cell.new('D', '3'), :D4 => Cell.new('D', '4')
    }
  end

  def display
    @cells = [ [["O"],["1"],["2"],["3"],["4"]],
              [["A"], @cell_names[:A1].display, @cell_names[:A2].display, @cell_names[:A3].display, @cell_names[:A4].display],
              [["B"], @cell_names[:B1].display, @cell_names[:B2].display, @cell_names[:B3].display, @cell_names[:B4].display],
              [["C"], @cell_names[:C1].display, @cell_names[:C2].display, @cell_names[:C3].display, @cell_names[:C4].display],
              [["D"], @cell_names[:D1].display, @cell_names[:D2].display, @cell_names[:D3].display, @cell_names[:D4].display] ]
    p "=============================="
    p @cells[0]
    p @cells[1]
    p @cells[2]
    p @cells[3]
    p @cells[4]
    p "=============================="

  end


end
