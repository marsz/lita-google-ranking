require "spec_helper"

describe Lita::Handlers::GoogleRanking, :lita_handler => true do

  context "#gr" do

    it "success" do
      send_command("gr apple.com mac")
      expect(replies.size).to be > 0
      expect(replies.first).not_to match("doesn't")
      expect(replies.first).to match(" is ")
    end


  end
end
