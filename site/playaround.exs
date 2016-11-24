# alias App.Repo
# alias App.User
# Repo.insert(%User{first_name: "duy", last_name: "le", email: "duyleminh1402+6@gmail.com", password: "123"})

# u = Repo.get User, "3"
# u.first_name


defmodule MyList do
  import App.Utils.Extension

  extends List

  def flatten(_) do
    IO.puts "Overriden flatten"
  end
end

IO.inspect MyList.delete([1,2,3], 3)
MyList.flatten([1,2,3])



# Test create user
alias App.Model.User
use Timex

user_params = %{"birthdate" => "11/21/2015", "city" => "Ha Noi", "country" => "Viet Nam", "email" => "hh@hh.com", "first_name" => "hh", "gender" => "female", "last_name" => "hh", "password" => "123456", "password_confirmation" => "123456"}
{_, birthdate} = DateFormat.parse(user_params["birthdate"], "%m/%d/%Y", :strftime)

changeset = User.sign_up_changeset(%User{}, user_params)
changeset = Ecto.Changeset.put_change(changeset, :birthdate, birthdate)

IO.inspect Ecto.Changeset.get_field(changeset, :birthdate)
App.Repo.insert(changeset)

DateFormat.format!(birthdate, "{YYYY}-{0M}-{0D}")

DateFormat.parse(user_params["birthdate"], "%m/%d/%Y", :strftime) |> DateFormat.format!("{ISO}")



alias App.Model.User
use Timex

user_params = %{"birthdate" => "11/26/2015", "city" => "Ha Noi", "country" => "Viet Nam", "email" => "hh@hh.com", "first_name" => "hh", "gender" => "female", "last_name" => "hh", "password" => "123456", "password_confirmation" => "123456"}
changeset = User.sign_up_changeset(%User{}, user_params)
App.Repo.insert(changeset)


# Test send GCM
alias App.Utils.GCM
GCM.send(["APA91bHtt2swOI5PAopRW_OMq0tAaWPuVjadXGxL6nIVP1YK3F44qYXwed0oStErmMv4hvpHeCfxYF5PCwXglccNXcO6jm_QUbIO6DPAVs9-zxJBWwRm3Lc"], "Test Notification", "This is the test body")


c = App.Repo.get(App.Model.Campaign, 2)
App.Model.Base.front_end_url(App.Repo.get(App.Model.Campaign, 2))


alias App.Utils.Mail

template_name = "test-whaa"
# to = [[email: "hathietthu2010@gmail.com", name: "Toan Ha"], [email: "duy.n@mobius.vn", name: "Duy Ng"]]
to = [email: "duyleminh1402@gmail.com", name: "Duy Le"]
vars = [[name: "name", content: "TEST NAME"],[name: "test_param", content: "HELLO THIS IS TEST EMAIL BY MANDRILL CODE"]]
Mail.send(template_name, "Test whaa email", to, vars)

App.Utils.Mailchimp.subscribed("d5a778b4e3", "httoan.hcmus@gmail.com")
App.Utils.Mailchimp.unsubscribed("d5a778b4e3", "httoan.hcmus@gmail.com")




query_data = %{"event" => "Campaign viewed", "from_date" => "2015-10-10", "to_date" => "2016-01-01", "unit" => "hour"}
auth_data = {"7e9eb75e70a4dab36c5c87ec353a596d", "745726f987a62980d60e0c3c7c29e21d"}
App.Utils.Mixpanel.DataClient.fetch("segmentation", query_data, auth_data)


