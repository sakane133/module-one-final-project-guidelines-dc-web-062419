require_relative "../app/modules/sanitize.rb"

describe "sanitize" do

  let(:dummy_class) { Class.new { extend Sanitize } }

    it "strips forward slashes from user input" do
        expect(dummy_class.sanitize("aaa/bbb")).to eq("aaabbb")
    end

end
