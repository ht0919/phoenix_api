defmodule Api.JsonTest do
  use Api.DataCase

  alias Api.Json

  describe "posts" do
    alias Api.Json.Post

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Json.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Json.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Json.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Json.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Json.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Json.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.body == "some updated body"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Json.update_post(post, @invalid_attrs)
      assert post == Json.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Json.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Json.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Json.change_post(post)
    end
  end
end
