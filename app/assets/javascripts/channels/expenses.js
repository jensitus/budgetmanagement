// App.expenses = App.cable.subscriptions.create('ExpensesChannel', {
//     received: function (data) {
//         $("#new_expense").removeClass('hidden');
//         return $("#new_expense").append(this.renderExpense(data));
//     },
//
//     renderExpense: function (data) {
//         return "<div class='alert alert-warning'> <b>" +
//             data.user + ": </b>" +
//             data.expense + ": " + "<br>" + data.household +  "</div>";
//     }
// });


