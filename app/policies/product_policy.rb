class ProductPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    return create? if !@user.nil? && user.seller?

    false
  end

  def update?
    true
  end

  def edit?
    return update? if !@user.nil? && (user.seller? || user.admin?)

    false
  end

  def destroy?
    return true if !@user.nil? && (user.seller? || user.admin?)

    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
