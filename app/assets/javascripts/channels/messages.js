$(function() {
  App.messages = App.cable.subscriptions.create({channel: 'MessagesChannel', id: $('#conversation_id').val() }, {
    received: function(data) {
      $('#new_message')[0].reset();
      $('#chat').prepend(data.message);
    }
  });
}); 