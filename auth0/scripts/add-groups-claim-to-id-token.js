/**
 * Handler that will be called during the execution of a PostLogin flow.
 *
 * @param {Event} event - Details about the user and the context in which they are logging in.
 * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
 */
exports.onExecutePostLogin = async (event, api) => {
    if (api.rules.wasExecuted('rul_SBcgkrGKICjwOyML')) {
        return;
    }

    const namespace = 'https://shukawam.me/';
    api.idToken.setCustomClaim(namespace + 'groups', event.user.app_metadata['groups'])
};
