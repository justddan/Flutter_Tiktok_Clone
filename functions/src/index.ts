import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';

admin.initializeApp();

export const onVideoCreated = functions.firestore.document('videos/{vidoId}').onCreate(async (snapshot, context) => {
  snapshot.ref.update({ thumbnailUrl: 'from functions' });
});
