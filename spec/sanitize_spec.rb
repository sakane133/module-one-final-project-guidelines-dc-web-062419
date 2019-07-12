require_relative "../app/sanitize.rb"

describe "sanitize" do

    it "strips forward slashes from user input" do
        expect(sanitize("aaa/bbb")).to eq("aaabbb")
    end

end
