describe('String#plural?') do
  it('returns true if the string is plural') do
    expect('many butterflies'.plural?()).to(eq(true))
  end
  it('returns false if the string is not plural') do
    expect('one butterfly'.plural?()).to(eq(false))
  end
end
