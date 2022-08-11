require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    user = User.create(name: 'Ritta', email: 'ritta@example.com', password: '123456')
    subject { Expense.new(author_id: user, name: 'Fish', amount: 35) }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the amount is not blank' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'check if amount is numeric' do
      subject.amount = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if amount is equal or greater than one' do
      expect(subject.amount).to be >= 1
    end
  end
end
