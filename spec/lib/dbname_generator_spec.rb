require "spec_helper"

describe DbnameGenerator do
  describe "Rails.dbname" do
    before { Grit::Head.any_instance.stub(:name) { "gems" } }
    subject { Rails }
    it { should respond_to(:dbname) }
    it { subject.dbname[:development].should eq "object_development_gems" }
    it { subject.dbname[:test].should eq "object_test_gems" }
  end

  describe ".generate" do
    subject { DbnameGenerator.generate[:development] }
    context "current directory is git repository" do
      before { DbnameGenerator.stub(:repository) { nil } }
      it { should eq "object_development" }
    end
    context "current directory is not git repository" do
      before { DbnameGenerator.stub(:repository) { "gems" } }
      it { should eq "object_development_gems" }
    end
  end

  describe ".repository" do
    subject { DbnameGenerator.repository }
    context "current directory is git repository" do
      before { Grit::Head.any_instance.stub(:name) { nil } }
      it { should be_nil }
    end
    context "current directory is not git repository" do
      before { Grit::Head.any_instance.stub(:name) { "gems" } }
      it { should eq "gems" }
    end
  end

  describe ".project" do
    subject { DbnameGenerator.project }
    it { should eq "object" }
  end
end
