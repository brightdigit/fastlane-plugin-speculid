describe Fastlane::Actions::SpeculidAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:error).with("Speculid is not installed. Please go to https://speculid.com to download and install.")

      Fastlane::Actions::SpeculidAction.run(nil)
    end
  end
end
