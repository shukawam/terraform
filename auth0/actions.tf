resource "auth0_action" "add_groups_claim" {
  name    = "Add groups claim to ID token"
  code    = file("./scripts/add-groups-claim-to-id-token.js")
  runtime = "node22"
  deploy  = true
  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

resource "auth0_trigger_actions" "post_login_flow" {
  trigger = "post-login"
  actions {
    id           = auth0_action.add_groups_claim.id
    display_name = auth0_action.add_groups_claim.name
  }
}
