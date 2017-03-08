class HTML 
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

  def create_board(board)
    "<table><tbody>" + rows(board) + "</tbody></table>" 
  end

  def rows(board)
    lines = board.cells.each_slice(board.dimension).to_a
    lines.each_with_index.map { |line, index| "<tr>" + cells(line, index, board.dimension) + "</tr>" }.join
  end

  def cells(line, row, dimension)
    start = row * dimension
    line.to_enum.with_index(start).map {|cell, id|"<td><a class='marks' href='/move?cell=#{id}'> #{cell} </a></td>" }.join
  end
end
