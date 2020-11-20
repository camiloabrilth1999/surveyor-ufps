require 'rails_helper'

RSpec.describe User do
  describe "Database fields" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:uuid).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:lastname).of_type(:string) }
    it { should have_db_column(:document_number).of_type(:string) }
    it { should have_db_column(:contact_number).of_type(:string) }
    it { should have_db_column(:identification_type_id).of_type(:integer) }
    it { should have_db_column(:academic_departament_id).of_type(:integer) }
    it { should have_db_column(:academic_program_id).of_type(:integer) }
  end

  describe "Database indexes" do
    it { should have_db_index(:academic_departament_id) }
    it { should have_db_index(:academic_program_id) }
    it { should have_db_index(:identification_type_id) }
  end

  it "Successful user creation" do
    IdentificationType.create!(description: "Cedula de ciudadania", summary_description: "CC")

    User.create(email: "camiloabrilth1999@gmail.com", password: "123456789", name: "Camilo Andres", lastname: "Obando Abril", document_number: "1234567890", contact_number: "3186996123", code: "1151493", identification_type_id: IdentificationType.first.id)

    user = User.create(email: "camiloabrilth1999@gmail.com", password: "123456789", name: "Juan", lastname: "Fernandez", document_number: "1234567890", contact_number: "3186996124", code: "1151493", identification_type_id: IdentificationType.first.id)

    expect(user.errors[:email]).to include(I18n.t("errors.messages.taken"))
    expect(user.errors[:code]).to include(I18n.t("errors.messages.taken"))
    expect(user.errors[:document_number]).to include(I18n.t("errors.messages.taken"))
  end
end
