class AddressPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    record_owner?
  end

  def update?
    record_owner?
  end

  def edit?
    update?
  end

  def destroy?
    record_owner?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end