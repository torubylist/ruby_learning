def maze_problem
  num = gets.chomp.to_i
  arr = Array.new
  ##build a maze,0 stands for allown,1 stands for forbidden.
  (0...num).each do |i|
    arr[i] = Array.new
    (0...num).each do |j|
      arr[i][j] = gets.to_i
    end
  end
  ##start point.
  startx,starty = gets.to_i, gets.to_i
  ## target point.
  targetx,targety = gets.to_i, gets.to_i
  book =  Array.new
  (0...num).each do |i|
    book[i] = Array.new
    (0...num).each do |j|
      book[i][j] = 0
    end
  end
  book[startx][starty] = 1
  @min = 0
  dfs(startx,starty,book, arr, 0,targetx,targety)
end
def dfs(sx,sy,book,arr,step,tx,ty)
  nex  = [[0,1],[1,0],[0,-1],[-1,0]] ##right,down,left,up
  if sx == tx && sy==ty
    if step < @min
      @min = step
    end
    return
  end
  (0..3).each do |i|
    x = sx + nex[i][0]
    y = sy + nex[i][1]
    if x < 1 || x >= arr.size || y < 0 || y >= arr.size
      next
    end
    if(arr[x][y] == 0 && book[x][y] == 0)
      book[x][y] = 1
      dfs(x,y,book,arr,step+1,tx,ty)
      book[x][y] = 0
    end
  end
end
p maze_problem
