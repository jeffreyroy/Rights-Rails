require 'rails_helper'


RSpec.describe Case, type: :model do
  it "has a valid factory" do
    create(:issue)
    create(:case).should be_valid
  end

  describe "attributes" do
    it { should have_db_column(:issue_id) }
    it { should have_db_column(:name) }
    it { should have_db_column(:date_decided) }
    it { should have_db_column(:cite1) }
    it { should have_db_column(:cite2) }
  end

  describe "associations" do
    it { should have_many(:opinions) }
    it { should belong_to(:issue) }
  end

  # describe "methods" do
  #   let(:c) { Case.new }
  #   it "returns a full citation" do
  #     expect(c.full_citation).to be_a(String)
  #   end
  # end
end