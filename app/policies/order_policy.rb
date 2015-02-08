class OrderPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
  
  def all_orders?
    admin?
  end

  def index?
    admin || own_record?
  end

  def show?
    admin? || own_record?
  end

  def update?
    admin? || own_record?
  end

  def edit?
    update?
  end

  def destroy?
    admin? || own_record?
  end
  
  def confirm_order_by_user?
    own_record?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end