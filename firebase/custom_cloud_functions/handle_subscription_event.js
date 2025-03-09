const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.handleSubscriptionEvent = functions.firestore
  .document("events/{eventId}")
  .onCreate(async (snap, context) => {
    const eventData = snap.data();
    const subscriptionType = eventData.type;
    const userId = eventData.app_user_id;

    let newSubscriptionType = null;

    const expirationTimestamp = eventData.expiration_at_ms;
    const gracePeriodMs = 5 * 24 * 60 * 60 * 1000;
    const now = Date.now();

    if (expirationTimestamp && now > expirationTimestamp + gracePeriodMs) {
      newSubscriptionType = "free";
    } else {
      switch (subscriptionType) {
        case "RENEWAL":
          return null;

        case "CANCELLATION":
          newSubscriptionType = "free";
          break;

        case "INITIAL_PURCHASE":
          const entitlementIds = eventData.entitlement_ids;
          if (entitlementIds && entitlementIds.length > 0) {
            newSubscriptionType = entitlementIds[0];
          } else {
            console.error("No entitlement ID found for INITIAL_PURCHASE");
            return null;
          }
          break;

        case "EXPIRATION":
          if (
            expirationTimestamp &&
            now > expirationTimestamp + gracePeriodMs
          ) {
            newSubscriptionType = "free";
          } else {
            console.log("Subscription is still within the grace period.");
            return null;
          }
          break;

        default:
          console.error("Unhandled subscription type:", subscriptionType);
          return null;
      }
    }

    if (newSubscriptionType) {
      const userDocRef = admin.firestore().collection("users").doc(userId);
      try {
        await userDocRef.update({
          subscription_type: newSubscriptionType,
        });
        console.log(
          `Subscription type updated to ${newSubscriptionType} for user ${userId}`,
        );
      } catch (error) {
        console.error("Error updating subscription type:", error);
      }
    }
  });
