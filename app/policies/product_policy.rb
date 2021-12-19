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
    #  binding.pry
      !user.admin?
    end
  
    def new?
      create?
    end
  
    def update?
      true
    end
  
    def edit?
      update?
    end
  
    def destroy?
      true
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

    def update?
      user.admin? or not record.published?
    end
end
