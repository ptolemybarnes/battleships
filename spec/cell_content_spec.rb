require './lib/cell_content'

describe CellContent do

  let(:cellcontent) { CellContent.new([5.x,5.y]) }

  context 'when created' do
    it 'has a location' do
      expect(cellcontent.location).to eq([5.x,5.y])
    end
  end
end


class Integer

  def x
    self
  end

  def y
    self
  end

end

