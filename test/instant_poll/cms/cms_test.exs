defmodule InstantPoll.CMSTest do
  use InstantPoll.DataCase

  alias InstantPoll.CMS

  describe "polls" do
    alias InstantPoll.CMS.Poll

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def poll_fixture(attrs \\ %{}) do
      {:ok, poll} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_poll()

      poll
    end

    test "list_polls/0 returns all polls" do
      poll = poll_fixture()
      assert CMS.list_polls() == [poll]
    end

    test "get_poll!/1 returns the poll with given id" do
      poll = poll_fixture()
      assert CMS.get_poll!(poll.id) == poll
    end

    test "create_poll/1 with valid data creates a poll" do
      assert {:ok, %Poll{} = poll} = CMS.create_poll(@valid_attrs)
    end

    test "create_poll/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_poll(@invalid_attrs)
    end

    test "update_poll/2 with valid data updates the poll" do
      poll = poll_fixture()
      assert {:ok, poll} = CMS.update_poll(poll, @update_attrs)
      assert %Poll{} = poll
    end

    test "update_poll/2 with invalid data returns error changeset" do
      poll = poll_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_poll(poll, @invalid_attrs)
      assert poll == CMS.get_poll!(poll.id)
    end

    test "delete_poll/1 deletes the poll" do
      poll = poll_fixture()
      assert {:ok, %Poll{}} = CMS.delete_poll(poll)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_poll!(poll.id) end
    end

    test "change_poll/1 returns a poll changeset" do
      poll = poll_fixture()
      assert %Ecto.Changeset{} = CMS.change_poll(poll)
    end
  end
end
