require 'rails_helper'

RSpec.describe AcademicDepartament, type: :model do
  describe "Database fields" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:faculty_id).of_type(:integer) }
  end

  describe "Database indexes" do
    it { should have_db_index(:faculty_id) }
  end

  it "Successful academic program creation" do
    Faculty.create!(name: "CIENCIAS BASICAS", code: "100")

    AcademicDepartament.create(name: "Departamento Química", code: "115", faculty_id: Faculty.first.id)
    academic_departament = AcademicDepartament.create(name: "Departamento Matemáticas y Estad.", code: "120", faculty_id: Faculty.first.id)
    academic_departament_two = AcademicDepartament.create(name: "Departamento Matemáticas y Estad.", code: "120", faculty_id: Faculty.first.id)

    expect(academic_departament_two.errors[:code]).to include(I18n.t("errors.messages.taken"))
    expect(AcademicDepartament.last).to eq(academic_departament)
  end
end
