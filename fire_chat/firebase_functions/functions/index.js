const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

const admin = require('firebase-admin');
admin.initializeApp();

// function to add a message to the firebase realtime database
exports.addMessage = functions.https.onRequest(async (request, response) => {
    const original = request.query.text;

    const snapshot = await admin.database().ref('/chat').push({original : original, user: 'Firebase Function'});

    response.redirect(303, snapshot.ref.toString());
});

exports.makeUppercase = functions.database.ref('/chat/{pushId}/original')
    .onCreate((snapshot, context) => {
        const original = snapshot.val();
        console.log('Uppercaseing...',context.params.pushId, original);
        const uppercase = original.toUpperCase();
        return snapshot.ref.parent.child('original').set(uppercase);
    });

exports.printChat = functions.firestore.document('/chat/{pushId}').onCreate((snapshot, context) => {
    console.log(snapshot.data());
});