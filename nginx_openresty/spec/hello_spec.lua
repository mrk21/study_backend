describe('a test', function()
  it('should succeed', function()
    assert.truthy(true)
  end)
  
  it('should fail', function()
    assert.truthy(false)
  end)
  
  it('should occer an error', function()
    error("invalid")
  end)
  
  it('should pend', function()
    pending('pending message')
  end)
end)
