const admin = require("firebase-admin/app");
admin.initializeApp();

const handleSubscriptionEvent = require("./handle_subscription_event.js");
exports.handleSubscriptionEvent =
  handleSubscriptionEvent.handleSubscriptionEvent;
