class ReviewPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.id == record.user_id
  end

  def update?
    user.id == record.user_id
  end

  def destroy?
    user.present?
  end

  private

    def review
      record
    end


end