require "spec_helper"

describe "remotefile_v2_test::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '14.04'
    ).converge(described_recipe)
  end

  describe "create file[/var/local/bar.txt]" do
    it "returns the stubbed value" do
      #expect(chef_run).to create_remote_file("/var/local/bar.txt")
      expect(chef_run).to render_file("/var/local/bar.txt")
        # .with_content(/this should be wrong/)
    end
  end

  describe "create file[/var/local/foo.txt]" do
    it "returns the stubbed value" do
      expect(chef_run).to create_remote_file("/var/local/foo.txt")
      expect(chef_run).to render_file("/var/local/foo.txt")
        .with_content(/this should be wrong/)


    end
  end

end
