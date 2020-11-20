require 'rails_helper'

RSpec.describe Faculty do
  describe "Database fields" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:code).of_type(:string) }
  end

  it "Successful faculty creation" do
    Faculty.create(name: "Ingenieria", code: "115")
    faculty = Faculty.create(name: "Educación, Artes y Humanidades", code: "111")
    faculty_two = Faculty.create(name: "Educación, Artes y Humanidades", code: "111")

    expect(faculty_two.errors[:code]).to include(I18n.t("errors.messages.taken"))
    expect(Faculty.last).to eq(faculty)
  end
end
