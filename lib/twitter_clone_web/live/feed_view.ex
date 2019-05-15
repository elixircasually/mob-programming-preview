defmodule TwitterCloneWeb.FeedView do
  use Phoenix.LiveView
  alias TwitterClone.Model.Tweet

  def render(assigns) do
    ~L"""
    <div class="no-class">
      <%= for tweet <- @tweet_na do %>
        <div style="display: flex; background: #fff; box-shadow: 0 5px 5px rgba(0,0,0,0.3);">
          <p style="margin-bottom: 4px;"><%= tweet.text %></p>
        </div>
      <% end %>

      <form phx-submit="tweet">
        <input type="text" name="tweet_box" list="matches" placeholder="Search..."/>
        <input />
        <button type="submit">tweet</button>
      </form>
    </div>
    """
  end

  def mount(_session, socket) do
    tweets = Tweet.all()
    {:ok, assign(socket, tweet_na: tweets)}
  end

  def handle_event("tweet", %{"tweet_box" => tweet_text}, socket) do
    # send(self(), {:tweet_ja, tweet_text})
    # list_text = List.wrap(tweet_text)
    Tweet.insert(tweet_text)

    tweets = Tweet.all()

    {:noreply, assign(socket, tweet_na: tweets)}
  end

end
