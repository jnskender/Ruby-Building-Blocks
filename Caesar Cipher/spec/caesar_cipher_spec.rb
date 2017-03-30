require 'caesar_cipher.rb'


describe "caesar_cipher" do
  it "shifts a letter by a given key" do
    expect(caesar_cipher("a",1)).to eq("b")
  end

  it "wraps from z to a" do
    expect(caesar_cipher("z",1)).to eq("a")
  end

  it "shifts a phrase" do
    expect(caesar_cipher("abc",5)).to eq("fgh")
  end

  it "handles spaces" do
    expect(caesar_cipher("a b c", 1)).to eq("b c d")
  end

  it "can shift in reverse" do
    expect(caesar_cipher("a",-1)).to eq("z")
  end

end
