resource "auth0_action" "add_groups_claim" {
  name    = "Add groups claim to ID token"
  code    = file("./scripts/add-groups-claim-to-id-token.js")
  runtime = "node22"
  deploy  = true
  supported_triggers {
    id      = "post-login"
    version = "Version 1"
  }
}
