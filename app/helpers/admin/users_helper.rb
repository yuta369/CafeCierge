module Admin::UsersHelper
  def status_class(status)
    case status
    when 'active'
      'status-active'
    when 'inactive'
      'status-inactive'
    when 'suspended'
      'status-suspended'
    else
      'status-unknown'
    end
  end
end
