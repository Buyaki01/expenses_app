require 'rails_helper'

RSpec.describe HomePage, type: :model do
  user = User.create(name: 'Ritta', email: 'ritta@example.com', password: '123456')
  subject { HomePage.new(user_id: user, name: 'Food', icon: 'app/assets/images/makeup.jpg') }

  before { subject.save }

  it 'check the name is not blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'check the icon is not blank' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
