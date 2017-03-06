class HTML 
  def initialize(board)
    @board = board
  end

  def header
    "<!doctype html><html lang=''><head><meta charset='utf-8'><title></title>\ #{css}</head>"
  end

  def css
    "<style>
    @import url(https://fonts.googleapis.com/css?family=Oswald);
    body { background: rgb(34, 42, 65); color: #fff; text-align: center; }
    td { height: 300px; width: 300px; text-align: center; border: 2px solid #fff; }
    table { border-collapse: collapse; margin: 0 auto; }
    a { text-decoration: none; color: #fff; }
    .marks {
      font-family: 'Oswald';
      text-transform: uppercase;
      font-size: 20px;
      font-weight: 400;
      line-height: 24px;
      margin: 3px 0;
    }
    </style>"
  end

  def body(content)
    "<body>#{content}</body></html>"
  end

  def create_board
    "<table><tbody>" + rows + "</tbody></table>" 
  end

  def rows
    lines = @board.cells.each_slice(3).to_a
    lines.each_with_index.map { |line, index| "<tr>" + cells(line, index) + "</tr>" }.join
  end

  def cells(line, row)
    start = row * 3
    line.to_enum.with_index(start).map {|cell, id|"<td><a class='marks' href='/move?number=#{id}'> #{cell} </a></td>" }.join
  end
end
