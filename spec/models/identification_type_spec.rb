require 'rails_helper'

RSpec.describe IdentificationType do
  describe "Database fields" do
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:summary_description).of_type(:string) }
  end
  
  it "Successful identification type creation" do
    IdentificationType.create(description: "Cedula de ciudadania", summary_description: "CC")
    it_one = IdentificationType.create(description: "Cedula de ciudadania", summary_description: "CC")
    it_two = IdentificationType.create(description: "Tarjeta de identidad", summary_description: "TI")

    expect(it_one.errors[:summary_description]).to include(I18n.t("errors.messages.taken"))
    expect(IdentificationType.last).to eq(it_two)
  end
end
