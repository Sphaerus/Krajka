class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
  
  private
  
  def admin?
    @user.admin?
  end
  
  def record_owner?
    if record.is_a?(Array)
      record.all? {|record| record.user_id == @user.id}
    else
      record.user_id == @user.id
    end
  end
end

