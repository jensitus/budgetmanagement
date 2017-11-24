App.households = App.cable.subscriptions.create "HouseholdsChannel",
  collection: -> $("[data-channel='new_expense']")

  connected: ->
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    console.log "data: ", data
    @collection().append @renderExpense(data)

  followCurrentMessage: ->
    if householdId = @collection().data('household-id')
      @perform( 'follow', household_id: householdId )
    else
      @perform 'unfollow'

  renderExpense: (data) ->
    '<div class=\'alert alert-warning\'><span>' + data.user + ' added an expense </span><br>' + @renderAmount(data.amount) + ' € <b>::</b> ' + data.description + '</div>'

  renderAmount: (amount) ->
    console.log "Amount:", amount
    parseFloat(amount).toFixed(2)

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.households.followCurrentMessage()
