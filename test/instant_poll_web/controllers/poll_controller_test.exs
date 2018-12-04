defmodule InstantPollWeb.PollControllerTest do
  use InstantPollWeb.ConnCase

  alias InstantPoll.Polls

  @create_attrs %{archived: true, name: "some name"}
  @update_attrs %{archived: false, name: "some updated name"}
  @invalid_attrs %{archived: nil, name: nil}

  def fixture(:poll) do
    {:ok, poll} = Polls.create_poll(@create_attrs)
    poll
  end

  describe "index" do
    test "lists all polls", %{conn: conn} do
      conn = get conn, poll_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Polls"
    end
  end

  describe "new poll" do
    test "renders form", %{conn: conn} do
      conn = get conn, poll_path(conn, :new)
      assert html_response(conn, 200) =~ "New Poll"
    end
  end

  describe "create poll" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, poll_path(conn, :create), poll: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == poll_path(conn, :show, id)

      conn = get conn, poll_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Poll"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, poll_path(conn, :create), poll: @invalid_attrs
      assert html_response(conn, 200) =~ "New Poll"
    end
  end

  describe "edit poll" do
    setup [:create_poll]

    test "renders form for editing chosen poll", %{conn: conn, poll: poll} do
      conn = get conn, poll_path(conn, :edit, poll)
      assert html_response(conn, 200) =~ "Edit Poll"
    end
  end

  describe "update poll" do
    setup [:create_poll]

    test "redirects when data is valid", %{conn: conn, poll: poll} do
      conn = put conn, poll_path(conn, :update, poll), poll: @update_attrs
      assert redirected_to(conn) == poll_path(conn, :show, poll)

      conn = get conn, poll_path(conn, :show, poll)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, poll: poll} do
      conn = put conn, poll_path(conn, :update, poll), poll: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Poll"
    end
  end

  describe "delete poll" do
    setup [:create_poll]

    test "deletes chosen poll", %{conn: conn, poll: poll} do
      conn = delete conn, poll_path(conn, :delete, poll)
      assert redirected_to(conn) == poll_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, poll_path(conn, :show, poll)
      end
    end
  end

  defp create_poll(_) do
    poll = fixture(:poll)
    {:ok, poll: poll}
  end
end
