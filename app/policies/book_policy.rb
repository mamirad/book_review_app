class BookPolicy < ApplicationPolicy

  def index?
    user.present?
  end

 
  def update?
    user.present?
  end

  def destroy?
    user.present?
  end

  private

    def book
      record
    end


end