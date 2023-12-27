
return {
  'RRethy/vim-illuminate',
  config = function ()
    require('illuminate').configure({
      under_cursor = false,
      delay = 0,
    })
  end
}
