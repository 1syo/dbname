require "spec_helper"

describe Dbname do
  describe ".env" do
    subject { Dbname.env[:development] }
    context "current directory is git repository" do
      before { Dbname.stub(:branch_name) { nil } }
      it { should eq "object_development" }
    end
    context "current directory is not git repository" do
      before { Dbname.stub(:branch_name) { "gems" } }
      it { should eq "object_development_gems" }
    end
  end

  describe ".branch_name" do
    subject { Dbname.branch_name }
    context "current directory is git repository" do
      before { Grit::Repo.stub_chain(:new, :head, :name) { nil } }
      it { should be_nil }
    end
    context "current directory is not git repository" do
      before { Grit::Repo.stub_chain(:new, :head, :name) { "gems" } }
      it { should eq "gems" }
    end
  end

  describe ".project_name" do
    subject { Dbname.project_name }
    it { should eq "object" }
  end
end
