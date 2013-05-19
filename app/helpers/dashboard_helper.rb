module DashboardHelper
  def get_initials(requestor)
    content_tag :span, class: "initials" do 
      requestor.split(" ").collect {|name| name[0]}.join
    end
  end
end