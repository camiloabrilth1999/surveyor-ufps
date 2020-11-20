require 'rails_helper'

RSpec.describe AcademicProgram do
  describe "Database fields" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:faculty_id).of_type(:integer) }
  end

  describe "Database indexes" do
    it { should have_db_index(:faculty_id) }
  end

  it "Successful academic program creation" do
    Faculty.create!(name: "Ingenieria", code: "100")

    AcademicProgram.create(name: "Ingenieria de sistemas", code: "115", faculty_id: Faculty.first.id, email: "ingsistemas@ufps.edu.co")
    academic_program = AcademicProgram.create(name: "Ingenieria civil", code: "111", faculty_id: Faculty.first.id, email: "ingcivil@ufps.edu.co")
    academic_program_two = AcademicProgram.create(name: "Ingenieria civil", code: "111", faculty_id: Faculty.first.id, email: "ingcivil@ufps.edu.co")

    expect(academic_program_two.errors[:code]).to include(I18n.t("errors.messages.taken"))
    expect(academic_program_two.errors[:email]).to include(I18n.t("errors.messages.taken"))
    expect(AcademicProgram.last).to eq(academic_program)
  end
end
