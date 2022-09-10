defmodule Extut.DB do

  def my_login do
    {:ok, _pid} = MyXQL.start_link(username: "root")
  end

end
